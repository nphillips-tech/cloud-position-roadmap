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
---

# OverTheWire Bandit: Levels 7 to 10 Runbook
**Date:** June 5, 2026


## Level 6 -> 7: Find the "millionth"
* **The Problem:** The password for the next level is in a file called data.txt in the home directory and is next to the word "millionth". It just so happens that the text has 98,567 lines!
* **The Solution:** "cat data.txt | grep millionth"
* **Notes:** This one was actually pretty simple. Given that we've been using the grep command already in our previous levels, finding the password was pretty straightforward. Getting the content of the file via "cat data.txt" actually takes about 15 seconds to fully finish printing to the terminal, so it makes our lives so much easier to pipe that output immediately into the grep command which, when adding in the "millionth" string, we simply get the one line we care about.

```bash
cat data.txt | grep millionth
```


## Level 7 -> 8: Uniquely Unique
* **The Problem:** The text we are looking for in the data.txt file is the only line of text that occurs only once. 
* **The Solution:** "sort data.txt | uniq -u"
* **Notes:** This one is a little trickier than it seems. This one requires us to "sort" the contents of the file into a singular output and pipe that into the "uniq" command. Once it is piped, we need to find out which line is the only line that actually occurs one time only. The tricky part is (or at least was for me) that you can't just use "uniq", "uniq -u" or "sort" alone. "Sort" takes the contents of the file and... well... sorts it! It defaults to alphabetical, but arguments can be added in to sort by different criteria. Unfortunately, all this does is reorder the contents, not trim down or even evaluate it to the degree we need to. 

Okay, so we decide to pipe the sorted data into the uniq command. The sneaky part is that "uniq" without additional switches only removes repeated data. It's like removing the same grocery item from a list that already had the item listed a few times. The issue with this is that we still can't tell which one was originally the **only** string without a repitition. The "-u" switch says "Hey, whatever is here, show me only what is uniquely unique. If something was here more than once, just remove it altogether from the output."

So one thing I thought was "Okay, then why do I have to run the 'sort' command? It seems redundant to me if I'm sorting the data just to have it removed." Seems logical to someone with my level of logic! The catch is that uniq only looks at back-to-back lines, so if the data goes something like the following, it won't actually trim the repeated data since they're not back-to-back:

A
B
C
B
A

This means that it requires us to run the entire command:


```bash
sort data.txt | uniq -u
```
I also thought to myself, "Well could I just use 'cat' and it be the same as 'sort'?", but as mentioned earlier, if a line isn't repeated literally right afterward, "uniq" won't cut it out, thus "sort" is necesssary. 

## Level 8 -> 9: Find the string!
* **The Problem:** The password has been placed in a file with a bunch of unreadable text and I need to find it. It is supposed to be prepended with some "=" symbols.
* **The Solution:** "strings data.txt | grep =="
* **Notes:** When the challenged mentioned that the password was one of the few human-readable strings, I knew I had to employ some other tools in my arsenal! Although I assumed the file in question would be a data file, I wanted to verify. I ran:
```bash
bandit9@bandit:~$ file data.txt
data.txt: data
```
Sure enough, I was going to be dealing with some funny-looking characters. That also means that it should be pretty easy to find what I need! By running "strings", I am looking for printable characters within the text, but then I need to find the specific characters that we can identify as our password. Enter our good old friend "grep". Taking the output via pipe, we grep for the leading equal signs and from there it was pretty straightforward what we were looking for:

```bash
bandit9@bandit:~$ strings data.txt | grep ==
 ========== the
========== password
========== is
========== [not going to spoil for others :)]
```

---

# OverTheWire Bandit: Levels 10 to 14 Runbook
**Date:** June 7, 2026


## Level 9 -> 10: Base64 Encoded Text
* **The Problem:** The password file is encoded in Base64 and we need to decode it into plain text.
* **The Solution:** "base64 -d data.txt"
* **Notes:** Another simple solution. The goal here is to help the end user to get familiar with decoding data. Since all we needed to do was decode the data, we just needed to run the base64. One thing that is helpful to know is that Base64 files end with either one or two equal signs ("=="). 


```bash
bandit10@bandit:~$ cat data.txt 
VGhlIHBhc3N3b3JkIGlzIGR0UjE3M2ZaS2IwUlJzREZTR3NnMlJXbnBOVmozcVJyCg==
```


```bash
bandit10@bandit:~$ base64 -d data.txt 
The password is dtR173fZK........
```


