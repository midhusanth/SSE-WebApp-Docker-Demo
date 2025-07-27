# 🚀 Flask Health Check App (Containerized)

A simple containerized Python Flask application with a Get Operation endpoint returns the status of the application, deployed to Azure WebApp via GitHub Actions. Infrastructure is provisioned in Azure using the Infrastructure as Code (IaC) tool terraform. Appluication code is developed in python flask and made the image out of docker. Docker image is being pulled from the Azure Contianer Registry (ACR) and deployed in Azure Web App Container. 

---

## 📦 Features

- ✅ Get endpoint returns status of the application ('/health')
- 🐳 Dockerized Flask application
- ☁️ Azure Web App for Containers deployment
- 🔐 Image pulled from Azure Container Registry (ACR)
- 🔁 CI/CD pipeline using GitHub Actions
- ⚙️ Infrastructure as Code using Terraform

---
## 🧱 Project Architecture
<img width="780" height="463" alt="Cloud_Infrastructure" src="https://github.com/user-attachments/assets/c60e4a68-722f-4db5-a5be-64f913f7c204" />

Above diagram shows the cloud infrastructure architetcure for the Health Check App. User from outside world will access the web app from the browser in HTTP port 80 and with the webapp URL ([Health Check URL](http://app-docker-health-demo-uks.azurewebsites.net/health)). The request will be then served by WebApp (app-docker-health-demo-uks) which is residing in a Linux based App Service Plan. When ever the code change happens the container image will be built by the application workflow and the image is pushed to the Azure Container Registry(acrdockerhealthdemouks) which is residing in the same resource group as that of WebApp Container. The same workflow will pull the image from the container registry and deploy the pushed image in the WebApp Container.

----
## 🔩 Configuration
Various configurations were need for the health app to get up and running in the Webapp Container. Below are the high level steps for the configuration of infrastructure, application and CI/CD workflows.
### Infrastructure
**Initial Setup** 
- First of all, an azure subscription is need for provisioning the resources. Here we have used a free subscription azure resource.
- As per the architecture, a resource group, Azure container Registry, App Service Plan and a Web App Container is needed. For the provisioning of the resources, IaC tool Terraform is used. Also, a GitHub repository and for Terraform state management Terraform Cloud account in needed.
- Once the Terraform Cloud account is configured, Organisation and Workspace need to be created. 

**Connectivity and Permissions**
- For Terraform Cloud to have access to the subscription, a service principal needs to be created in Azure App Registration. Enable the service principal with Contributor role for the subscrition.
- A new client secret need to be created in the certificate and secret section of the app registration.
- Create environment variables in the TFC workspace for client id, client secret, subscription id and tenant id.
- Connectivity needs to be established from GitHub to TFC with the help of API token created.
- TFC API Token, Client id, and client secret needs to be stored in the  keyvault and proper permission needs to be set for the access.

**IaC Code**
- Terraform module are written for the below resources.
  1. [Resource group](https://app.terraform.io/app/MG-WepApp-Docker-Demo/registry/private/modules?q=resourcegroup) - Terraform Cloud Registry
  2. [Azure Container Registry(ACR)](https://github.com/midhusanth/SSE-WebApp-Docker-Demo/tree/main/infra/modules/azure_container_registry)
  3. [App Service Plan](https://github.com/midhusanth/SSE-WebApp-Docker-Demo/tree/main/infra/modules/app_service_plan)
  4. [Web App Container](https://github.com/midhusanth/SSE-WebApp-Docker-Demo/tree/main/infra/modules/webapp_container)
- Used the above module for creating the actual resources with separate resource file.
- Run the plan locally to see if the resources will provision prooperly.
- Repository strcuture details are available in [Repository Structure](#%EF%B8%8F-repository-structure) section.

**Automated deployment**
- Created the workflow terraform plan and apply for testing and deploying the resources. More details about the workflows are mentioned in [CI/CD Implementation](#cicd-implementation) section.

### Application
**Local Application Setup**
- Install Python, flask, and gunicorn in the local machine where developement is being done.
- Install docker desktop and run the docker engine.

**App Development annd testing**
- Develop the app code in Visual Studio Code.
- Create the Dockerfile with image configurations and requirements.txt file for dependencies.
- For proper versioning of the image created a JSON file to store the image version and description.
- Once the development is completed, then test the image locally and check if the endpoint is available via port 80.

**Automated deployment**
- Created the workflow for building the image with docker, pushing the image to the Azure container registry and deploy the image into webapp by pulling the image from ACR. More details about the workflows are mentioned in [CI/CD Implementation](#cicd-implementation) section.

### CI/CD Implementation
CI/CD Implementation of workflows and automation is very crucial for a consistent and efficient delivery. Here for this project we have used GitHub Action for the Infrastructure testing and provisioning as well as the application building and deployment. **Feature branching strategy** is being used through the implementation. main branch being the production ready/deployment ready branch and separate feature branches will be created and used for development and testing.

**Infrastructure**
-  New changes to the IaC is created using a feature branch from main. If needed test the TF plan locally after login using az login.
-  Push the changes to the remote feature branch which will trigger the plan terraform_plan workflow when a commit happens in the infra folder.
-  Once the TF plan is succcesfully, create a pull request from feature branch to main branch.
-  Review the changes by peer review and approvals if required. Merge the changes to main branch.
-  Automatically another workflow for terraform apply will trigger and it will deploy the resource or config changes to Azure.
<img width="804" height="554" alt="Infra_CICD" src="https://github.com/user-attachments/assets/85fc3f11-6b95-49ab-8f5f-04f029ae7889" />

**Application**
- New changes to the application is developed using a new feature branch from main.
- Development and testing is done locally within Visual Studio Code.
- Push the changes to feature branch which will trigger the application workflow for building the image in docker and pushing the image to ACR.
- After the successful build pipeline, create a pull request from feature branch to main branch.
- Review the changes by peer review and approvals if required. Merge the changes to main branch.
- Automatically another workflow for app code deployment for webapp will trigger and it will deploy the image from the previous build to WebApp.
<img width="805" height="554" alt="AppCICD" src="https://github.com/user-attachments/assets/a805afa9-763d-40ec-9e9d-645c877cbc6e" />


---
## 🗂️ Repository Structure
Infrastrcture and Application code are kept in this same repository. Code is kept in separate folders for each area. The folder structure of the repo is as below.
- 📂infra  
   All the infrasture code (Terraform) is places in this folder with another subfolder modules where the Azure Resource Terraform modules are kept in another subfolders for each resources.  
   <img width="387" height="197" alt="app folder structure" src="https://github.com/user-attachments/assets/52722439-8582-4dca-9258-623b290e2b28" />

- 📂app  
  Application code for the health app is kept here along with the docker file and its dependent files. Also for tracking the docker imager version/tags another json file is kept.  
  <img width="523" height="515" alt="Infra folder structure" src="https://github.com/user-attachments/assets/15b65bff-29be-496f-aa87-fd86cd67a454" />


## 👌 Benefits
- Fully Automated release process for both infrastructure and application using GitHub Actions.
- Consistent infrasturcture with standard naming conventions and processes.
- Easy process of deployment and redeployment of code.
- Proper tracking of the changes with Pull Request and commits. Protected main branch.
- Feature branching strategy for enabling for multi developer involvement at same time.


## 💡Scope of improvement
**Architecture**
- *Vnet Integration* can be enforced in the webapp to secure the endpoints and controlled access.
- *Custom domain* can be configured for the webapp URL to make it more user friendly.
- For handling sensitive and highly confidential data, App service plan and web app can be deployed in an *App Service Environment*.
- Improved architecture diagram is as follows:
  <img width="1309" height="811" alt="DockerApp-Updated Infra" src="https://github.com/user-attachments/assets/c1f4fe57-98ff-4fcb-90cc-fb0c54f0c0ca" />


**CI/CD Workflows**
- *Pull Request Approval* can be added in between a pull request for proper peer and approvala before merging the 
- Terrform resource security and validation checks can be added using *Terraform Lint* and *Synk reports*.
- GitHub Runners can be configured to securely run and build the pipelines.

