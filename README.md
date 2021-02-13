# mediawiki-assignment
---
**NOTE**

The following repository is for Learning purpose.

---

The complete code is divided into 2 parts:
- Docker build
- helm deployment

## Docker build
As a part of successful deployment, docker build and push is necessary.

## helm deployment

### Pre-requisites
- Docker build: Before starting with helm chart, make sure the image is built and pushed in the repository
- Cluster configuration: Make sure your system is configured with Kubernetes Cluster where the deployment will take place.

One can simply run the helm command mentioned below to install the package. The chart is placed under helm folder. It consists of 2 deployments - mediawiki and mariadb.
All the properties of mediawiki are defined under mediawiki map in values.yaml and same for mariadb respectively.

#### Installing the chart
  _helm install <release_name> helm/mediawiki -f <optional-custom-values.yaml>_
  
#### Upgrading chart
  _helm upgrade <release_name> helm/mediawiki -f <optional-custom-values.yaml>_
  
#### Passing secrets
  Secrets are defined under _mariadb.secrets_ which can be overridden by passing custom values at the time of creation. All the secret properties are defined below:
  
  ---
  - mariadb.secrets.user     : MySQL User
  - mariadb.secrets.database : MySQL Database
  - mariadb.secrets.password : MySQL password
  
  ---
