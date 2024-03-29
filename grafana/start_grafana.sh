#!/bin/bash

GRAFANA_HOME="/shcsw/grafana"
GRAFANA_CONFIG_FILE="${GRAFANA_HOME}/conf/defaults.ini"
LOG_DIR="${GRAFANA_HOME}"

### create log directory
if [ ! -d "${LOG_DIR}/backup" ]; then
    mkdir -p ${LOG_DIR}/backup
fi

### backup stdout log
DATETIME="$(date +'%Y%m%d_%H%M%S')"
if [ -f "${LOG_DIR}/nohup.grafana.out" ]; then
    mv ${LOG_DIR}/nohup.grafana.out ${LOG_DIR}/backup/nohup.grafana.${DATETIME}.out
fi

### start
nohup ${GRAFANA_HOME}/bin/grafana-server \
    --config=${GRAFANA_HOME}/conf/defaults.ini \
    --homepath=${GRAFANA_HOME} \
    > ${GRAFANA_HOME}/nohup.grafana.out 2>&1 &
