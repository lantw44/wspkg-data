#!/bin/sh

: ${PORTSDIR:="/usr/ports"}
[ '!' -d "${PORTSDIR}/.svn" ] && \
    echo "${PORTSDIR} is not a svn checkout" && exit 1

shdir="$(realpath "$(dirname "$0")")"
: ${shdir:="."}

patchdir="${shdir}/patches"

cd ${PORTSDIR}
for patch_file in "${patchdir}"/*; do
	if patch -s -C -f -p0 < "${patch_file}"; then
		echo "==> Applying ${patch_file}"
		patch -s -N -p0 < "${patch_file}"
	else
		echo "==> Skipping ${patch_file}"
	fi
done
