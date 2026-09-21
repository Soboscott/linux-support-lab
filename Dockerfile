FROM ubuntu:24.04

WORKDIR /app

COPY scripts/ scripts/
COPY logs/ logs/

RUN chmod +x scripts/error-report.sh

ENTRYPOINT ["/app/scripts/error-report.sh"]
CMD ["ERROR"]
