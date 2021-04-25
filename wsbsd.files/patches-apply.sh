#!/bin/sh

: "${PORTSDIR:="/usr/ports"}"
[ ! -d "${PORTSDIR}/.git" ] && \
	printf '%s is not a git checkout\n' "${PORTSDIR}" && exit 1

shdir="$(realpath "$(dirname "$0")")"
: "${shdir:="."}"

patchdir="${shdir}/patches"

cd "${PORTSDIR}" || exit
for patch_file in "${patchdir}"/*; do
	if patch -s -C -f -p1 < "${patch_file}"; then
		printf '==> Applying %s\n' "${patch_file}"
		patch -s -N -p1 < "${patch_file}"
	else
		printf '==> Skipping %s\n' "${patch_file}"
	fi
done
