# zerotier-masquerade


This container makes all attached docker networks accessible from the zerotier `zt0` interface.
In order to access your [overlay] networks attach them to the container.

```yaml
networks:
  default:
  apt-network:
    external: true
  build-network:
    external: true
  devpi-network:
    external: true
  nginx-network:
    external: true
  test-db-network:
    external: true
```

```yaml
networks:
 - apt-network
 - build-network
 - devpi-network
 - nginx-network
 - test-db-network
```

In this case you will have 5 networks attached `eth0..eth4` in runtime. 

Then route your traffic to these networks through the remote zerotier container:

```bash
ip route add 10.0.2.0/24 via 192.168.192.157
```

- `192.168.192.157` - is a local IP address of a running `zerotier-masquerade` container
- `10.0.2.0/24` - is a remote docker [overlay] network you want to reach from your local network
