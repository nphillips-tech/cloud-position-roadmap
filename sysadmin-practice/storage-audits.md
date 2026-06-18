# Storage Audit Task
**Date:** June 11, 2026

* **The Scenario:** A partition on a production server is filling up fast, and you need to figure out which directory is hogging the space so you can clear it before services crash.
* **Goal:** Figure out how to list all mounted storage drives in a human-readable format (GB or MB instead of raw bytes). Then, isolate the single largest folder sitting inside your home directory.
* **Success Criteria:** Identification of the percentage of disk space used on the root file system, and can display exactly how many megabytes my cloud-position-roadmap folder takes up.

* **Notes:** I'm starting the evaluation of the system space from highest up to most granular. First, we see that the current storage devices are sda and sr0 (sr0 being the virtual optical drive that my hypervisor used to load up the .iso file to install Ubuntu). Below we have identification of the disk space used on the root file system:
```bash
nick@nickubuntu:~$ lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda                         8:0    0   25G  0 disk 
├─sda1                      8:1    0    1M  0 part 
├─sda2                      8:2    0    2G  0 part /boot
└─sda3                      8:3    0   23G  0 part 
  └─ubuntu--vg-ubuntu--lv 252:0    0 11.5G  0 lvm  /
sr0                        11:0    1 1024M  0 rom  
```
After this, we want to see the actual percentage of the space the root file system is taking up. To do so, we run: 
```bash
nick@nickubuntu:~$ df -h /
Filesystem                         Size  Used Avail Use% Mounted on
/dev/mapper/ubuntu--vg-ubuntu--lv   12G  7.8G  2.9G  74% /
```

From here, we want to see how much space the cloud-position-roadmap space takes up. To do so we run 
```bash
nick@nickubuntu:~$ du -ha -d 1 cloud-position-roadmap/
56K     cloud-position-roadmap/linux-foundations
4.0K    cloud-position-roadmap/bandit.sh
12K     cloud-position-roadmap/sysadmin_practice
496K    cloud-position-roadmap/.git
4.0K    cloud-position-roadmap/README.md
576K    cloud-position-roadmap/
```

We see that the cloud-position-roadmap directory is taking up 576 KBs of system space. 

To do one last investigation, we wanted to see what the biggest file itself was within the home directory. So to do so, we run:

```bash
nick@nickubuntu:~$ du -ha . | sort -h
...
269M    ./.local/opt/go-v1.26.3
385M    ./.local
385M    ./.local/opt
482M    ./.vscode-server/cli/servers/Stable-6a44c352bd24569c417e530095901b649960f9f8
482M    ./.vscode-server/cli/servers/Stable-6a44c352bd24569c417e530095901b649960f9f8/server
482M    ./.vscode-server/cli/servers/Stable-ffa3c3f656c8df32d894e5f4d3673284d424205e
482M    ./.vscode-server/cli/servers/Stable-ffa3c3f656c8df32d894e5f4d3673284d424205e/server
485M    ./.vscode-server/cli/servers/Stable-1b50d58d73426c9171299ec4037d01365d995b78
485M    ./.vscode-server/cli/servers/Stable-1b50d58d73426c9171299ec4037d01365d995b78/server
1.5G    ./.vscode-server
1.5G    ./.vscode-server/cli
1.5G    ./.vscode-server/cli/servers
2.9G    ./what_is_in_here
2.9G    ./what_is_in_here/text_got_fallocated.txt
5.0G    .
```

From here, we see that the "text_got_fallocated.txt" file was the largest!