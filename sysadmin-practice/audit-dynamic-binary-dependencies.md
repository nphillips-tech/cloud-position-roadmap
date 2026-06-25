# Audit Dynamic Binary Dependencies
**Date:** June 25, 2026

* **Scenario:** You are deploying a pre-compiled compiled binary asset to a production server, but it keeps failing with a vague "shared library missing" error. You need to trace exactly what underlying C-libraries the software is trying to link against.
* **Goal:** Pick a standard system binary on your machine (like /bin/bash or /usr/bin/ss) and run the ldd (List Dynamic Dependencies) utility against it.
* **Success Criteria:** You can document the exact .so library paths your system utilities rely on to execute.
* **Notes:** As per the goal, I'm selecting the /usr/bin/grep binary. Let's take a look at the output of the "ldd" command against "grep".
```bash
nick@nickubuntu:/$ ldd /usr/bin/grep
linux-vdso.so.1 (0x00007a51cd748000)
libpcre2-8.so.0 => /usr/lib/x86_64-linux-gnu/libpcre2-8.so.0 (0x00007a51cd64e000)
libc.so.6 => /usr/lib/x86_64-linux-gnu/libc.so.6 (0x00007a51cd400000)
/lib64/ld-linux-x86-64.so.2 (0x00007a51cd74a000)
```
First, it's important to know that *grep actually lives somewhere* on the system. That said, as with many of our daily sysadmin commands, it lives in the /usr/bin/ directory. Second, it's important to understand what exactly "ldd" accomplishes. To most people, the output of the command that we ran is quite confusing; we see ".so" files , some characters that make up what looks like an arrow, and the a bunch of random characters within parenthases. We will break this down shortly, but I before doing so, let's look at "ldd". 

Per the man page, "ldd prints the shared objects (shared libraries) required by each program or shared object specified on the command line." All binaries, including grep, need a library in order to function. It's very common for libraries to be used by multiple programs - these are called "Dynamic Libraries". The reason that programs often use dynamic libraries is because it's far more efficient both for the developer (leverage preexisting complied code versus having to create their own) as well as the machine (calls one library upon need versus spinning up entire libraries for each program at a 1 to 1 ratio). These libraries assist in common tasks that programs may need, like resource management, displaying content on screens, and handling network connections. Because it would be too easy to get into the weeds on this topic and find out we're discussing how to compile C libraries, we're going to pivot to a more practical discussion relating to maintaining a system as a sysadmin/site reliability engineer/cloud engineer. We see the output of the the ldd command for grep and we get a few lines that need to be understood so that we can be prepared in case something goes awry. 

The first items we see on each line are the libraries themselves. A good way to know this because the file ends in a .so which indicates "shared object". These are what the program is calling for when it runs. A few of these have "=>" which simply indicate that "this is where this library lives". The path that follows is, in fact, the absolute path to the libraries. We also see the hex number which indicates the actual virtual memory address - this is where the kernel has mapped the specific library in RAM (it's worth noting that this hex number will change - it's random for security purposes). 

What is important to know for troubleshooting is that it's possible that libraries end up missing! This is how it may looks: "error while loading shared libraries: [library_name].so: cannot open shared object file: No such file or directory." Knowing the power of the ldd command can tell us what library might be missing. So for example, if the output from our earlier command resulted in an error it might look like:
```bash
nick@nickubuntu:/$ ldd /usr/bin/grep
linux-vdso.so.1 (0x00007a51cd748000)
libpcre2-8.so.0 => not found
libc.so.6 => /usr/lib/x86_64-linux-gnu/libc.so.6 (0x00007a51cd400000)
/lib64/ld-linux-x86-64.so.2 (0x00007a51cd74a000)
```
We see that the libpcre2-8.so.0 was not found. To troubleshoot missing libraries, we can either search for the system for them or install them. Here's how we might look to try and fix this issue:
```bash
# first command is to see where it might be on our system if it exists. If it does, we can copy the copy it to the /usr/local/lib path #
sudo find / -name "libpcre2-8.so.0"
# second command is to try and install it if it is missing #
sudo apt install apt-file && sudo apt-file update
apt-file search libpcre2-8.so.0
sudo apt install libpcre2-8-0
# this one updates the system's library cache #
sudo ldconfig
```

These are some good tools to use if troubleshooting a missing library! 

