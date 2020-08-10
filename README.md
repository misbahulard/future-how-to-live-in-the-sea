# How to live in the sea

Directory structure
```
.
├ kubernetes
│   ├ 01-lb-haproxy.sh
│   ├ 02-enable-br-netfilter.sh
│   ├ 03-master-firewall.sh
│   ├ 04-worker-firewall.sh
│   ├ 05-install-kubeadm.sh
│   ├ 06-master-bootstrap.sh
│   ├ 07-worker-bootstrap.sh
│   ├ 08-generate-manifest.sh
│   ├ 09-apply-manifest.sh
│   ├ 10-install-ingress-controller.yaml
│   ├ 11-spring-ingress.yaml
│   └ 12-lb-ingress.sh
└ swarm
    ├ 00-provision.sh
    ├ 01-node-label.sh
    ├ 02-docker-network.sh
    ├ 03-traefik-docker-compose.yaml
    ├ 04-spring-app-docker-compose.yaml
    ├ 05-cadvisor-docker-compose.yaml
    ├ 06-node-exporter-docker-compose.yaml
    ├ 07-prometheus-docker-compose.yaml
    ├ 08-grafana-docker-compose.yaml
    ├ README.md
    ├ certs
    │   ├ README.md
    │   ├ domain.crt
    │   ├ domain.csr
    │   ├ domain.key
    │   └ generate.sh
    ├ prometheus
    │   ├ README.md
    │   └ configs
    │       └ prometheus.yml
    └ traefik
        ├ README.md
        ├ traefik-dynamic.yaml
        └ traefik.yaml
```
