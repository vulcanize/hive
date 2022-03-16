# hive - Ethereum end-to-end test harness

Hive is a system for running integration tests against Ethereum clients.

Ethereum Foundation maintains a public Hive instance to check for consensus, p2p and
blockchain compatibility. You can find the latest test results [here][hive-prod].

**To read more about hive, please check [the documentation][doc].**

# Vulcanize Specific
This section will go through Vulcanize specific details.

## Setup

1. I highly recommend using the `.devcontainer`. It this moment in time this is the only supported option.
2. Update line 9 in `.devcontainer/devcontainer.json`, and update your local path to the `vulcanize-geth` repo.
3. `cd clients/vulcanize-geth`
4. `./build_foundry.sh`
5. `docker compose up --build`

## Running Tests
Once the DB container is running locally, you can run tests by:
```
./hive --sim devp2p --client vulcanize-geth
```

You can also use the provided console by running:
```
./hiveview --serve --logdir ./workspace/logs
```

## Reset the DB
To reset the DB do the following in the shell which you utilized to run `docker compose up --build`.

1. `Ctrl + c`
2. `docker-compose down`
3. `docker volume rm vulcanize-geth_vdb_db_eth_server`

### Trophies

If you find a bug in your client implementation due to this project, please be so kind as
to add it here to the trophy list. It could help prove that `hive` is indeed a useful tool
for validating Ethereum client implementations.

- go-ethereum:
  - Genesis chain config couldn't handle present but empty settings: [#2790](https://github.com/ethereum/go-ethereum/pull/2790)
  - Data race between remote block import and local block mining: [#2793](https://github.com/ethereum/go-ethereum/pull/2793)
  - Downloader didn't penalize incompatible forks hashly enough: [#2801](https://github.com/ethereum/go-ethereum/pull/2801)
- Nethermind:
  - Bug in p2p whith bonding nodes algorithm found by Hive: [#1894](https://github.com/NethermindEth/nethermind/pull/1894)
  - Difference in return value for 'r' parameter in getTransactionByHash: [#2372](https://github.com/NethermindEth/nethermind/issues/2372)

### Contributions

This project takes a different approach to code contributions than your usual FOSS project
with well ingrained maintainers and relatively few external contributors. It is an
experiment. Whether it will work out or not is for the future to decide.

We follow the [Collective Code Construction Contract (C4)][c4], code contribution model,
as expanded and explained in [The ZeroMQ Process][zmq-process]. The core idea being that
any patch that successfully solves an issue (bug/feature) and doesn't break any existing
code/contracts must be optimistically merged by maintainers. Followup patches may be used
to for additional polishes – and patches may even be outright reverted if they turn out to
have a negative impact – but no change must be rejected based on personal values.

### License

The hive project is licensed under the [GNU General Public License v3.0][gpl]. You can
find it in the COPYING file.

[hive-prod]: https://hivetests.ethdevops.io/
[doc]: ./docs/overview.md
[c4]: http://rfc.zeromq.org/spec:22/C4/
[zmq-process]: https://hintjens.gitbooks.io/social-architecture/content/chapter4.html
[gpl]: http://www.gnu.org/licenses/gpl-3.0.en.html
