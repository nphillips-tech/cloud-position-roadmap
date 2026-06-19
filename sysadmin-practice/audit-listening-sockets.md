# Auditing and Filtering Active System Processes
**Date:** June 19, 2026

* **Goal:** Research the ss utility (the modern replacement for netstat). Look at the flags -tulpn using man ss. Run the command on your VM and filter the output to show only services that are actively LISTENing for incoming traffic
* **Success Criteria:** You can identify every open port on your machine and determine which Process ID (PID) or service name is currently bound to it.
* **Notes:** This was another pretty straightforward goal. We combine the commands in the goal with grep and ensure we do this with elevated permissions:
```bash
nick@nickubuntu:~/cloud-position-roadmap/linux-foundations$ sudo ss -tulpn | grep LISTEN
[sudo: authenticate] Password:
tcp   LISTEN 0      4096      127.0.0.53%lo:53         0.0.0.0:*    users:(("systemd-resolve",pid=89702,fd=18))                                             
tcp   LISTEN 0      128           127.0.0.1:38093      0.0.0.0:*    users:(("code-fcf604774b",pid=95627,fd=9))                                              
tcp   LISTEN 0      4096         127.0.0.54:53         0.0.0.0:*    users:(("systemd-resolve",pid=89702,fd=20))                                             
tcp   LISTEN 0      128           127.0.0.1:42553      0.0.0.0:*    users:(("code-ffa3c3f656",pid=1888,fd=11))                                              
tcp   LISTEN 0      4096            0.0.0.0:22         0.0.0.0:*    users:(("sshd",pid=60590,fd=3),("systemd",pid=1,fd=207))                                
tcp   LISTEN 0      511                   *:80               *:*    users:(("apache2",pid=68763,fd=4),("apache2",pid=68762,fd=4),("apache2",pid=49424,fd=4))
tcp   LISTEN 0      4096               [::]:22            [::]:*    users:(("sshd",pid=60590,fd=4),("systemd",pid=1,fd=208))
```
We can see that the system is actively listening on ports 22 (SSH), 80 (HTTP), 53 (DNS), and 2 dynamic range ports 38093 & 42553. For the dynamic range ports, if I really want to know what they are, I can run "ps" and check them out with more detail. For instance, the tcp process that's listening for PID 1888 is actually my VS Code server worker process: 

```bash
...
tcp   LISTEN 0      128           127.0.0.1:42553      0.0.0.0:*    users:(("code-ffa3c3f656",pid=1888,fd=11))
...

nick@nickubuntu:~/cloud-position-roadmap/linux-foundations$ ps -fp 1888
UID          PID    PPID  C STIME TTY          TIME CMD
nick        1888       1  0 Jun11 ?        00:01:27 /home/nick/.vscode-server/code-ffa3c3f656c8df32d894e5f4d3673284d424205e --cli-data-dir /home/nick/.vscode-server/cli ag
````