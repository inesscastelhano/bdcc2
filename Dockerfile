FROM python:3.12-slim-bookworm
WORKDIR /app
COPY validate.py .
ENTRYPOINT ["python", "/app/validate.py"]
CMD ["--input", "/input/transactions_initial.csv", "--output-dir", "/output", "--run", "initial"]
