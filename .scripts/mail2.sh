#!/bin/sh
while :
do
   mail() {
    pakgs1="$(ls /home/kim/.local/share/mail/kim@kimkruse.xyz/INBOX/new | wc -l)"
    pakgs2="$(ls /home/kim/.local/share/mail/mail4kruse@gmail.com/INBOX/new | wc -l)"
    sum=$((pakgs1 + $pakgs2))
    }
echo " 📬 $sum "
    sleep 300
done
