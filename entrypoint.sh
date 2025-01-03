#!/bin/sh

echo "Starting IPFS Gateway..."
ipfs init --profile server
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
ipfs config Swarm.ConnMgr.Type "none"

ipfs daemon & sleep 5

echo "Connecting to dClimate's IPFS nodes..."
ipfs swarm peering add "/ip4/15.235.14.184/udp/4001/quic-v1/p2p/12D3KooWHdZM98wcuyGorE184exFrPEJWv2btXWWSHLQaqwZXuPe"
ipfs swarm peering add "/ip4/15.235.86.198/udp/4001/quic-v1/p2p/12D3KooWGX5HDDjbdiJL2QYf2f7Kjp1Bj6QAXR5vFvLQniTKwoBR"
ipfs swarm peering add "/ip4/148.113.168.50/udp/4001/quic-v1/p2p/12D3KooWPwXW1tXzHoHgMofDwc9uzi7PLVHZt7QbLNt2v3pxzoEF"
echo "Connected to dClimate's IPFS nodes!"

echo "Current IPFS configuration:"
ipfs config show

tail -f /dev/null
