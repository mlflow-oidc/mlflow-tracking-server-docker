# MLflow Tracking Server Docker Image

Use this image to run the [MLflow Tracking Server](https://github.com/mlflow/mlflow) with the [OIDC Auth plugin](https://github.com/mlflow-oidc/mlflow-oidc-auth).

# Update Schedule

The image is rebuilt automatically on a daily basis if a new version of the MLflow or MLflow-OIDC package is released.

# Versioning

The Docker image tags follow this pattern: **MLflow version - OIDC Auth plugin version - Image Build Date**.

# Kubernetes Deployment

A Helm chart for deploying this image to Kubernetes can be found [here](https://github.com/mlflow-oidc/helm).

# License

This project is licensed under the Apache 2.0 License. For more information, please see the [license](./license).
