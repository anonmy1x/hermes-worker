FROM nousresearch/hermes-agent:v2026.9.24

ENV HOME=/opt/data
ENV HERMES_HOME=/opt/data
ENV PATH="/opt/hermes/bin:/opt/hermes/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

ENTRYPOINT ["/opt/hermes/.venv/bin/hermes"]
CMD ["gateway", "run"]
