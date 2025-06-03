Node.js App on Kubernetes
This project demonstrates deploying a Node.js application on a local Kubernetes cluster using Minikube (or KinD), with production-like features including resource management, observability, secrets handling, and external access.


Architecture & Design Decisions
1. Containerization
The application is packaged as a Docker image and stored in a container registry (e.g., Docker Hub).

2. Kubernetes Deployment
Deployed to a local Kubernetes cluster using Minikube.

Helm is used to manage Kubernetes manifests and configuration.

Resource Management: CPU and memory requests/limits ensure predictable scheduling.

Probes:

Readiness Probe confirms when the app is ready to serve traffic.

Liveness Probe detects and recovers crashed containers.

Ingress Controller: Exposes the app externally using Minikube’s built-in ingress add-on

3. Secrets Management
Uses Kubernetes Secrets to securely pass a username and password to the application.

4. Observability
Logging: Logs are sent to stdout for compatibility with log aggregators.

Monitoring: Metrics can be exposed via a /metrics endpoint for scraping by Prometheus.

5. GitHub Actions CI/CD
CI/CD is split into two separate workflows:

    🔁 Continuous Integration (build-docker.yml) Runs on ubuntu-latest
    Triggered on main branch push.

            Jobs:

                Build Docker Image

                Trivy Vulnerability Scan

                Push Image to Docker Hub

    
🚀 Continuous Deployment (helm-deployment.yml)
Manually triggered  via workflow dispatch (workflow_dispatch).Runs on a self-hosted GitHub Actions runner with Minikube.

            Jobs:

                Pull the Docker image

                Deploy the app using Helm to the local Minikube cluster
    


⚙️ How to Set Up a Self-Hosted GitHub Actions 
🔗 Official GitHub Docs
GitHub’s official self-hosted runner guide:
👉 https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners


🛠️ How to Run the Project (End-to-End)
Step 1: Install Prerequisites
Ensure these are installed:

WSL (on Windows)

Docker

Minikube (you have to install and enable)

    kubectl

    Helm

    prometheus 

    ingress(enable)





