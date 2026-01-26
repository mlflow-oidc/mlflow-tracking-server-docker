ARG PYTHON_VERSION=3.12-slim
FROM python:${PYTHON_VERSION} AS base
ARG BUILD_DATE

LABEL org.opencontainers.image.authors="Alexander Kharkevich <alex@kharkevich.org>"
LABEL org.opencontainers.image.source="https://github.com/mlflow-oidc/mlflow-tracking-server-docker"
LABEL org.opencontainers.image.licenses="Apache-2.0"
LABEL org.opencontainers.image.description="MLflow Tracking Server with OIDC (SSO) plugin"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL io.artifacthub.package.readme-url="https://raw.githubusercontent.com/mlflow-oidc/mlflow-tracking-server-docker/main/readme.md"
LABEL io.artifacthub.package.logo-url="https://raw.githubusercontent.com/mlflow-oidc/mlflow-oidc-auth/refs/heads/main/web-react/public/favicon.svg"

RUN adduser --disabled-password --gecos '' python
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

FROM base AS builder

RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir uv wheel

USER python
WORKDIR /mlflow
# podman can't create directories with the right permissions
RUN chown python:python /mlflow

COPY pyproject.toml uv.lock /mlflow/

RUN uv sync --frozen --no-install-project --no-cache

FROM base AS final
USER python
WORKDIR /mlflow
COPY --from=builder --chown=python:python /mlflow /mlflow
ENV PATH=/mlflow/.venv/bin:$PATH
ENV OAUTHLIB_INSECURE_TRANSPORT=1
EXPOSE 5000
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000", "--app-name", "oidc-auth", "--backend-store-uri", "sqlite:///mlflow.db", "--default-artifact-root", "/mlflow/artifacts"]
