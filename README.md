# 🚀 Caso Práctico 2 - DevOps (UNIR)

## 📌 Descripción

Este proyecto implementa una arquitectura completa en Azure utilizando herramientas DevOps para el despliegue automatizado de aplicaciones en una máquina virtual y en un clúster de Kubernetes (AKS).

Se utilizan tecnologías como **Terraform**, **Ansible**, **Azure Container Registry (ACR)**, **Podman** y **Kubernetes**.

---

## 🏗️ Arquitectura

La solución está compuesta por:

* **Azure Resource Group**
* **Red virtual (VNet + Subnet)**
* **Máquina Virtual Linux**
* **Azure Container Registry (ACR)**
* **Azure Kubernetes Service (AKS)**

Se despliegan dos aplicaciones:

1. **Aplicación en VM**

   * Ejecutada con Podman
   * Servida con Nginx
   * HTTPS con certificado autofirmado
   * Autenticación básica

2. **Aplicación en AKS**

   * Ejecutada en Kubernetes
   * Imagen desde ACR
   * Persistencia con PVC
   * Acceso público mediante LoadBalancer

---

## 📂 Estructura del proyecto

```
cp2/
├── terraform/
├── ansible/
│   ├── hosts
│   ├── playbook.yml
│   └── deploy.sh
├── images/
│   ├── vm-web/
│   └── aks-web/
├── k8s/
└── README.md
```

---

## ⚙️ Requisitos

* Terraform
* Ansible
* Azure CLI
* kubectl
* Cuenta de Azure

---

## 🚀 Despliegue

### 1. Crear infraestructura con Terraform

```bash
cd terraform
terraform init
terraform apply
```

---

### 2. Configurar credenciales de AKS

```bash
az login
az aks get-credentials --resource-group rg-cp2 --name aks-cp2
```

---

### 3. Desplegar con Ansible

```bash
cd ansible
./deploy.sh
```

Este paso realiza:

* Configuración de la VM
* Instalación de Podman
* Despliegue del contenedor en la VM
* Creación de recursos en Kubernetes

Para la autenticación con el ACR:
cp vars.example.yml vars.yml
# editar vars.yml con la password real del ACR
./deploy.sh
---

## 🌐 Acceso a las aplicaciones

### VM (HTTPS)

```
https://<IP_VM>
```

Credenciales:

* Usuario: `cp2user`
* Contraseña: `cp2pass`

---

### AKS (HTTP)

```bash
kubectl get svc -n cp2
```

Acceder a la IP externa del servicio:

```
http://<EXTERNAL-IP>
```

---

## 💾 Persistencia en AKS

La aplicación en Kubernetes utiliza un **PersistentVolumeClaim (PVC)** para almacenar datos de forma persistente.

Esto garantiza que los datos se mantengan incluso si el pod se reinicia.

---

## 🔐 Seguridad

* Uso de **ACR privado** para almacenamiento de imágenes
* Autenticación mediante **Secret en Kubernetes**
* Acceso HTTPS en la VM con certificado autofirmado

---

## ⚠️ Problemas encontrados

* Restricción de puertos privilegiados en Podman → solucionado usando `network: host`
* Problemas de conectividad → resueltos configurando reglas NSG en Azure
* Conflictos de red en AKS (CIDR) → ajustados correctamente en Terraform

---

