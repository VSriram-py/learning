FROM ubuntu:24.04
RUN apt-get update && apt-get install -y --no-install-recommends \
      python3 python3-flask bind9-dnsutils ca-certificates \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY app.py /app/app.py
EXPOSE 8082
CMD ["python3","/app/app.py"]
