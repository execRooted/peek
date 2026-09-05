#!/bin/bash

set -e

if [ -z "$TERM" ]; then
    export TERM=xterm
fi

clear
echo -e "\033[34mpeek installer\033[0m"
echo -e "\033[34m==============\033[0m"
echo -e "\033[34mby execRooted\033[0m"
echo ""

# Detect architecture
get_architecture() {
    local _ostype _cputype _bitness _arch _clibtype
    _ostype="$(uname -s)"
    _cputype="$(uname -m)"
    _clibtype="musl"

    if [ "${_ostype}" = Linux ]; then
        if [ "$(uname -o || true)" = Android ]; then
            _ostype=Android
        fi
    fi

    if [ "${_ostype}" = Darwin ] && [ "${_cputype}" = i386 ]; then
        if sysctl hw.optional.x86_64 | grep -q ': 1'; then
            _cputype=x86_64
        fi
    fi

    case "${_ostype}" in
        Linux)   _ostype=unknown-linux-${_clibtype} ;;
        Darwin)  _ostype=apple-darwin ;;
        MINGW* | MSYS* | CYGWIN* | Windows_NT) _ostype=pc-windows-msvc ;;
        *)       err "unsupported OS: ${_ostype}" ;;
    esac

    case "${_cputype}" in
        x86_64 | x64 | amd64)   _cputype=x86_64 ;;
        aarch64 | arm64)        _cputype=aarch64 ;;
        armv7l | armv8l)        _cputype=armv7 ;;
        arm)                    _cputype=arm ;;
        i386 | i686)            _cputype=i686 ;;
        *)                      err "unsupported CPU: ${_cputype}" ;;
    esac

    echo "${_cputype}-${_ostype}"
}

err() {
    echo -e "\033[0;31m[ERROR]\033[0m $1"
    exit 1
}

info() {
    echo -e "\033[1;33m[INFO]\033[0m $1"
}

success() {
    echo -e "\033[36m[SUCCESS]\033[0m $1"
}

# Check for curl or wget
if command -v curl >/dev/null 2>&1; then
    _dld=curl
elif command -v wget >/dev/null 2>&1; then
    _dld=wget
else
    err "curl or wget is required but not found."
fi

info "Detecting architecture..."
_arch="$(get_architecture)" || err "failed to detect architecture"
info "Detected architecture: ${_arch}"

case "${_arch}" in
    *windows*) _bin_name="peek.exe" ;;
    *)         _bin_name="peek" ;;
esac

info "Fetching latest release from GitHub..."
_releases_url="https://api.github.com/repos/execRooted/peek/releases/latest"

case "${_dld}" in
    curl) _releases="$(curl -sL "${_releases_url}")" ;;
    wget) _releases="$(wget -qO- "${_releases_url}")" ;;
esac

if echo "${_releases}" | grep -q 'API rate limit exceeded'; then
    err "GitHub API rate limit exceeded. Please try again later."
fi

_package_url="$(echo "${_releases}" | grep "browser_download_url" | cut -d '"' -f 4 | grep "${_arch}")" || \
    err "peek has not yet been packaged for your architecture (${_arch})"

info "Downloading package..."
_tmp_dir="$(mktemp -d /tmp/peek_XXXXXX)"
cd "${_tmp_dir}"

case "${_dld}" in
    curl) curl -sL "${_package_url}" -o package ;;
    wget) wget -qO package "${_package_url}" ;;
esac

info "Extracting package..."
case "${_package_url}" in
    *.tar.gz) tar -xf package ;;
    *.zip)    unzip -q package ;;
    *)        err "unsupported package format" ;;
esac

INSTALL_DIR="${HOME}/.local/bin"
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
fi

info "Installing peek to ${INSTALL_DIR}..."
cp -f "${_bin_name}" "${INSTALL_DIR}/${_bin_name}"
chmod +x "${INSTALL_DIR}/${_bin_name}"

cd - >/dev/null
rm -rf "${_tmp_dir}"

success "Installation complete!"
info "You can now run 'peek' from anywhere."
echo ""
echo -e "\033[1;33m[USAGE]\033[0m To run the tool, simply type: peek"
echo -e "\033[1;33m[USAGE]\033[0m For help run: peek -h"
echo ""
