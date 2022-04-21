#!/bin/bash
#icons depend on nerdfonts being installed
hdd() {
      hdd="$(df -h / | grep /dev | awk '{print $4}' | sed 's/G/Gb/')"
        echo -e " $hdd"
    }
echo "🗃 ^c#81a2be^$(hdd)"


