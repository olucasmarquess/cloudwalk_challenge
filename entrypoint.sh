#!/bin/bash
set -e

# Remove um arquivo pid pré-existente de um servidor anterior
rm -f /myapp/tmp/pids/server.pid

# Executa o comando passado via docker-compose
exec "$@"
