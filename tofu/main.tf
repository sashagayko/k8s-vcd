provider "vcd" {
  user                 = var.vcd_user
  password             = var.vcd_pass
  auth_type            = "integrated"
  org                  = var.org_name
  vdc                  = var.vdc_name
  url                  = var.vcd_url
  max_retry_timeout    = 120
  allow_unverified_ssl = true
}

data "vcd_catalog" "template_catalog" {
  org  = var.org_name
  name = var.catalog_name
}

data "vcd_catalog_vapp_template" "node_template" {
  org        = var.org_name
  catalog_id = data.vcd_catalog.template_catalog.id
  name       = var.template_name
}

data "vcd_network_routed_v2" "cluster_net" {
  org  = var.org_name
  vdc  = var.vdc_name
  name = var.network_name
}

resource "vcd_vapp" "k8s_cluster" {
  name = "k8s-cluster-vapp"
}

resource "vcd_vapp_org_network" "vapp_network" {
  vapp_name        = vcd_vapp.k8s_cluster.name
  org_network_name = data.vcd_network_routed_v2.cluster_net.name
  is_fenced        = false
  reboot_vapp_on_removal = true
}

resource "vcd_vapp_vm" "control_plane" {
  vapp_name        = vcd_vapp.k8s_cluster.name
  name             = "control-1"
  vapp_template_id = data.vcd_catalog_vapp_template.node_template.id
  memory           = var.control_plane_ram
  cpus             = var.control_plane_cpu
  cpu_cores        = 1

  network {
    type               = "org"
    name               = vcd_vapp_org_network.vapp_network.org_network_name
    ip_allocation_mode = "MANUAL"
    ip                 = var.control_plane_ip
    is_primary         = true
  }

  customization {
    initscript = <<-EOF

hostnamectl set-hostname control-1
echo "control-1 initialized" > /etc/node-info
EOF
  }

  depends_on = [vcd_vapp_org_network.vapp_network]
}

resource "vcd_vapp_vm" "worker_1" {
  vapp_name        = vcd_vapp.k8s_cluster.name
  name             = "worker-1"
  vapp_template_id = data.vcd_catalog_vapp_template.node_template.id
  memory           = var.worker_ram
  cpus             = var.worker_cpu
  cpu_cores        = 1

  network {
    type               = "org"
    name               = vcd_vapp_org_network.vapp_network.org_network_name
    ip_allocation_mode = "MANUAL"
    ip                 = var.worker1_ip
    is_primary         = true
  }

  customization {
    initscript = <<-EOF

hostnamectl set-hostname worker-1
echo "worker-1 initialized" > /etc/node-info
EOF
  }

  depends_on = [vcd_vapp_org_network.vapp_network]
}

resource "vcd_vapp_vm" "worker_2" {
  vapp_name        = vcd_vapp.k8s_cluster.name
  name             = "worker-2"
  vapp_template_id = data.vcd_catalog_vapp_template.node_template.id
  memory           = var.worker_ram
  cpus             = var.worker_cpu
  cpu_cores        = 1

 network {
    type               = "org"
    name               = vcd_vapp_org_network.vapp_network.org_network_name
    ip_allocation_mode = "MANUAL"
    ip                 = var.worker2_ip
    is_primary         = true
  }

  customization {
    initscript = <<-EOF

hostnamectl set-hostname worker-2
echo "worker-2 initialized" > /etc/node-info
EOF
  }

  depends_on = [vcd_vapp_org_network.vapp_network]
}

output "control_plane_ip" {
  value = vcd_vapp_vm.control_plane.network[0].ip
}

output "worker1_ip" {
  value = vcd_vapp_vm.worker_1.network[0].ip
}

output "worker2_ip" {
  value = vcd_vapp_vm.worker_2.network[0].ip
}
