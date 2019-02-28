#!/bin/sh

if [ -z "$WSPKGDIR" ]; then
    printf '\033[1;31mWSPKGDIR is not defined so I cannot build package for you :(\033[m\n'
    if [ -f "../wspkg/wspkg-mk/packages.mk" ]; then
        printf 'You may want to try WSPKGDIR="%s/wspkg" %s\n' "$(dirname "$(pwd)")" "$0"
    elif [ -f "/usr/share/wspkg/wspkg-mk/packages.mk" ]; then
        printf 'You may want to try WSPKGDIR=/usr/share/wspkg %s\n' "$0"
    elif [ -f "/usr/pkg/share/wspkg/wspkg-mk/packages.mk" ]; then
        printf 'You may want to try WSPKGDIR=/usr/pkg/share/wspkg %s\n' "$0"
    elif [ -f "/usr/local/share/wspkg/wspkg-mk/packages.mk" ]; then
        printf 'You may want to try WSPKGDIR=/usr/local/share/wspkg %s\n' "$0"
    fi
    exit 1
fi

[ -z "$1" ] && printf 'Usage: %s makefile\n' "$0" && exit 1
if [ -d "$1" ]; then
    makefile="${1}.mk"
else
    makefile="${1}"
fi
shift

: ${MAKE:="make"}
printf '\033[1;33mRunning\033[m: %s -f "%s" WSPKGDIR="%s"' "${MAKE}" "$makefile" "$WSPKGDIR"
for arg in "$@"; do
    printf ' %s' "$arg"
done
printf '\n\n'
if ${MAKE} -f "$makefile" WSPKGDIR="$WSPKGDIR" "$@"; then
    printf '\n\033[1;32mDone! ;-)\033[m\n'
else
    printf '\n\033[1;31mSorry... :(\033[m\n'
fi
