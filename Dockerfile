# Use the specified image as the base
FROM opentensor/subtensor:latest

# Set the environment variable
ENV CARGO_HOME=/var/www/node-subtensor/.cargo

# Set the working directory inside the container
WORKDIR /var/www/node-subtensor

# Copy necessary files
# Note: You need to ensure that 'raw_spec.json' and any other necessary files are present in your context
COPY ./raw_spec.json ./

# Expose the necessary ports
EXPOSE 9944 30333 9933

# Set resource limits (handled outside Dockerfile in the container runtime environment)
# Note: Dockerfile does not have direct commands for cpu_count, mem_limit, or memswap_limit.
# These should be set when running the container using 'docker run' options like --cpus, --memory, --memory-swap, etc.

# Command to run on container start
CMD ["/bin/bash", "-c", "/node-subtensor --base-path /tmp/blockchain --chain ./raw_spec.json --rpc-external --rpc-cors all --ws-external --no-mdns --ws-max-connections 10000 --in-peers 500 --out-peers 500 --bootnodes /dns/bootnode.finney.opentensor.ai/tcp/30333/ws/p2p/12D3KooWRwbMb85RWnT8DSXSYMWQtuDwh4LJzndoRrTDotTR5gDC --sync warp"]
