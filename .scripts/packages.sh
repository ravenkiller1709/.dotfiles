#!/bin/bash
# icons depend on nerdfonts being installed
pkgs() {
    pakgs="$(checkupdates | wc -l)"
    echo -e " $pakgs"
}
echo "^c#de935f^📦 ^c#81a2be^$(pkgs)"
