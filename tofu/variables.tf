variable "vcd_user" {
  description = "Username for vCloud Director"
  type        = string
  default     = "my-name"
}

variable "vcd_pass" {
  description = "Password for vCloud Director"
  type        = string
  sensitive   = true
}

variable "vcd_url" {
  description = "vCloud Director API URL"
  type        = string
  default     = "https://devcloud.nces.by/api"
}

variable "org_name" {
  description = "Organization name"
  type        = string
  default     = "GAYKO"
}

variable "vdc_name" {
  description = "VDC name"
  type        = string
  default     = "GAYKO"
}

variable "edge_gateway" {
  description = "Edge Gateway name"
  type        = string
  default     = "GAYKO"
}

variable "network_name" {
  description = "Network name for VMs"
  type        = string
  default     = "Local(GAYKO)"
}

variable "catalog_name" {
  description = "Catalog name with VM template"
  type        = string
  default     = "GAYKO"
}

variable "template_name" {
  description = "VM template name"
  type        = string
  default     = "template-small"
}

variable "control_plane_ip" {
  description = "IP address for control plane node"
  type        = string
  default     = "192.168.1.61"
}

variable "worker1_ip" {
  description = "IP address for worker node 1"
  type        = string
  default     = "192.168.1.62"
}

variable "worker2_ip" {
  description = "IP address for worker node 2"
  type        = string
  default     = "192.168.1.63"
}

variable "control_plane_cpu" {
  description = "Number of CPUs for control plane"
  type        = number
  default     = 2
}

variable "control_plane_ram" {
  description = "RAM in MB for control plane"
  type        = number
  default     = 3072
}

variable "control_plane_disk" {
  description = "Disk size in GB for control plane"
  type        = number
  default     = 15
}

variable "worker_cpu" {
  description = "Number of CPUs for worker nodes"
  type        = number
  default     = 2
}

variable "worker_ram" {
  description = "RAM in MB for worker nodes"
  type        = number
  default     = 3072
}

variable "worker_disk" {
  description = "Disk size in GB for worker nodes"
  type        = number
  default     = 15
}
