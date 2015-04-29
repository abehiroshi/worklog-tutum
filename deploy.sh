#!/bin/sh -e

alias tutum='docker run -e TUTUM_USER=$TUTUM_USER -e TUTUM_APIKEY=$TUTUM_APIKEY -v $(pwd):/app abehiroshi/tutum-cli'

STACKNAME=${TUTUM_STACKNAME-worklog}-${IMAGE_TAG-latest}
STACKFILE=tutum-${IMAGE_TAG-latest}.yml

echo "tutum stack up ${STACKNAME}"
tutum stack update -f "/app/${STACKFILE}" "${STACKNAME}" || tutum stack up -n "${STACKNAME}" -f "/app/${STACKFILE}"
