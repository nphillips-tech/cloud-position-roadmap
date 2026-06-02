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
