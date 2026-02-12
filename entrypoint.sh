#!/bin/bash
set -e

echo "Running database migrations..."
# Find the mlflow_oidc_auth package location and run alembic from its migrations directory
MIGRATIONS_DIR=$(python -c "import mlflow_oidc_auth; import os; print(os.path.join(os.path.dirname(mlflow_oidc_auth.__file__), 'db', 'migrations'))")
cd "$MIGRATIONS_DIR"
alembic upgrade head

echo "Starting MLflow server..."
exec "$@"
