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
ipfs swarm peering add "/dns4/15-235-14-184.k51qzi5uqu5dj2rauyi7u92l2sldj7dkdhn18f4qccfvcyeca4ym7cveuv4qjl.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWHdZM98wcuyGorE184exFrPEJWv2btXWWSHLQaqwZXuPe"
ipfs swarm peering add "/dns4/40-160-21-102.k51qzi5uqu5dhy22gw9bhnr0ouwxub8ct5awrlfm3l698aj0gekrexa4g0epau.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWEaVCpKd2MgZeLugvwCWRSQAMYWdu6wNG6SySQsgox8k5"
ipfs swarm peering add "/dns4/15-235-86-198.k51qzi5uqu5dinxpj5iu3anaalt5ea7g0iy8al2bzejnljokrdy8hjp4cl4410.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWGX5HDDjbdiJL2QYf2f7Kjp1Bj6QAXR5vFvLQniTKwoBR"
ipfs swarm peering add "/dns4/148-113-164-86.k51qzi5uqu5dhgcti75x63nsx75kgrka20qyva1cwujesayi95i3l7dij37270.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWDFUatH1CTvrMDEL8nHCz9rBZLjtDYjNZE2og7WZvyDJ3"
echo "Connected to dClimate's IPFS nodes!"

echo "Current IPFS configuration:"
ipfs config show

tail -f /dev/null
