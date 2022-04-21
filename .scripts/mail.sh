#!/bin/bash
# icons depend on nerdfonts being installed
mail() {
    pakgs="$(ls /home/kim/.local/share/mail/*/INBOX/new | wc -l)"
    echo -e " $pakgs"
}
echo " 📬^c#c5c8c6^ $(mail) "
