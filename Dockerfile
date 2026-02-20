FROM ubuntu:24.04

ENV SHELL=/bin/bash

RUN apt-get update && apt-get install -y curl jq python3 python3.12-venv
RUN curl -fsSL https://public.cdn.getdbt.com/fs/install/install.sh | sh -s -- --update
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/python -m pip install dbt-core dbt-duckdb

RUN cd /opt && curl -L https://github.com/dbt-labs/dbt-utils/archive/refs/tags/1.3.3.tar.gz | tar xzf -
COPY my-package /opt/my-package
COPY my-project /opt/my-project

WORKDIR /opt/my-project
