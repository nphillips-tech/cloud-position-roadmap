# New Challenge
**Context:** I've been trying to figure out a good path to learn what feels like a whole ecosystem's worth of information for this new learning path that I'm on. I've gone from attempting Zero to Mastery (ZTM) to Cybex Books (Linux+) to boot.dev and even considered paying for private career tutors (way too costly - Mischa & Soleyman cost around $3,000-$5,000 which I don't have just lying around). I'm Frankenstein-ing my learning path and, full transparency, I've had AI (Gemini) help me out a lot; I lean into it when I'm stuck on a concept (what exactly is a yaml file) when other resources aren't getting it through my brain, and I've even leaned on it for guidance as far as direction; "Should I learn all of Linux first and then move on to AWS or bits and pieces". All of this to say, I'm continuing on learning what path works best for me, but currently I'm learning Git while also practicing Linux, trying to put it all together in a way that is somewhat useful for my journey. We shall see where it takes me. Should this be in a different section? Maybe. Maybe I find out that I should "commit this" to my readme file instead of my Linux foundations repo. We'll see! For now, here's what I went through and learned today from my capture the flag practice via overthewire.


# OverTheWire Bandit: Levels 0 to 3 Runbook
**Date:** June 2, 2026


## Level 0: Establishing Connection
* **Concept:** Connecting to a remote server over an encrypted channel using SSH on a custom port.
* **Command Used:** "ssh bandit0@bandit.labs.overthewire.org -p 2220"
* **Notes:** I've been toying around with ssh for some time in my VirtualBox "lab" (running Ubuntu from the CLI - completely headless) and so I've gotten some familiarity with the requirements for level 0.

## Level 0 -> 1: The Dashed File
* **The Problem:** The password was hidden in a file named "-". Running "cat -" broke because Linux thinks the dash is a command flag, not a filename.
* **The Solution:** Running cat "./-". 

Since I was already in the home directory (~), all I needed to do was run ls to verify that the file was in the directory, which it was. The dash is a poor way to name a file in Linux because we can't just "cat" a file named "-". a period (.) signifies the current working directory and the forward slash (/) added to it makes a relative path ("./"), helping us explicitly call out the name of the file "-".
* **Notes:** One thing I'll note is that I'm using "" to surround my commands that I'm running in the challenge. I'm not literally running the command with the quotes, I'm just defining what the command is inside the double quotes. 

## Level 1 -> 2: Spaces in Filenames
* **The Problem:** The file was named "--spaces in this filename--".
* **The Solution:** cat "./--spaces in this filename--"

This one is similar to the last challenge, but because the name has actual white spaces, a normal "cat" won't work. To help Linux know that we are calling out an actual file instead of attempting to add a bunch of non-existent arguments or switches, we need to put the filename in double quotes and run it.
* **Notes:** I actually discovered two things I didn't know. First, I usually try to tab complete my commands, so when I did this challenge, I initially typed out (I will omit my double quotes here to show what I typed without extra confusion) ./"[tab complete] which led to me getting ./"./--spaces in this filename--"... I originally thought I'd have to put just the filename in the quotes, not the relative path as well. Second, I leanred that, just like in python, single quotes and double quotes both work for this purpose.


## Level 2 -> 3: Hidden Entities
* **The Problem:** The directory looked completely empty when running standard "ls".
* **The Solution:** cat ...Hiding-From-You

First, I ran ls to make sure where I needed to go (dir 'inhere'). Then changing to the correct directory, "cd inhere", I ran just a basic "ls". This yielded no results, so running ls with the "-a" argument (argument? switch? I still need to make sure I'm using the correct nomeclature) to reveal "all" aka hidden files. Sure enough, the file I was looking for was hiding since it started with a period. All hidden files start with periods. 

# My Learning Journey & Direction
> **Context:** I've been trying to figure out a good path to learn what feels like a whole ecosystem's worth of information for this new learning path that I'm on. I've gone from attempting Zero to Mastery (ZTM) to Cybex Books (Linux+) to boot.dev and even considered paying for private career tutors (way too costly - Mischa & Soleyman cost around $3,000-$5,000 which I don't have just lying around). I'm Frankenstein-ing my learning path and, full transparency, I've had AI help me out a lot; I lean into it when I'm stuck on a concept (what exactly is a yaml file) when other resources aren't getting it through my brain, and I've even leaned on it for guidance as far as direction. All of this to say, I'm continuing on learning what path works best for me, but currently I'm learning Git while also practicing Linux, trying to put it all together in a way that is somewhat useful for my journey. We shall see where it takes me. 

---

# OverTheWire Bandit: Levels 0 to 3 Runbook
**Date:** June 2, 2026

## Level 0: Establishing Connection
* **Concept:** Connecting to a remote server over an encrypted channel using SSH on a custom port.
* **Command Used:** `ssh bandit0@bandit.labs.overthewire.org -p 2220`
* **Notes:** I've been toying around with ssh for some time in my VirtualBox "lab" (running Ubuntu from the CLI - completely headless) and so I've gotten some familiarity with the requirements for level 0.

## Level 0 -> 1: The Dashed File
* **The Problem:** The password was hidden in a file named "-". Running `cat -` broke because Linux thinks the dash is a command flag, not a filename.
* **The Solution:** Running `cat "./-"`. 

Since I was already in the home directory (`~`), all I needed to do was run `ls` to verify that the file was in the directory, which it was. The dash is a poor way to name a file in Linux because we can't just "cat" a file named "-". A period (`.`) signifies the current working directory and the forward slash (`/`) added to it makes a relative path (`./`), helping us explicitly call out the name of the file "-".
* **Notes:** One thing I'll note is that I'm using quotes to surround my commands that I'm running in the challenge notes. I'm not literally running the command with the quotes, I'm just defining what the command is inside the double quotes. 

## Level 1 -> 2: Spaces in Filenames
* **The Problem:** The file was named "--spaces in this filename--".
* **The Solution:** `cat "./--spaces in this filename--"`

This one is similar to the last challenge, but because the name has actual white spaces, a normal `cat` won't work. To help Linux know that we are calling out an actual file instead of attempting to add a bunch of non-existent arguments or switches, we need to put the filename in double quotes and run it.
* **Notes:** I actually discovered two things I didn't know. First, I usually try to tab complete my commands, so when I did this challenge, I initially typed out `./"` and hit tab, which led to me getting `./"--spaces in this filename--"`. I originally thought I'd have to put just the filename in the quotes, not the relative path as well. Second, I learned that, just like in Python, single quotes and double quotes both work for this purpose.

## Level 2 -> 3: Hidden Entities
* **The Problem:** The directory looked completely empty when running standard `ls`.
* **The Solution:** `cat ...Hiding-From-You`

First, I ran `ls` to make sure where I needed to go (dir 'inhere'). Then changing to the correct directory, `cd inhere`, I ran just a basic `ls`. This yielded no results, so running `ls` with the `-a` argument/switch to reveal "all" aka hidden files. Sure enough, the file I was looking for was hiding since it started with a period. All hidden files start with periods. 

---

# OverTheWire Bandit: Levels 4 to 6 Runbook
**Date:** June 3, 2026


## Level 3 -> 4: Find the Right File
* **The Problem:** The password for the next level is stored in the only human-readable file in the inhere directory but a generic "ls -la" doesn't do much to help find the password.
* **The Solution:** "file ./*" proceeded by "cat ./-file07"
* **Notes:** This one gave me a little more trouble. For a while, I was thinking that if I found the right "ls" argument, I'd be able to see the file type listed next to it. After a bunch of "man" page searches for ls to no avail, I looked at the "Commands you may need to solve this level" again and noticed that I've neglected other possible tools to solve this, namely "file". After looking into it, that was the correct tool to use, as its intended use is to determine the exact type of a file by inspecting the contents of the file. Typical data types include text (ASCII / UTF-8), executable, or data (basically binary). Since the goal was to find the one file with human readable content, I determined that I could find the correct file based on the filetype from the output:

```bash
bandit4@bandit:~/inhere$ file ./*
./-file00: data
./-file01: data
./-file02: data
./-file03: DOS executable (COM), start instruction 0x8c887e10 c3ee96c9
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data
```
Since file07 was the only text, that was the one I ran the following command to get the password:
```bash
cat ./-file07
```

## Level 4 -> 5: Specific File Properties Search
* **The Problem:** The file in question needs to match the following criteria: human-readable, 1033 bytes in size, not executable. The new issue is that there are now 20 additional folders to have to search through and doing so manually would be too time consuming.
* **The Solution:** "find . -type f -size 1033c ! -executable -exec file '{}' \; | grep ASCII"
* **Notes:** This one was a little more involved than even the last one! Moving forward, there's no need to add in the obvious "wow, this was harder than the last one!", so I'm going to stick to what the solution was and the logic behind getting there. A few things could be used to glean different parts of this challenge. For instance, "du" (disk usage) can tell us how much space is being taken up by any given file, so "du -ab | grep 1033" shows us all files, their disk usage in bytes but then piped (the output leveraged as input into a following command) into "grep" (a command that basically finds lines with respective matching strings) with 1033 at the end shows us all files that are using 1033 bytes of space. That kind of feels like cheating, since in this challenge there's only one file that is that exact size, plus it isn't technically correct (the best kind of correct) because it isn't accounting for the human-readability or non-executability aspects. So to do that, we are going to use "find . -type f -size 1033c ! -executable -exec file '{}' \; | grep ASCII". For the sake of my sanity, instead of talking through the entire thought process for each one, I'll explain each part of the command in chunks:

```bash
find . -type f -size 1033c ! -executable
```
this looks in each file and directory within the current working directory (.) and looks for files (-type f) with a size of 1033 bytes (-size 1033c). Interestingly, -size [number]b is not for bytes, rather for what's called "512-byte blocks" which is also apparently the default (using the command without the "b" switch). Finally, the "! -executable" command tells us that we are not looking for a file that is executable. The exclamation switch indicates a "not" argument. This part of the command addresses each of the initial criteria we are looking for in the challenge.

```bash
-exec file'{}' \;
```
Now we are simply trying to sift through the contents that "find" is looking for. Among the files found based on the first section's criteria, the find command does it's own filtering based on the "-exec" argument which essentially says "hey, for every file you find that previously matched, run the following command against it". The following command we chose to run against it was "file" because we are wanting to find the correct file format (specifying it in the next section), and we want to display the filename and path so that we can sift for the correct file. We do this by adding the "{}" characters in the command as they are the placeholders for the filename and path. From here, we have to add "\;" because it terminates the "-exec" command.

```bash
| grep ASCII
```
Finally we wrap it up by taking everything we strung together in the first command and using it as the input to our next command ("grep") via the pipe command ("|"). Since we are currently looking for a file that is specifically containing ASCII text (not other types of data, such as /maybehere02/-file2's X1 archive data), we add the "ASCII" string to call it out. From here, we get find the file we are looking for:

```bash
bandit5@bandit:~/inhere$ find . -type f -size 1033c ! -executable -exec file {} \; | grep "ASCII"
./maybehere07/.file2: ASCII text, with very long lines (1000)
```
We simply run "cat" on that file and we've found what we were looking for.


## Level 5 -> 6: Specific File Properties Search - Part 2
* **The Problem:** The file in question needs to match the following criteria: is owned by user bandit7, is owned by group bandit6, and is 33 bytes in size. The extra twist is that it resides "somewhere" on the server, not in the user's home directory as the past challenges have been.
* **The Solution:** find / -group bandit6 -user bandit7 -size 33c 2> /dev/null
* **Notes:** First off, I'm trying a formatting difference in this section. I'm trying to see if putting the three backticks + bash in the middle of the line works as well as leaving the command on the same line. Hopefully this doesn't turn out looking odd.

This solution was much simpler, especially given that one of the criteria we already learned how to find in the last challenge. For this challenge, we had to search the whole system, not just our home directory. So for this, adding in the root directory after find was how we would search the entire system. From there, just adding in the two new arguments "-group" and "-user" which both search for their respective object types along with our familiar "-size" argument, we were able to find our file... among a lot of other things! Without adding in our redirection command for errors ("2>") into the void (/dev/null), we would (and did!) find out that there were quite a number of directories we did not have permission to investigate. After appending the redirect, we were able to find the one and only file that applied to our criteria:

```bash
bandit6@bandit:~$ find / -group bandit6 -user bandit7 -size 33c 2> /dev/null
/var/lib/dpkg/info/bandit7.password
```
