FROM debian:12

RUN apt-get update && \
    apt-get install -y python3 && \
    rm -rf /var/lib/apt/lists/*

CMD ["sleep", "infinity"]