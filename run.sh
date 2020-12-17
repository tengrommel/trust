#!/bin/zsh
cargo b
ext=$?
# $? 最后运行的命令的结束代码（返回值）
if [[ $ext -ne 0 ]]; then
	exit $ext
fi
sudo setcap cap_net_admin=eip $PWD/target/debug/trust
$PWD/target/debug/trust &
pid=$!
# $! Shell最后运行的后台Process的PID
sudo ip addr add 10.0.0.1/8 dev tun0
sudo ip link set up dev tun0
trap "kill $pid" INT TERM
wait $pid