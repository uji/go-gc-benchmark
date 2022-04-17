#!/bin/bash -e
_benchmark() {
  local result
  result=$(docker run --rm -e GOBIN=/go -e GO111MODULE=off golang:$1 /bin/bash -c "go get golang.org/x/benchmarks/garbage && ./garbage -benchmem=10000 -benchtime=30s" | grep "BenchmarkGarbage")
  echo $result >> $result.log
}

_benchmark "1.10.0"
_benchmark "1.12.0"
_benchmark "1.14.0"
_benchmark "1.16.0"
_benchmark "1.18.0"
