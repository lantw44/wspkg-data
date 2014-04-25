#!/bin/sh

: ${PORTSDIR:="/usr/ports"}
[ '!' -d "${PORTSDIR}/.svn" ] && \
    echo "${PORTSDIR} is not a svn checkout" && exit 1

shdir="$(realpath "$(dirname "$0")")"
: ${shdir:="."}

patchdir="${shdir}/patches"

cd ${PORTSDIR}
echo "==> Running svn status ..."
svn status | sed -e '/^?/d' -e 's#^[A-Z]* *\([^/]*\/[^/]*\)/.*$#\1#' | \
    sort | uniq | (
    while read oneline; do
        echo "==> Generating patch for ${oneline}"
        patch_name="$(echo "${oneline}" | tr '/' '_')"
        svn diff --patch-compatible "${oneline}" \
            > "${patchdir}/${patch_name}.patch"
    done )
