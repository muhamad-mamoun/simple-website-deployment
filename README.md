# Simple Website Deployment

This project automates the provisioning and configuration of an EC2 instance to host a simple website and a Jenkins server using Terraform and Ansible.

## 📦 Project Overview

- **Infrastructure as Code (IaC):** Utilizes Terraform to provision AWS resources.
- **Configuration Management:** Employs Ansible to install and configure Docker, deploy a website container, and set up Jenkins.
- **CI/CD Integration:** Jenkins is configured to facilitate continuous integration and deployment pipelines.

## 🚀 Features

- **Automated EC2 Provisioning:** Launches an EC2 instance with the necessary security groups and key pairs.
- **Docker Installation:** Installs Docker and its dependencies on the EC2 instance.
- **Website Deployment:** Deploys a simple website container using Docker.
- **Jenkins Setup:** Installs Jenkins in a Docker container and retrieves the initial admin password.
- **Ansible Playbooks:** Structured Ansible roles and playbooks for modular configuration.

## 📂 Project Structure

```
simple-website-deployment/
├── Website/
├── Ansible/
│   ├── ansible.cfg
│   ├── app-servers/
│   ├── inventory.ini
│   └── playbook.yaml
├── Terraform/
│   ├── Compute/
│   ├── Network/
│   ├── backend.tf
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variables.tf
└── Jenkinsfile
```

## ⚙️ Usage

1. **Clone the Repository:**
   ```bash
   git clone git@github.com:muhamad-mamoun/simple-website-deployment.git
   cd simple-website-deployment
   ```

2. **Provision Infrastructure with Terraform:**
   ```bash
   cd Terraform
   terraform init
   terraform apply
   ```

3. **Configure Servers with Ansible:**
   ```bash
   cd ../Ansible
   ansible-playbook -i inventory.ini playbook.yaml
   ```

4. **Access the Website and Jenkins:**
   - **Website:** http://<EC2_PUBLIC_IP>
   - **Jenkins:** http://<EC2_PUBLIC_IP>:8080
