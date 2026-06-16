# Auditing and Filtering Active System Processes
**Date:** June 16, 2026

* **Goal:** Open up your local Ubuntu VM. Use man ps to research the standard administrator flag combination aux. Figure out how to run the full process tree and use a Linux pipe (|) with grep to filter out everything except the processes currently being run by your user account (nick)
* **Success Criteria:** Your terminal outputs a clean, real-time list showing the exact Process ID (PID), CPU/Memory utilization, and underlying execution commands tied strictly to your username.
* **Notes:** This one was rather simple! The solution is:
```bash
ps aux | grep "^nick"
```
I used this because "ps" shows processes and aux defines all processes (via the a; I could omit the "a" but then hidden processes wouldn't be captured. removing the a basically means that I want to look at more than just my own processes) with user oriented format (versus not showing the users associated with the process), and tty & other types of processes (versus tty only without the x).

From here, we simply "grep" the lines that START with nick (since that would indicate the process owner) via the ^ character. 

Here we get an example output of:
```bash
nick@nickubuntu:~$ ps aux | grep "^nick"
nick        1665  0.0  0.3  21744 12676 ?        Ss   Jun11   0:00 /usr/lib/systemd/systemd --user --deserialize=12
nick        1667  0.0  0.1  23004  4268 ?        S    Jun11   0:00 (sd-pam)
nick        1702  0.0  0.1   9252  6504 tty1     Ss+  Jun11   0:00 -bash
```

Funnily enough, if I run this command as is, I see that I also get the grep command itself in my output because it was being run under my account when I... well... ran it! See here:
```bash
nick       64439  0.0  0.0   6716  2700 pts/3    S+   18:46   0:00 grep --color=auto ^nick
```

To make this a little more polished, I can add the another grep command with a pipe to remove anything that contains "grep"
```bash
ps aux | grep "^nick" | grep -v "grep"
```