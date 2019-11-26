#!/usr/bin/env bash

# Get parameters
ALIAS=${1}
MESSAGE=${2}
PRIORITY=${3}
OPSGENIE_API_KEY=${4}

# Make sure a message was defined
if [[ -z "${MESSAGE}" ]]; then
    echo "ERROR: No alert message was set while attempting to generate OpsGenie alert"
    exit 1;
fi

# Make sure an alias was defined
if [[ -z "${ALIAS}" ]]; then
    echo "ERROR: No alert alias was set while attempting to generate OpsGenie alert"
    exit 2;
fi

# Make sure an acceptable priority level was defined
if [[ "P1" != "${PRIORITY}" ]] && [[ "P2" != "${PRIORITY}" ]] && [[ "P3" != "${PRIORITY}" ]] && [[ "P4" != "${PRIORITY}" ]] && [[ "P5" != "${PRIORITY}" ]]; then
    echo "ERROR: An invalid alert priority level (${PRIORITY}) was set, it must be one of the valid OpsGenie alert levels (P1-P5)"
    exit 3;
fi

# Send alert via curl request to OpsGenie API
STATUS_CODE=$(curl -s \
    -o /dev/null \
    -w '%{http_code}' \
    -X POST https://api.opsgenie.com/v2/alerts \
    -H "Host: api.opsgenie.com" \
    -H "Authorization: Basic ${OPSGENIE_API_KEY}" \
    -H "User-Agent: EonxGitops/1.0.0" \
    -H "cache-control: no-cache" \
    -H "Content-Type: application/json" \
    -d "{ \
            \"entity\": \"github-actions\", \
            \"source\": \"${GITHUB_REPOSITORY}\", \
            \"details\": { \
                \"github_repository\": \"${GITHUB_REPOSITORY}\", \
                \"github_ref\": \"${GITHUB_REF}\", \
                \"github_workflow\": \"${GITHUB_WORKFLOW}\", \
                \"github_action\": \"${GITHUB_ACTION}\", \
                \"github_event_name\": \"${GITHUB_EVENT_NAME}\", \
                \"github_event_path\": \"${GITHUB_EVENT_PATH}\", \
                \"github_actor\": \"${GITHUB_ACTOR}\", \
                \"github_sha\": \"${GITHUB_SHA}\" \
            }, \
            \"alias\": \"${ALIAS}\", \
            \"message\": \"${MESSAGE}\", \
            \"priority\": \"${PRIORITY}\" \
        }")

# Validate status code
if [[ "${STATUS_CODE}" != "201" ]]; then
  echo "ERROR: HTTP response code ${STATUS_CODE} received, expected HTTP 201"
  exit 1
fi
