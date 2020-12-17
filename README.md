    setcap cap_net_admin=eip $PWD/target/debug/trust
    sudo ip addr add 10.0.0.1/8 dev tun0
    ping -I tun0 10.0.0.2
    sudo tshark -i tun0