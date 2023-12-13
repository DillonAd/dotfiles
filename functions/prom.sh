### Prometheus ###

function prom() {
  docker run --name prom -e TZ=UTC -p 30090:9090 -v ~/.prom.yml:/etc/prometheus/prometheus.yml -v ~/.prom.web.yml:/etc/prometheus/web.yml ubuntu/prometheus:latest
  docker stop prom
  docker rm prom
}