## Level 10 -> 11: Uniquely Unique
* **The Problem:** The text we are looking for in the data.txt file is the only line of text that occurs only once. 
* **The Solution:** "sort data.txt | uniq -u"
* **Notes:** This one is a little trickier than it seems. This one requires us to "sort" the contents of the file into a singular output and pipe that into the "uniq" command. Once it is piped, we need to find out which line is the only line that actually occurs one time only. The tricky part is (or at least was for me) that you can't just use "uniq", "uniq -u" or "sort" alone. "Sort" takes the contents of the file and... well... sorts it! It defaults to alphabetical, but arguments can be added in to sort by different criteria. Unfortunately, all this does is reorder the contents, not trim down or even evaluate it to the degree we need to. 

Okay, so we decide to pipe the sorted data into the uniq command. The sneaky part is that "uniq" without additional switches only removes repeated data. It's like removing the same grocery item from a list that already had the item listed a few times. The issue with this is that we still can't tell which one was originally the **only** string without a repitition. The "-u" switch says "Hey, whatever is here, show me only what is uniquely unique. If something was here more than once, just remove it altogether from the output."

So one thing I thought was "Okay, then why do I have to run the 'sort' command? It seems redundant to me if I'm sorting the data just to have it removed." Seems logical to someone with my level of logic! The catch is that uniq only looks at back-to-back lines, so if the data goes something like the following, it won't actually trim the repeated data since they're not back-to-back:

A
B
C
B
A

This means that it requires us to run the entire command:


```bash
sort data.txt | uniq -u
```
I also thought to myself, "Well could I just use 'cat' and it be the same as 'sort'?", but as mentioned earlier, if a line isn't repeated literally right afterward, "uniq" won't cut it out, thus "sort" is necesssary. 

## Level 11 -> 12: What's a ROT13?
* **The Problem:** The password is hidden in a cryptographic method. The challenge presents that all of the alphanumeric characters are offset by 13.
* **The Solution:** 
```bash
cat data.txt | tr [A-Za-z] [N-ZA-Mn-za-m]
```
* **Notes:** So this one threw me off a little bit. I wasn't quite understanding from the man page exactly how I was supposed to tranlate ("tr") the text. So here's what I know up through now and how I've used that to complete the challenge:

First, I had to investigate what ROT13 was. At it's core, it's a substitution cipher that changes any letter presented with one that is 13 letters downstream (A=N,B=O,C=P,etc).

Second, "tr" is one of those commands that needs input from a pipe (or potentially some other way) - you can't just run it directly against a file.

Third, the way that "tr" evaluates the set "A-Z" and "a-z" is not the way that I would evaluate it; allow me to explain. If the characters are offset 13 from their original position, A matches to N; B to O; C to P (and so on). My thought was that I could just loop the alphabet and give it the command:

```bash
tr [N-Mn-m]
```
My thought process was that it would go through N,M,O,P...Z --> A,B,C...L,M! I thought that it would loop back to the beginning of the Alphabet once I got past Z. That was my fatal mistake...well, not quite "fatal", although it perturbed me. After digging, I learned that the translate command doesn't think like I do and needs a little more explicit direction. Using the set [N-ZA-Mn-za-m] tells it "Hey, once you get to Z, you now have to start back at A and go through M." The formatting of the command's sets still seem bizarre to me. It would feel more approriate to write it out [N-Z;A-M,n-z;a-m] or something like that, but I digress.

All of that being said, the correct command requires us to use the "cat" command and then pipe it into our now-working command!


## Level 12 -> 13: De(Decom(Decompress(Decompression)ion)pression)compression AKA the Nightmare
* **The Problem:** Aside from the personal opinion of the ridiculousness of this challenge, the problem is that the password has been compressed repeatedly. In this challenge, to find the password, one must not only decompress the file, but they must decompress the file with the right tool and they must also be able to identify which tool to use.
* **The Solution:** A combination of many commands; xxd, gzip, bzip2, tar, mkdir, mv, and cp.
* **Notes:** So for the very first part of this challenge, you are presented with a text file in the Home directory called data.txt.

Once you try to "cat" it, you come to find that you have a bunch of unreadable data. What we actually are looking at is a hex dump. A hex dump is a way of displaying raw data as a grid with three different columns. A hex dump is data that can’t be represented in strings. The three columns include the address, the hex decimal representation of the data on that address and then the last column shows what the actual data is as a string. In the final column, there will be a combination of human readable text and periods. The periods are hex values that could not have been displayed as a string. 

