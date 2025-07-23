# 🚀 Flask Health Check App (Containerized)

A simple containerized Python Flask application with a `/health` endpoint, deployed to Azure WebApp via GitHub Actions. Infrastructure is provisioned in Azure using the Infrastructure as Code (IaC) tool terraform. Appluication code is developed in python flask and made the image out of docker. Docker image is being pulled from the Azure Contianer Registry (ACR) and deployed in Azure Web App Container. 

---

## 📦 Features

- ✅ `/health` endpoint returns `{"status": "ok"}`
- 🐳 Dockerized Flask application
- ☁️ Azure Web App for Containers deployment
- 🔐 Image pulled from Azure Container Registry (ACR)
- 🔁 CI/CD pipeline using GitHub Actions
- ⚙️ Infrastructure as Code using Terraform

---

## 🗂️ Project Structure