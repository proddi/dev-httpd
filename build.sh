#!/bin/bash
set -e

CWD=$(cd $(dirname $0); pwd)
SRCDIR="$CWD/src"
BUILDDIR="$CWD/build"
VERSION=${1:-dev-build}

# "$CWD/dependencies.sh"

#(cd "$CWD" && {
#    GOPATH=$CWD go test -v -cover "src/dev-httpd"
#})

mkdir -p "$BUILDDIR"
(cd "$BUILDDIR" && {
    FILENAME="dev-httpd"
    echo -n "▶ building $FILENAME (version=$VERSION)..."
    GOPATH=$CWD go build -ldflags "-X main.version=$VERSION" "$SRCDIR/$FILENAME.go"
    echo -n " -> shrinking binary size by removing debug symbols..."
    OLD_SIZE=$(du -k "$FILENAME" | cut -f1)
    strip "$FILENAME"
    NEW_SIZE=$(du -k "$FILENAME" | cut -f1)
    echo " -> DONE (${OLD_SIZE}kb -> ${NEW_SIZE}kb)"
})

echo ""
echo "The build is here: $BUILDDIR:"
echo "`ls -la $BUILDDIR`"
