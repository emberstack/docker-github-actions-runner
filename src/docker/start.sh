#!/bin/bash
set -e

ARCHITECTURE="$(arch)"
PLATFORM=$ARCHITECTURE
if [[ $PLATFORM == x86_64 ]]; then
  PLATFORM="linux-x64"
elif [[ $PLATFORM == arm* ]]; then
  PLATFORM="linux-arm"
elif [[ $PLATFORM == aarch64 ]]; then
  PLATFORM="linux-arm64"
else 
  echo 1>&2 "Unsupported architecture"
  exit 1
fi

ORGANIZATION=$ORGANIZATION
ACCESS_TOKEN=$ACCESS_TOKEN
REPO=$REPO
LABELS=$LABELS
NAME=$NAME

echo "Setup - Determining matching runner..."

RUNNER_VERSION=`curl -s -i https://github.com/actions/runner/releases/latest | grep location:`
RUNNER_VERSION=`echo $RUNNER_VERSION | sed 's#.*tag/v##'`
RUNNER_VERSION=`echo $RUNNER_VERSION | sed 's/\r//'`

curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-$PLATFORM-${RUNNER_VERSION}.tar.gz 
tar xzf ./actions-runner-$PLATFORM-${RUNNER_VERSION}.tar.gz


./bin/installdependencies.sh

export RUNNER_ALLOW_RUNASROOT="1"

echo "Setup - Getting registration token..."
if [ -z "$REPO" ]; then
  REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)
else
  REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/repos/${ORGANIZATION}/${REPO}/actions/runners/registration-token | jq .token --raw-output)
fi


echo "Setup - Configuring runner..."
if [ -z "$REPO" ]; then
  ./config.sh --url https://github.com/${ORGANIZATION} --token ${REG_TOKEN} --labels ${LABELS} --name ${NAME}
else
  ./config.sh --url https://github.com/${ORGANIZATION}/${REPO} --token ${REG_TOKEN} --labels ${LABELS} --name ${NAME}
fi

cleanup() {
    echo "Exit - Removing runner..."
    ./config.sh remove --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!