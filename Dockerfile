FROM nousresearch/hermes-agent:v2026.9.24

USER root

# Create directories and ensure wide permissions
RUN mkdir -p /opt/hermes/seed-data/platforms/pairing /opt/data && \
    chmod 777 /opt/data

COPY seed-data/config.yaml /opt/hermes/seed-data/config.yaml
COPY seed-data/SOUL.md /opt/hermes/seed-data/SOUL.md
COPY seed-data/platforms/pairing/telegram-approved.json /opt/hermes/seed-data/platforms/pairing/telegram-approved.json
COPY entrypoint-worker.sh /opt/hermes/entrypoint-worker.sh

RUN chmod +x /opt/hermes/entrypoint-worker.sh && \
    chmod -R 777 /opt/hermes/seed-data

ENV HOME=/opt/data
ENV HERMES_HOME=/opt/data
ENV PATH="/opt/hermes/bin:/opt/hermes/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

ENTRYPOINT ["/bin/sh", "/opt/hermes/entrypoint-worker.sh"]