```bash
bandit12@bandit:~$ cat data.txt 
00000000: 1f8b 0808 10da cf69 0203 6461 7461 322e  .......i..data2.
00000010: 6269 6e00 0140 02bf fd42 5a68 3931 4159  bin..@...BZh91AY
00000020: 2653 59e1 71be e800 0018 7fff dec6 ff7c  &SY.q..........|
00000030: bd9f 4fbf ff77 ffff bfed af5d bffb dffd  ..O..w.....]....
00000040: a8fa cfdf fbfb ffbb dd7f f5fb b001 3b18  ..............;.
.....
```

Fortunately, we have a tool that helps us with turning the hex data into something we can work with. The "xxd" command can allow us to either turn hexa decimal dump files into binary files or the other way around. in our use case, we need to revert the hexadecimal format into binary. 

So first we take the original data.txt and make a copy and move it into a temp directory by running:

```bash
andit12@bandit:~$ mktemp -d
/tmp/tmp.Vhrwo1Fz1E
bandit12@bandit:~$ cp data.txt /tmp/tmp.Vhrwo1Fz1E
bandit12@bandit:~$ ls /tmp/tmp.Vhrwo1Fz1E
data.txt
```
Now, to make life easier, we need to grasp a few concepts about compression. Magic bytes (or Magic Numbers) are flags at the beginning of a data file to indicate what type of formatting the file is. A few that will be relevant to us in the challenge:

gzip = 1F 8B
bzip2 = 42 5A 68
tar = 1F 9D

As of now, when we try to read the file via cat, we actually see the hex dump, indicating that it is currently in non-human readable format and we need to work with the actual data. To do this, we need to uncompress the file (decompress? uncompress? we all know what is meant!):

```bash
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd -r compressed_datafile uncompressed_datafile
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ ls
compressed_datafile  uncompressed_datafile
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ cat uncompressed_datafile 
4�idata2.bin@��BZh91AY&SY�q������|��O��w�����]����������������;��@�44���
��@C�A�&���h444
d2@VӔfSg�["�ڂ����l�jC�dJkJi������g�C�6C�=OI�`e@��/�Meh�4�����R��H>O����#� 
�(펛xh�&�
         @AM;%��k���q^2X��)��=؜�%a��VC%E�܇Ϙ!���~4��0�Zt=��dg�C�N
�`]y��3+�'�X��m���H�F�àC�q�D)�;��.t+�o$�S��G(Ȇ���A*��l�<�_���GX*MDIB��_ka�-+W#��̤L����C*�R�>���ņ���ս�n�qP��)rB+<b
                                                                                                    ��B�K��eԝ]^)0��ܑN$8\o��X��@
```
Now we're getting somewhere... sort of. Now we've gotten the data we want to work with but it's still not human-readable. If we run xxd again, we can glean more information:

```bash
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd uncompressed_datafile | head -n 5
00000000: 1f8b 0808 10da cf69 0203 6461 7461 322e  .......i..data2.
00000010: 6269 6e00 0140 02bf fd42 5a68 3931 4159  bin..@...BZh91AY
00000020: 2653 59e1 71be e800 0018 7fff dec6 ff7c  &SY.q..........|
00000030: bd9f 4fbf ff77 ffff bfed af5d bffb dffd  ..O..w.....]....
00000040: a8fa cfdf fbfb ffbb dd7f f5fb b001 3b18  ..............;.
```
Here we chose to keep our lives simpler by running the command and piping it into head and only wanting to see the first five lines. As noted earlier, we can see in the first line the magic bytes! We have 1F8B, indicating that it is a "gzip" formatted file. So now the process becomes renaming the file to a ".gz" filetype so that the "gzip -d" (or "gunzip") command knows what to do with it!

So here we go:
```bash
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv uncompressed_datafile uncompressed_datafile.gz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ ls
compressed_datafile  uncompressed_datafile.gz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ gunzip uncompressed_datafile.gz 
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ ls
compressed_datafile  uncompressed_datafile
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ cat uncompressed_datafile 
4Zh91AY&SY�q������|��O��w�����]����������������;��@�44���
```

