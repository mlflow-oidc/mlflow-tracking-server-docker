# MLflow Tracking Server Docker Image

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/mlflow-oidc-tracking-server)](https://artifacthub.io/packages/search?repo=mlflow-oidc-tracking-server)

Use this image to run the [MLflow Tracking Server](https://github.com/mlflow/mlflow) with the [OIDC Auth plugin](https://github.com/mlflow-oidc/mlflow-oidc-auth).

# Update Schedule

The image is rebuilt automatically on a daily basis if a new version of the MLflow or MLflow-OIDC package is released.

# Versioning

The Docker image tags follow this pattern: **MLflow version - OIDC Auth plugin version - Image Build Date**.

# Database Migrations

The container automatically runs database migrations on startup using Alembic. This ensures your database schema is always up-to-date when upgrading to a new version.

If you need to run migrations manually (e.g., for troubleshooting), you can execute:

```bash
docker exec <container> sh -c 'cd $(python -c "import mlflow_oidc_auth, os; print(os.path.join(os.path.dirname(mlflow_oidc_auth.__file__), \"db\", \"migrations\"))") && alembic upgrade head'
```

To check the current migration status:

```bash
docker exec <container> sh -c 'cd $(python -c "import mlflow_oidc_auth, os; print(os.path.join(os.path.dirname(mlflow_oidc_auth.__file__), \"db\", \"migrations\"))") && alembic current'
```

# Kubernetes Deployment

A Helm chart for deploying this image to Kubernetes can be found [here](https://github.com/mlflow-oidc/helm).

# License

This project is licensed under the Apache 2.0 License. For more information, please see the [license](./license).
