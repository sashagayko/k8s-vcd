# Kubernetes кластер в VMware Cloud Director

## 1. Виртуальные машины vCD:
controller - Центральный узел управления. На ней установлены OpenTofu, Ansible, kubectl, Helm. С этой машины производилось всё управление инфраструктурой через IaC.
control-1 - Главный узел кластера. Запускает компоненты control plane (kube-apiserver, etcd, kube-scheduler, kube-controller-manager).
worker-1, worker-2 - Рабочие узелы кластера.
Все ВМ созданы автоматически через OpenTofu из предварительно подготовленного шаблона template-small.

<img width="1593" height="484" alt="изображение" src="https://github.com/user-attachments/assets/0d23f971-7d40-4f0d-9bc1-9992fda46a01" />

## 2. Кластер Kubernetes
<img width="1166" height="101" alt="изображение" src="https://github.com/user-attachments/assets/9f56a2ac-c546-4117-81a3-23cf51ee142b" />

#### - узлы

<img width="950" height="582" alt="изображение" src="https://github.com/user-attachments/assets/fb03f501-f117-41ad-a234-b28e1c075273" />

#### - список всех подов

## 3. Сетевые компоненты
<img width="702" height="61" alt="изображение" src="https://github.com/user-attachments/assets/c15d5e41-d937-4a3f-b5e5-73151fa8efd5" />

#### - сервис Traefik
<img width="702" height="72" alt="изображение" src="https://github.com/user-attachments/assets/60bbff90-f1e6-464d-8fbb-69a41348d069" />

#### - Ingess для Grafana

## 4. Мониторинг (Grafana)
<img width="1516" height="824" alt="изображение" src="https://github.com/user-attachments/assets/9b03b8a4-6eed-4e54-acb9-fe5e09bb37d8" />
