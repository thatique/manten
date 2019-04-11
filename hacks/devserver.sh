#!/usr/bin/env bash

set -euo pipefail

TMPGOPATH=$(mktemp -d)

move_vendor_back() {
    mv $TMPGOPATH/src $PWD/vendor
}

mv $PWD/vendor $TMPGOPATH/src

trap move_vendor_back EXIT

GOPATH=$TMPGOPATH dev_appserver.py app.yaml