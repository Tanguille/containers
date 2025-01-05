#!/usr/bin/env bash
version=$(curl -sL "https://github.com/userdocs/qbittorrent-nox-static/releases/latest/download/dependency-version.json" | jq --raw-output '.qbittorrent')
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
