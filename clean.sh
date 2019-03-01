#!/bin/bash
set -e

CWD=$(cd $(dirname $0); pwd)

echo -n "▶ Cleaning..."
(cd "$CWD" && {
    GOPATH=$CWD go clean "src/dev-httpd.go"
rm -rf "build"
rm -rf "pkg"
rm -rf "src/github.com"
#rm -rf "docs"
})

echo " -> DONE"
