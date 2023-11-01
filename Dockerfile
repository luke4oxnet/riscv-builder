FROM debian:bookworm-slim
# ...
ENV PYTHONUNBUFFERED=1
# RUN apt-get  -y python3 gcc python3-dev linux-headers && rm -rf /var/lib/apt/lists/*
RUN apt update && apt-get install -y scons wget git cppcheck && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v13.2.0-2/xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz && \
	tar xf xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz && \
	rm xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz
ENV RTT_EXEC_PATH=/xpack-riscv-none-elf-gcc-13.2.0-2/bin/
ENV RTT_PREFIX=riscv-none-elf-
ENV RTT_CFLAGS=" -DUSE_RISCV_GCC_GENUINE"
     