We renamed it, ran the "gunzip" command, took a look at the file and found...more unreadable data. The raw binary, again! So, we rinse and repeat the process! (Hint - this sequencing happens more than I cared to go through). I will run the commands in order and put them on the screen and give you a TLDR at the bottom for everyone's sanity!
```bash
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv uncompressed_datafile uncompressed_datafile.bz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ bzip2 -d uncompressed_datafile.bz 
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ bzip2 -d uncompressed_datafile.bz 
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd uncompressed_datafile 
00000000: 1f8b 0808 10da cf69 0203 6461 7461 342e  .......i..data4.
...
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv uncompressed_datafile uncompressed_datafile.gz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ man gzip 
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ gzip -d uncompressed_datafile.gz 
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd uncompressed_datafile | head -n 2
00000000: 6461 7461 352e 6269 6e00 0000 0000 0000  data5.bin.......
00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv uncompressed_datafile uncompressed_datafile.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ tar -xf uncompressed_datafile.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ ls
compressed_datafile  data5.bin  uncompressed_datafile.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd data5.bin | head -n 2
00000000: 6461 7461 362e 6269 6e00 0000 0000 0000  data6.bin.......
00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv data5.bin data5.bin.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ tar -xf data5.bin.tar 
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ ls
compressed_datafile  data5.bin.tar  data6.bin  uncompressed_datafile.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd data6.bin | head -n 2
00000000: 425a 6839 3141 5926 5359 1900 f024 0000  BZh91AY&SY...$..
00000010: 8cff cfdc 6a40 40c0 7dff e120 5b23 8074  ....j@@.}.. [#.t
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv data6.bin data6.bin.bz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ bzip2 -d data6.bin.bz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd data6.bin | head -n 2
00000000: 6461 7461 382e 6269 6e00 0000 0000 0000  data8.bin.......
00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv data6.bin data6.bin.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ tar -xf data6.bin.tar 
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ ls
compressed_datafile  data5.bin.tar  data6.bin.tar  data8.bin  uncompressed_datafile.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ xxd data8.bin | head -n 2
00000000: 1f8b 0808 10da cf69 0203 6461 7461 392e  .......i..data9.
00000010: 6269 6e00 0bc9 4855 2848 2c2e 2ecf 2f4a  bin...HU(H,.../J
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ mv data8.bin data8.bin.gz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ gunzip data8.bin.gz
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ ls
compressed_datafile  data5.bin.tar  data6.bin.tar  data8.bin  uncompressed_datafile.tar
bandit12@bandit:/tmp/tmp.Vhrwo1Fz1E$ cat data8.bin 
The password is [I finally made it....]
```

After what felt like decompressing a file 100 times, we got through them all to find the password!

## Level 13 -> 14: SSH is the new "Password"
* **The Problem:** There is no longer (for this challenge at least) a password to find! This challenge requires you to leverage the existing private key that resides on the home directory of bandit13 and use that to connect to the next level instead of using a password.
* **The Solution:** 
```bash
scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private .
chmod 700 sshkey.private
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```
* **Notes:** This one also is not very difficult in terms of the amount of work involved, however this does require some knowledge about SSH, SCP and CHMOD. 

Some additional context to this level is that the challenge prevents us from being able to SSH into the next level from within the lab environment. That is the reason we need SCP; we need to securely copy the file (sshkey.private) from the user's home directory onto our local machine and then connect to the next level from there.

Since we need to grab the file from the remote machine, we have to call out the location we are copying from first in our command followed by the destination location. Additionally, we need to make sure we are using the same port that we have been since the environment requires us to use an alternate port from the typical port 22. Thus, we run:
```bash
scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private .
```

Now we have the file on our local machine. Before we can actually use it, though, we need to make sure that the file can only be read by bandit14 (the user we will log in with). When we run "ls -l sshkey.private", we see that the file has permissions that allow the owner to read, write but not execute while the group can read only. The server we are connecting to wants stricter permissions to be set on the file, so we set it to 700.
```bash
chmod 700 sshkey.private
```
Just for any readers that may venture upon my git commits in github, I will explain some brief permissions knowledge. Permissions, when set numerically, are broken down as such:
4 = read permissions granted
2 = write permissions granted
1 = execute permissions granted
0 = no permissions granted

There are also 3 separate numbers (hence the 700) that indicate 3 different permissions. The first number is for the owner, the second number is for the group, and the third is for "others". Technically there is a fourth digit, but that's too advanced for this topic today.

Now that we've changed the permissions to something that should work, we finally attempt to connect using the command:
```bash
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```
This is actually very similar to the normal commands we've been using to connect via ssh except the main difference is that we are using the "-i" flag which tells us that we are going to use an "identity file" which allows us to leverage a private key file to be used for connectivity. 
