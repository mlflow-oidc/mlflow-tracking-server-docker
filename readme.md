# MLflow Tracking Server Docker Image

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/mlflow-oidc-tracking-server)](https://artifacthub.io/packages/search?repo=mlflow-oidc-tracking-server)

Use this image to run the [MLflow Tracking Server](https://github.com/mlflow/mlflow) with the [OIDC Auth plugin](https://github.com/mlflow-oidc/mlflow-oidc-auth).

# Update Schedule

The image is rebuilt automatically on a daily basis if a new version of the MLflow or MLflow-OIDC package is released.
It is also scanned daily for vulnerabilities; when the base image has a fixable high or critical vulnerability, the
image is rebuilt on the refreshed base. Findings are published in the repository's code scanning alerts.

# Versioning

Every build is published under three tags:

| Tag | Example | Moves? |
|---|---|---|
| **MLflow version - OIDC Auth plugin version - build date** | `3.16.1-9.0.0-20261002` | Never: pin this for reproducible deployments. The Helm chart defaults to one of these. |
| **OIDC Auth plugin version** | `9.0.0` | Yes, to each rebuild of that plugin release (a new MLflow, a refreshed base image). A node that has it cached keeps the old build unless it pulls again. |
| `latest` | `latest` | Yes, to every build. |

# Kubernetes Deployment

A Helm chart for deploying this image to Kubernetes can be found [here](https://github.com/mlflow-oidc/helm).

# License

This project is licensed under the Apache 2.0 License. For more information, please see the [license](./license).
