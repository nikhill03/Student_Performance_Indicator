# Student Performance Indicator

An End-to-End Machine Learning project that predicts student test scores based on various factors such as gender, ethnicity, parental level of education, lunch type, and test preparation course. This project implements a complete CI/CD pipeline using GitHub Actions, Docker, and AWS ECR.

## 📂 Project Structure

```text
Student_Performance_Indicator/
├── .github/workflows/       # CI/CD Pipeline (main.yml)
├── src/                     # Source code for the ML project
│   ├── components/          # Data Ingestion, Transformation, Model Trainer
│   ├── pipeline/            # Prediction and Training pipelines
│   ├── logger.py            # Logging configuration
│   └── exception.py         # Custom exception handling
├── artifacts/               # Stores generated models and preprocessors
├── templates/               # HTML templates for the Flask app
├── application.py           # Entry point for the Flask application
├── Dockerfile               # Docker configuration
├── requirements.txt         # Project dependencies
└── setup.py                 # Package setup

## 🚀 End to End Machine Learning Project Flow

Data Ingestion: Reading data from the source.

Data Transformation: Cleaning and preparing data for the model.

Model Training: Training various models and selecting the best one.

Prediction: Web interface for real-time predictions.

Deployment: Dockerizing the app and pushing to AWS.

🛠️ Deployment Checklist

The following steps were taken to deploy this application:

[x] Docker Build Checked: Verified the Dockerfile locally.

[x] GitHub Workflow: Configured .github/workflows/main.yml.

[x] IAM User in AWS: Created a user with AmazonEC2ContainerRegistryFullAccess and AmazonEC2FullAccess.

☁️ AWS Deployment Setup

This project uses GitHub Actions to build a Docker image and push it to Amazon Elastic Container Registry (ECR).

1. Create ECR Repository

Create a repository in AWS ECR to store your Docker images.

aws ecr create-repository --repository-name student-performance --region eu-north-1

2. Configure IAM User

Create an IAM user on AWS with the following permissions policies attached:

AmazonEC2ContainerRegistryFullAccess

AmazonEC2FullAccess (If deploying to EC2)

3. Setup GitHub Secrets

Navigate to your GitHub Repository -> Settings -> Secrets and variables -> Actions -> New repository secret. Add the following:

Secret Name

Description

Example Value

AWS_ACCESS_KEY_ID

Your IAM User Access Key

AKIA...

AWS_SECRET_ACCESS_KEY

Your IAM User Secret Key

wJalr...

AWS_REGION

Your AWS Region

eu-north-1

ECR_REPOSITORY_NAME

Name of your repo created in Step 1

student-performance

🖥️ Docker Setup in EC2 (Self-Hosted Runner)

If you wish to pull the image and run it on an EC2 instance, execute the following commands on your Ubuntu server:

System Update

# optional

sudo apt-get update -y
sudo apt-get upgrade

Docker Installation (Required)

# Download the Docker installation script

curl -fsSL [https://get.docker.com](https://get.docker.com) -o get-docker.sh

# Run the installation script

sudo sh get-docker.sh

# Add the current user to the docker group

sudo usermod -aG docker ubuntu

# Refresh the group membership

newgrp docker

🏃 running locally

To run this project on your local machine:

Clone the repository

git clone [https://github.com/nikhill03/Student_Performance_Indicator.git](https://github.com/nikhill03/Student_Performance_Indicator.git)
cd Student_Performance_Indicator

Create a Virtual Environment

python -m venv .venv
source .venv/bin/activate # On Windows use: .venv\Scripts\activate

Install Dependencies

pip install -r requirements.txt

Run the Application

python application.py

Access the app at http://127.0.0.1:5000

🐳 Docker Local Run

To build and run the container locally without AWS:

# Build the image

docker build -t student-app .

# Run the container

docker run -p 5000:5000 student-app
```
