# zerotier-masquerade


This container makes all attached docker networks accessible from the zerotier `zt0` interface.
In order to access your [swarm] networks attach them to the container.

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
