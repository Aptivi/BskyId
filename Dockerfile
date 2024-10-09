FROM ubuntu:24.04
WORKDIR /Build

# Copy the output files and start bskyid
COPY /Build/src/bskyid .
ENTRYPOINT ["bskyid"]
