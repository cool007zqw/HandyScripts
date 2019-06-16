#!/bin/sh

wget https://github.com/nervosnetwork/ckb/releases/download/v0.14.0/ckb_v0.14.0_x86_64-unknown-linux-gnu.tar.gz
tar -xzvf ckb_v0.14.0_x86_64-unknown-linux-gnu.tar.gz
cd ckb_v0.14.0_x86_64-unknown-linux-gnu
sudo ln -snf "$(pwd)/ckb" /usr/local/bin/ckb

ckb init -C ckb-testnet --chain testnet
cd ckb-testnet


sed -i 's/threads     = 1/threads     = 3/g' ckb-miner.toml
sed -i 's/127.0.0.1:8114/enzo.host:8114/g' ckb-miner.toml

cat <<EOT >> ckb.toml
[block_assembler]
code_hash = "0xf1951123466e4479842387a66fabfd6b65fc87fd84ae8e6cd3053edb27fff2fd"
args = ["0x1fa5af45df2c6ba478e9bb06cf6f594b88356b16"]
EOT

sleep 1
tmux new-session -d -s "miner"
sleep 1
tmux send-keys -t "miner" "ckb miner -C ~/ckb_v0.14.0_x86_64-unknown-linux-gnu/ckb-testnet/" C-m
sleep 1
tmux a
