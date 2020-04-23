FROM devhub-docker.cisco.com/iox-docker/ir1101/base-rootfs as builder
RUN opkg update
RUN opkg install iox-toolchain
RUN mkdir -p /var/helloworld/
COPY helloworld.c /var/helloworld/
WORKDIR /var/helloworld/
RUN gcc helloworld.c -o helloworld

FROM devhub-docker.cisco.com/iox-docker/ir1101/base-rootfs
RUN mkdir -p /var/helloworld/
COPY --from=builder /var/helloworld/helloworld /var/helloworld
COPY start.sh /
RUN chmod +x /var/helloworld/helloworld
CMD ["sh", "/start.sh"]
# CMD /var/helloworld/helloworld
