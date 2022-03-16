#!/bin/bash

# This script will build a local foundry image for you to utilize
path_to_geth_repo="/workspaces/hive/vulcanize-geth/"
local_path_to_geth_repo=
if [[ -d "$path_to_geth_repo" ]]; then
    echo "INFO: Good job using docker :D"
    path_to_geth=$path_to_geth_repo
elif [[ ! -d "$path_to_geth_repo" ]]; then
    echo "WARNING: I highly recommend recommend running this in the dev container... please"
    echo "WARNING: Otherwise, you can create a symlink to your local path to vulcanize geth"
    echo "WARNING: Command is: ln -s path/to/vulcanize-geth local_path_to_geth_repo}"
elif [[ -d "$local_path_to_geth_repo" ]]; then
    echo "ERROR: We cant find the local_path_to_geth_repo: $local_path_to_geth_repo"
    path_to_geth=$local_path_to_geth_repo
elif [[ ! -d "$local_path_to_geth_repo" ]]; then
    echo "ERROR: We cant find the local_path_to_geth_repo: $local_path_to_geth_repo"
    exit 1
fi

# Build image and tag it from vulcanize-geth/foundry/projects/local-private-network/

echo "INFO: Building a local version of vulcanize/foundry-private-network"
curr_dir=$(pwd)
cd "${path_to_geth}/foundry/projects/local-private-network/"

docker build . --tag vulcanize/foundry-private-network

cd $curr_dir