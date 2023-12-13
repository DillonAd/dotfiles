### OTEL Collector ###

function otel() {
  docker run -it --name otel -v ~/.otel-col.yml:/etc/otel/config.yaml otel/opentelemetry-collector
  docker stop otel
  docker rm otel
}