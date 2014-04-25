#!/bin/sh

if [ -z "$WSPKGDIR" ]; then
    printf "\033[1;31mWSPKGDIR is not defined so I cannot build package for you :(\033[m\n"
    if [ -f "../wspkg/packages.mk" ]; then
        echo "You may want to try WSPKGDIR=\"$(dirname "`pwd`")/wspkg\" $0"
    elif [ -f "/usr/share/wspkg/packages.mk" ]; then
        echo "You may want to try WSPKGDIR=/usr/share/wspkg $0"
    elif [ -f "/usr/pkg/share/wspkg/packages.mk" ]; then
        echo "You may want to try WSPKGDIR=/usr/pkg/share/wspkg $0"
    elif [ -f "/usr/local/share/wspkg/packages.mk" ]; then
        echo "You may want to try WSPKGDIR=/usr/local/share/wspkg $0"
    fi
    exit 1
fi

[ -z "$1" ] && echo "Usage: $0 makefile" && exit 1
if [ -d "$1" ]; then
    makefile="${1}.mk"
else
    makefile="${1}"
fi
shift

: ${MAKE:="make"}
printf "\033[1;33mRunning\033[m: %s -f \"%s\" WSPKGDIR=\"%s\" " "${MAKE}" "$makefile" "$WSPKGDIR"
echo "$@"
echo ""
if ${MAKE} -f "$makefile" WSPKGDIR="$WSPKGDIR" "$@"; then
    printf '\n\033[1;32mDone! ;-)\033[m\n'
else
    printf '\n\033[1;31mSorry... :(\033[m\n'
fi
