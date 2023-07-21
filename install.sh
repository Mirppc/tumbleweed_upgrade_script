#!/bin/bash
#add repositories
zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/oss/ repo-oss
zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/non-oss/ repo-non-oss
zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/debug/ repo-debug
zypper ar -f -c http://download.opensuse.org/update/tumbleweed/ repo-update
zypper ar -f -d -c http://download.opensuse.org/tumbleweed/repo/src-oss/ repo-src-oss
zypper ar -f -d -c http://download.opensuse.org/tumbleweed/repo/src-non-oss/ repo-src-non-oss
zypper ar -f -c http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
zypper ar -f -c http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/ games
zypper ar -f -c https://download.opensuse.org/repositories/utilities/openSUSE_Factory/ utilities
zypper ar -f -c https://download.opensuse.org/repositories/hardware/openSUSE_Tumbleweed/ hardware
zypper ar -f -c https://download.opensuse.org/repositories/Emulators/openSUSE_Tumbleweed/ emulators
#refresh repositories getting GPG keys and package lists
zypper --gpg-auto-import-keys ref -non-interactive
#upgrade zypper as this is importiant especialy on pre Leap based systems.  
#Not doing this will result in an unstable system with no ability to fix the broken packages.
#If this fails and Zypper breaks, use the tumbleweed DVD to do an upgrade.
zypper up zypper libzypp
#an alternitive would be to wget zypper and libzypp and fore install them with rpm -i --nodeps.
#doing so may lead to a broken zypper if the original distro is too old.
#Now refresh agian
zypper ref
#If that works out then gather the packages needed for a dup. 
#This may fail due to curl and other dependencies, deal with those.
zypper --download-only dup
#Now refresh agian
zypper ref
#Do the dup with the cached packages
zypper dup
