# Configure an Enterprise Shared Directory
**Date:** June 25, 2026

* **Scenario:** A team of developers needs a shared folder at /var/shared/dev-ops/ where they can all collaborate on scripts. However, security policy dictates two strict rules:

1. Any new file created inside this folder must automatically inherit the devops group ownership, no matter which user creates it.
2. Users should never be allowed to delete or rename another teammate's files, even if they belong to the same group.

* **Goal:** Create a new Linux group called devops. Create the directory, assign the permissions, and implement two advanced Linux permissions flags: the SetGID bit (for group inheritance) and the Sticky Bit (for deletion protection).
* **Success Criteria:** If you log in as a test user, create a file in that directory, and look at it via ls -l, it will automatically belong to the devops group, and other users won't be able to rm it.
* **Notes:** Below are the lost of commands that I ran and then I will explain the reasoning and decisions behind them.
```bash
sudo mkdir -p /var/shared/dev-ops
sudo groupadd devops
sudo chgrp devops /var/shared/dev-ops
sudo chmod g+sw /var/shared/dev-ops
sudo chmod +t /var/shared/dev-ops
usermod -aG devops nick
newgrp devops
```
Per the requirements, "we need to create a new shared folder --" everything else can pause for just a moment. We already know that a folder is equivalent to a directory, and making a directory is done via "mkdir". The folder needs to exist in "/var/shared/dev-ops". Since I don't already have the /shared directory nor the /dev-ops directory, I will need to call them out specifically in my command, but adding the -p flag creates all parent directories that do not exist yet, thus making it an easy command to run:
```bash
sudo mkdir -p /var/shared/dev-ops
```
The security policy requires two things, so let's start with the first:
"Any new file created inside this folder must automatically inherit the devops group ownership, no matter which user creates it." So in reading this, we need to make a group (devops), assign the newly created devops group as the group owner of the dev-ops folder (notice the similarities in names - it can be misleading, but there is a *group* called "devops" and a *directory* named "dev-ops"). So from here, we know we can run the following, since "root" was the owner of this group:
```bash
sudo groupadd devops
sudo chgrp devops dev-ops/
```
Now, we look at the permissions requirements. Between the first requirement of ownership of files belonging to the group regardless of who creates it and "Users should never be allowed to delete or rename another teammate's files, even if they belong to the same group", we need to make some modifications to the directory's permissions. Giving the group the permission to write, the executable permission with the SetGID on the group and the sticky bit on "others", we can meet the tasks permission requirements. Specifically, changing the group permissions for "write" allows users that are a part of the group to write files to the directory; changing the executable permiession to the SetGID makes it so that any files created in the directory will have their group ownership sset to that of the directory owner. Finally, the Sticky bit restricts file deletion so only the owner and root can delete the file.
```bash
sudo chmod g+sw /var/shared/dev-ops/
sudo chmod +t /var/shared/dev-ops/
```
**Bonus:** I could have chosen to combine the chmod permissions commands. Doing so would have looked like this:
```bash
sudo chmod g+ws,+t /var/shared/dev-ops
```
To test this, we can add my user to the group and then force the group update by running the following:
```bash
sudo usermod -aG devops nick
newgrp devops
```
"usermod" -a appends the group to the list of groups of the mentioned user and the -G flag specifies to add a group. "newgrp" forces the sync of the group membership without having to log out and log back in.
