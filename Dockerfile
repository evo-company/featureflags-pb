FROM python:3.11-slim as base

ENV PIP_VERSION=23.2.1
ENV PDM_VERSION=2.9.1
ENV PDM_USE_VENV=no
ENV PYTHONPATH=/app/__pypackages__/3.11/lib

WORKDIR /app

COPY ./pyproject.toml .
COPY ./pdm.lock .

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      gcc \
      g++ \
      git && \
    # install tools
    pip install --upgrade pip==${PIP_VERSION} && \
    pip install pdm==${PDM_VERSION} && \
    # configure
    pdm config cache_dir /pdm_cache && \
    pdm config check_update false && \
    # install base deps \
    pdm install --no-lock --prod --no-editable  && \
    # cleanup base layer to keep image size small
    apt purge --auto-remove -y \
      gcc \
      g++ \
      build-essential \
      git && \
    rm -rf /var/cache/apt && \
    rm -rf /var/lib/apt/list && \
    rm -rf $HOME/.cache

FROM base as prod
