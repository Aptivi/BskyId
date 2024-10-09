FROM ubuntu:24.04

# Copy the output files and start bskyid
COPY src/bskyid .
ENTRYPOINT ["bskyid"]
