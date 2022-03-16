FROM vulcanize/foundry-private-network

WORKDIR /root

RUN /bin/geth console --exec 'console.log(admin.nodeInfo.name)' --maxpeers=0 --nodiscover --dev 2>/dev/null | head -1 > /version.txt

ENV DB_USER=vdbm
ENV DB_NAME=vulcanize_testing
ENV DB_HOST="host.docker.internal"
ENV DB_PORT=8077
ENV DB_PASSWORD=password
ENV DB_WRITE=true
ENV DB_TYPE=postgres
ENV DB_DRIVER=sqlx
ENV DB_WAIT_FOR_SYNC=true
ENV HIVE_CHECK_LIVE_PORT=0

ENV POSTGRES_USER=vdbm
ENV POSTGRES_DB=vulcanize_testing
ENV POSTGRES_PASSWORD=password

ENV CHAIN_ID=1337


ADD mapper.jq /mapper.jq
ADD genesis.json /genesis.json

# Inject the enode URL retriever script.
RUN mkdir /hive-bin
ADD enode.sh /hive-bin/enode.sh
RUN chmod +x /hive-bin/enode.sh

ENV PATH "$PATH:/root/.foundry/bin/"
RUN echo "export PATH=${PATH}" >> $HOME/.bashrc;

RUN \
 /bin/geth makecache     1 ~/.ethereum/geth/ethash && \
 /bin/geth makecache 30001 ~/.ethereum/geth/ethash

EXPOSE 8545 8546 8547 30303 30303/udp