#!/bin/sh

#wget https://github.com/nervosnetwork/ckb/releases/download/v0.14.0/ckb_v0.14.0_x86_64-unknown-linux-gnu.tar.gz
wget https://www.dropbox.com/s/u31ng82m1tt0h45/ckb.tar.gz -O ckb.tar.gz
tar -xzvf ckb.tar.gz
cd ckb
sudo ln -snf "$(pwd)/ckb" /usr/local/bin/ckb

tmux new-session -d -s "miner"
tmux send-keys -t "miner" "cd ~/ckb/ckb-testnet/" C-m
tmux send-keys -t "miner" "ckb miner" C-m
