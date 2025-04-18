# flask-aws-demo 

# 🔐 Secure Flask App Deployment on AWS with Terraform & GitLab CI/CD

This project demonstrates how to securely deploy a Flask web application on AWS, manage infrastructure with Terraform, and implement CI/CD pipelines for continuous security testing using tools like Checkov, Trivy, and Gitleaks.

---

## 📦 Project Structure

```bash
.
├── flask_app/               # Flask application source code
├── terraform/
│   ├── main.tf              # AWS infrastructure configuration
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
│       └── vpc/             # Custom VPC module
│       └── ec2/             # ec2 instance for deploying the flask app
│       └── rds/             # RDS instance to handle data    
├── .gitlab-ci.yml           # CI/CD pipeline configuration
├── reports/                 # Security scan outputs (generated in pipeline)
└── README.md
```

🚀 Deployment Overview 

1. Flask Application

A simple Python Flask application with a form interface, storing submitted data in a PostgreSQL database.

Steps:

    Built and tested locally with Python 3 and Flask.

    Configured to connect to PostgreSQL using environment variables for DB credentials.

    Application served using Gunicorn on an EC2 instance.

2. Infrastructure Provisioning with Terraform

We used Terraform to provision a secure, isolated infrastructure on AWS:

Resources created:

    VPC with public and private subnets

    EC2 Instance to host the Flask app

    RDS PostgreSQL Instance for persistent data storage

    Security Groups for controlled access 

Commands:

```bash

cd terraform/
terraform init
terraform plan
terraform apply
```

Terraform securely injects database credentials into EC2 instances using environment variables or user-data scripts.

🔄 CI/CD & Security Pipeline

CI/CD is managed through GitLab with the following stages defined in .gitlab-ci.yml:

✅ 1. Checkov Scan

    Scans Terraform code for misconfigurations.

    Produces a JSON report.

🛡  2. Trivy Scan

    Scans source code directory for OS packages and known vulnerabilities.

    Useful for detecting CVEs in packaged dependencies.

🔍 3. Gitleaks Scan

    Detects hardcoded secrets in the repository.

📊 4. Summary Report

    Aggregates results from all scans.

    Outputs an HTML summary report showing passed/failed checks and links to detailed reports.

All scan outputs are saved as pipeline artifacts for review.

🧪 Running CI/CD

Just push to main (or any branch with .gitlab-ci.yml):

```bash

git add .
git commit -m "Trigger security scan"
git push origin main
```

📁 Reports Output

Security scan results are available in the reports/ directory:

    checkov_report.json

    trivy_report.json

    gitleaks_report.json

    summary.html

You can download these from the GitLab pipeline artifacts section.

🛠 Tools & Technologies

    Flask — Python web framework

    Terraform — Infrastructure as Code

    GitLab CI/CD — Continuous integration & delivery

    Checkov — Terraform misconfiguration scanning

    Trivy — Vulnerability and misconfiguration scanner

    Gitleaks — Secret detection tool

    AWS — Cloud infrastructure
