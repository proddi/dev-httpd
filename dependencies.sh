#!/bin/bash
set -e

CWD=$(cd $(dirname $0); pwd)

echo -n "▶ getting dependencies..."
GOPATH=$CWD go get "github.com/stretchr/testify/assert"
GOPATH=$CWD go get "github.com/Sirupsen/logrus"
echo " DONE"
