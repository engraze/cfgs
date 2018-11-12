#!/usr/bin/python3

# AUTOMATIC BACKUP SCRIPT
#
# the remote machine is expected to have a startup script in the host's ~/bin
# the startup script must be called connect-to-[domain].sh and follow the same pattern as the rest
#
# the remote machine must have ssh root login enabled
# 'PermitRootLogin yes' in /etc/ssh/sshd_config
#
# the remote machine is expected to have a file called fs.txt in root's home (/root)
# fs.txt should contain the location of the file system to be backed up. e.g. /dev/sda
#
# the backups are saved in the host's ~/backups/ directory

import os, time

#show all domains in the ~/bin/connect-to* scripts
show_domains = "cat ~/bin/connect-to-* | grep ssh | awk \"substr(\\$2,0,2) != \\\"\\$1\\\" {print \\$2}\" | sed 's/.*[@] *//'"

#show everything between 'connect-to-' and '.sh' in the ~/bin directory
show_names = "ls ~/bin | sed -e 's/connect-to-\\(.*\\)\\.sh/\\1/'"

#arrays
domain = os.popen(show_domains).read().splitlines()
name = os.popen(show_names).read().splitlines()


for i in range(len(domain)):
    directory = "$HOME/backups/" + name[i] + "/"
    filename = name[i]+"-"+time.strftime("%Y-%m-%d")+".img"
    destination = directory + filename

    #ssh root@domain "dd if=/dev/fs" | dd of=~/backups/machine/machine-y-m-d.img
    backup = "ssh root@" + domain[i] + " \"dd if=\\$(cat fs.txt)\" | dd of=" + destination + " status=progress"

    print("[*] Backing up from " + name[i] + " [" + domain[i] + "]")
    os.system("mkdir -p " + directory)
    os.system(backup)
    print("\n")
