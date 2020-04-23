docker build -t iox-aarch64-hello-world . && \
ioxclient docker package iox-aarch64-hello-world . -n iox-aarch64-hello-world --use-targz && \
docker save iox-aarch64-hello-world -o iox-aarch64-hello-world.tar

