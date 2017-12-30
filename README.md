# tumbleweed_upgrade_script
This is a script to add what i would call important repos for a tumbleweed install.

To use execute as root the script

#sh ./install.sh

Will not work with Opensuse 11.4 or older.  The OSS and non-oss repos error out.
Explination:
'tacit' " https://en.opensuse.org/SDB:System_upgrade   Note the "hopping" restrictions. In short, don't.
Your old package management cannot understand the current repository format."
