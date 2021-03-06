# Overview

Run the following on a fresh installation of Debian or [BunsenLabs](https://www.bunsenlabs.org/installation.html).

If running on Debian, you may need to comment out the line in `/etc/apt/sources.list` that references the CD-ROM before `apt-get` will fetch online packages.

    sudo apt-get install git ansible
    git clone https://github.com/dovellr177/thorn-linux
    cd thorn-linux
    sudo ansible-playbook -i hosts -e username=`logname` -c local thorn-linux.yml

**NOTE**: Some commands (like the one that updates the system packages) could take so long that they cause ansible to timeout;
just run the `ansible-playbook` command again if there is an error after an especially long step.

# UPDATING

From inside the thorn-linux directory, run the following:

    git pull
    sudo ansible-playbook -i hosts -e username=`logname` -c local thorn-linux.yml
