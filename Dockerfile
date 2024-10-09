FROM ubuntu:24.04

# Copy the output files and start bskyid
COPY src/bskyid .
RUN ["apt", "update"]
RUN ["apt", "install", "-y", "dos2unix", "curl"]
RUN ["dos2unix", "bskyid"]
ENTRYPOINT ["bash", "bskyid"]
