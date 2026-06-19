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

---

# OverTheWire Bandit: Levels 14 to 17 Runbook
**Date:** June 8, 2026


## Level 14 -> 15: Localhost aka loopback aka 127.0.0.1
* **The Problem:** The password for the next level is acquired by using the actual password for level 14 (not the ssh key used in the last challenge) and leveraging it with localhost on port 30000
* **The Solution:** 
```bash
nc localhost -p 30000
[enter password]
```
* **Notes:** So this one actually leverages "nc" or "netcat" to sneak around this obstacle. Netcat is actually a very powerful tool that can do a wide variety of things, including port scanning, file transfer, network service testing, ,and much much more! 

In our scneario, we used nc to connect to our own server via localhost (127.0.0.1 which is our loopback address). Localhost simply means "ourself". When in a browser and we type localhost, we are browsing to our own machine. So in the challenge, we need to connect to our own machine but ssh is blocked, so we have to use another method of doing so. 

Once we acquired the password from the stored password file, /etc/bandit_pass/bandit14, we ran the command in our solution which spit back a "Correct!" followed by the password we are to use for the next level!
q
```bash
bandit14@bandit:/etc/bandit_pass$ nc localhost 30000
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
Correct!
[pretend this is a password]

^C
```


## Level 15 -> 16: Localhost via SSL/TLS
* **The Problem:** The password is hidden similarly to level 15, however we need to connect over SSL/TLS over port 30001
* **The Solution:** 
```bash
openssl s_client -connect localhost:30001
```
* **Notes:** This one truly is a rinse and repeat of the last level but in a different capacity. OpenSSL can do many things SSL/TLS related. This time, we simply want to use it to connect to localhost and we do so by using the s_client connect. On a personal level, I'm somewhat familiar with this command already and I have had to use openssl to both generate certificates, certificate signing requests (CSRs), and also connect to servers to get their certificate information. In our lab, we run the following command along with the password of the level and get a similar repsonse as the last level (we just have to sift through a bunch of certificate related information):

```bash
bandit15@bandit:/etc/bandit_pass$ openssl s_client -connect localhost:30001
...
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
Correct!
[the password was here, I promise]
```

## Level 16 -> 17: Nmap for the win!
* **The Problem:** The password is saved in similar fashion as the last two challenges - I need to connect to localhost over a particular port. The problem is that this time I have to find the right port somwhere within the range of 1000 ports! 
* **The Solution:** 
```bash
nmap -sV localhost -p31000-32000
openssl s_client -quiet -connect localhost:[port] 
```
* **Notes:** Finally, the last challenge of the day! That said, this one was not as challenging! We had to find out which port among the thousand possibilities (between 31000 and 32000). It has to be one that is running SSL and won't return back the same entry we input. Nmap to the rescue! It is, similarly to ncat, a very powerful tool. In our use case, we can use it to discover which ports are open as well as which services it is using by running:
```bash
bandit16@bandit:~$ nmap -p31000-32000 localhost
Starting Nmap 7.94SVN ( https://nmap.org ) at 2026-06-09 01:08 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00011s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT      STATE SERVICE
31046/tcp open  echo
31518/tcp open  ssl/echo
31691/tcp open  echo
31790/tcp open  ssl/unknown
31960/tcp open  echo
```
We see that there are 5 open ports, 2 of which are running SSL, and 1 of which that is not going to run back the command we are going to give it as input via echo. This leaves us with port 31790! From here, we know what to do!

```bash
bandit16@bandit:~$ openssl s_client -quiet -connect localhost:31790
Can't use SSL_get_servername
depth=0 CN = SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN = SnakeOil
verify return:1
kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
Correct!
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
...
```
Voila! Now we simply need to copy this new private key to our local machine so we can ssh into the next level!

---

# OverTheWire Bandit: Levels 17 to 20 Runbook
**Date:** June 11, 2026


## Level 17 -> 18: What's the diff?
* **The Problem:** The password is hidden in the passwords.new file and is the only line that's different from the passwords.old file.
* **The Solution:**
```bash
diff passwords.new passwords old
```
* **Notes:** Personally, I feel that this challenge should have been in an earlier level due to difficulty. The goal is to find out the one line that is different between the two in the home directory. This one line will be the password to the next level. Fortunately, this challenge only really requires the one command, "diff". Here's what we get when we run it against the two files:
```bash
bandit17@bandit:~$ diff passwords.new passwords.old 
42c42
<   
---
> 390zFj2NETFVZkqYw8UEFdN6h40oGVtT
```
The anatomy of this output is as follows:

* 42c42: This is the first piece of output that we see. The first "42" indicates the line that the first file (passwords.new) has the difference, the "c" indicates that there is a change. Other options could be "a" for add, where a line could be added where it doesn't exist in the other file, or "d" where the file could be deleted in comparison to the file being compared. 
* < x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO: The second line indicates that the file on the left of the command, which in our case is passwords.new, is being referenced. It is saying the difference is the string that follows.
* ---: This is the separator of the next section, indicating that all differences from file 1 are finished being displayed.
* \ > 390zFj2NETFVZkqYw8UEFdN6h40oGVtT: Finally, this indicates the second file is being referenced with the ">" sign along with the difference that exists in the second file (passwords.old)

From this, we can see that the difference is on line 42 and the passwords.new file has what is supposed to be our key to the next level!


## Level 19 -> 20: Very special password privileges
* **The Problem:** The password for the next level requires us to run the setuid binary that's in the home directory. 
* **The Solution:** 
```bash
 ./bandit20-do cat /etc/bandit_pass/bandit20
```
* **Notes:** This one is simple enough once you get a grasp of the concept of the problem. The file that's listed in the home directory is highlighted red with white text. Although the guide indicates what we are working with (setuid), I wanted to verify. Files that are formatted in this particular color scheme do in fact indicate that they are files with the specific special permission of setuid. Essentially, the file being SUID indicates that it has a special permissions flag that says "I may be able to be run by other users, but it will actually be facilitated as though it were run by the owner". 

A quick peek at the file itself tells us something we don't normally see on file permissions:
```bash
bandit19@bandit:~$ ls -l
total 16
-rwsr-x--- 1 bandit20 bandit19 14888 Apr  3 15:17 bandit20-do
```
Here we see in the owner's permissions that the execuatble bit is actually replaced by an "s". This is the special character that indicates that it will be executed as the owner of the file. We can also see that the owner of the file is bandit20, the user of the level we are trying to reach.

So back to the goal of the challenge: access the password from the normal /etc/bandit_pass directory that stores level passwords. Since we cannot read this directory as bandit19, we can use the "bandit20-do" SUID file to access the password. To do that, we run:

```bash
bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit20
[here is the password output]
```

---

# OverTheWire Bandit: 20 to 24
**Date:** June 16, 2026


## Level 20 -> 21: Netc"at" it again
* **The Problem:** There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).
* **The Solution:** 
```bash
echo "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" | nc -l -p 61626 &
...
./suconnect 61626
```
* **Notes:** To get this password, we don't need too many commands, but we need the right ones with the right info! The setuid actually facilitates connecting to localhost on the port I specify (I chose 61626 since it's the date I did it on). Since it's essentially running it's own netcat command to connect, we know that we can run our own netcat command to connect as well! That said, we need to provide the password of the bandit20 level and to do that we simply "echo" the password, pipe it into the netcat command and add the necessary flags. 

After we run the command, we just need to run the setuid with the port number specified and we get what we were looking for!
```bash
bandit20@bandit:~$ ./suconnect 61626
Read: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
Password matches, sending next password
[password!!!]
```

## Level 21 -> 22: Walter CronCat
* **The Problem:** A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.
* **The Solution:** 
```bash
cd /etc/cron.d
cat cronjob_bandit22
cat /usr/bin/cronjob_bandit22.sh
cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
```
* **Notes:** Talk about an easy challenge! These levels have been varying in difficulty, but this one was a piece of cake. Per the description, the regularly scheduled job should provide me insight into where to get the password. Since we are trying to get into level 22, we wanted to go investigate any cronjobs that would tell us about that level.
```bash
bandit21@bandit:/etc/cron.d$ cd /etc/cron.d
bandit21@bandit:/etc/cron.d$ ls
behemoth4_cleanup  clean_tmp  cronjob_bandit22  cronjob_bandit23  cronjob_bandit24  e2scrub_all  leviathan5_cleanup  manpage3_resetpw_job  otw-tmp-dir  sysstat
bandit21@bandit:/etc/cron.d$ cat cronjob_bandit22
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
```

Here we navigate, display existing files in the desired directory, and then display the contents within the correct file. We see that on reboot bandit22 runs the bash script and puts errors into the void AND it also executes every minute, hour, day, week, (etc). So we want to see the contents of the contents of the script in question, so we "cat" it out and find out that it's simply doing it's own "cat" of the password file into a file in the /tmp directory.

```bash
bandit21@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit22.sh
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
bandit21@bandit:/etc/cron.d$ cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
[password was here]
```


## Level 22 -> 23: 
* **The Problem:** A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.
* **The Solution:** 
```bash
echo I am user bandit23 | md5sum | cut -d ' ' -f 1
```
* **Notes:** I must be honest... I got tripped up on the easiest part of this challenge. Allow me to walk you through my investigations and watch how I fumbled the easiest part. 

First, we run it back again with the same old commands:
```bash
bandit22@bandit:~$ cd /etc/cron.d
bandit22@bandit:/etc/cron.d$ ls
behemoth4_cleanup  cronjob_bandit22  cronjob_bandit24  leviathan5_cleanup    otw-tmp-dir
clean_tmp          cronjob_bandit23  e2scrub_all       manpage3_resetpw_job  sysstat
bandit22@bandit:/etc/cron.d$ cat cronjob_bandit23
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
bandit22@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit23.sh
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
```
We see from the above, we get to a point where we are looking into a bash script that needs deciphering! First, #!/bin/bash tells the system "Hey, I'm a script... run me!", so we can acknowledge that and move on to the next lines. 

Next, we are defining a variable which is called "myname" and it is being set to whatever the output of the "whoami" command is (which would be bandit23 for the password we want to find). 

The second line of actual script is defining another variable, but this time with a little more spice. We see that the variable "mytarget" is a string made up of the echoed "I am user" plus the username of the user (which will be bandit23). This gets piped into a md5sum hashing command which essentially turns it into unintelligible data. The last pipe takes the hashed data and cuts out the first field of the output and defines the delimiter as a whitespace. After all of these piped commands, we have ourselves the "mytarget" variable.

Now the final piece of the script echoes a string where it says the password file is being copied from the password file in the normal password directory of the user (bandit23) into the newly created variable. From here, finding the variable was essentially just running the command! Here's where I got frustrated. I kept taking "bandit23" and running it through md5sum and then cleaning it up with "cut" and it just kept failing! What I needed to do was remember that the value being piped into the md5sum command was the whole string! Eventually I caught on and added the "I am user" portion and got the correct output. Then it was just a matter of "cat"ing the contents of that newly discovered file!



```bash
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```

## Level 23 -> 24: 
* **The Problem:** A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.
* **The Solution:** 
```bash
bandit23@bandit:~$ echo -e '#!/bin/bash\ncat /etc/bandit_pass/bandit24 > /tmp/final_bandit24_secret.txt\nchmod 666 /tmp/final_bandit24_secret.txt' > /tmp/getpass.sh
bandit23@bandit:~$ chmod +x /tmp/getpass.sh
bandit23@bandit:~$ cp /tmp/getpass.sh /var/spool/bandit24/foo/
bandit23@bandit:~$ cat /tmp/final_bandit24_secret.txt
[correct password shown here!]
```

* **Notes:** Notes on the script that I am reading from: This one was quite the challenge. I took a lot of notes on this one, so I shared them below. Essentially I am figuring this one out on the fly and write down my gatherings as I complete it instead of coming back and taking notes once it was all completed. Here's the fun I had:

first, we are running the command:
```bash
shopt -s nullglob
```
shopt is one of the few that does not have a "man" entry, but requires a "help" command to learn about it. I learned that shopt's role is to set and unset shell options and specifically that the "-s" option enables each OPTNAME, in which case is nullglob. 

Next, we see the set variable "myname" which is set to the printout of the "whoami" command. 

The command begins with:
```bash
cd /var/spool/"$myname"/foo || exit
```
So far so good; change directory to the foo directory that lives in /var/spool/"$myname" which for us will be "bandit23" here on out. The || means that it's an "or" statement. Normally, one | means that we feed the output of the preceeding command into the next one, but with two pipes, it becomes an "or" command, where we see here that it either goes into this directory OR exits.

Another easy line of the script is:
```bash
echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
```
This one "echos" to the user that "Executing and deleting all scripts in /var/spool/$myname/foo:", which of course has the variable replaced with bandit23. This also kind of gives us a hint at what the goal of the script will do, which should help us navigate breaking down the script so as to understand it.

Next we get into what looks like python programming, though I understand that this is Bash scripting. As of today, I know basics about programming, so I am dissecting this as I go. By the time you reach the end of this challenge's submission, you will have watched me figure it out as I go.
```bash
for i in * .*;
```
This is what is called a "for loop" where the variable "i" is set and then used in the actual loop. The "in * .*" section gives us the actual input formatting. Finally, the ";" tells us that the loop is as follows:
```bash
do
    if [ "$i" != "." ] && [ "$i" != ".." ];
    then
```

The "do" followed by the "if" part kicks us off by saying "do this if the following applies". Then it jumps into "if the variable i that is passed into this loop does not equal a "." and also does not equal a "..", then continue on".

```bash
echo "Handling $i"
owner="$(stat --format "%U" "./$i")"
```
We are already familiar enough with echo, so we know that we are printing to the user "Handling [the inputted variable aka "i"]. The next part we are also somewhat familiar with already because we already discussed what variable setting is. We can see that we are trying to define the variable "owner" as the owner of the file "./%i" which is a newly formatted username of the owner via the "stat --format %U" command. 

```bash
if [ "${owner}" = "bandit23" ] && [ -f "$i" ];
```
From here, we start another "if" statement! If the newly created owner variable happens to each bandit23 **and** the variable exists and is a regular file (had to do some research on this; the "-f" flag threw me off without a command preceding it, so I discovered that if it exists within square brackets, like in this script, it means that it is checking to verify that it is real and is not a directory or a device)...

Then... (hence the ";then")
```bash
timeout -s 9 60 "./$i"
```
Here we have the timeout command which runs the command that follows (our script variable which will be the "./$i") and then kills it (by the 9 argument) after it is run or 60 seconds. 

The if statement is then completed with an "fi" syntax. We still have one more if statement to "end" but before that, we have one more command that we see:
```bash
rm -rf "./$i"
```
We see a pretty straightfowrard final command (and one we expected based on the first "echo" command) that tells us that it wraps up with forcefully removing the file and anything else in the directory recursively.

```bash
    fi
done
```
The last two sytaxes are the closing of the previous "if" statement and then the "done" which finished up the "for" loop.

Now that we understand the script, we know how we can create our own script to grab the password for the next level! To break it down now before writing it out:
- the variable needs to not equal the default hidden files (so far, so good)
- the variable will need to equal the bandit23 user and that it must be flagged as an executable file (chmod +x) so that the background automated cron script can successfully trigger its logic and output the secret file into /tmp/ before deleting our injection vehicle


#!/bin/bash

cat /etc/bandit_pass/bandit24 > /tmp/nick_stolen_bandit24pass.txt


---

# OverTheWire Bandit: Levels 24 to 26 Runbook
**Date:** June 19, 2026

## Level 24 to 25: "Bash" aka Brute Scripting
* **Concept:** A daemon is listening on port 30002 and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pincode. There is no way to retrieve the pincode except by going through all of the 10000 combinations, called brute-forcing.
You do not need to create new connections each time
* **Script Created:**
```bash
#!/bin/bash
password=$(cat /etc/bandit_pass/bandit24)

for i in {0000..9999}; do
        echo "$password $i"
done | nc localhost 30002
```
* **Notes:** Challenge 25 was actually very fun! I had an inkling that the challenge would require a script given that I would have to try 10000 combinations which nobody has time to do manually! So into the scripting we go.

First, we start off our script with the shebang along with the shell used to write the script. From here, since we needed to not only attempt 10000 combinations of 4 digit codes, but we also needed a preceeding password and whitespace, I figured we ought to define the variable first! Variables need to be defined before they can be used, so doing so first is required. This is where I decided to make the variable "password" and to set it to be the contents of the bandit24 password file:
```bash
password=$(cat /etc/bandit_pass/bandit24)
```
Second, since we will be looping through many iterations of combinations, we need to create a "for" loop. My thought was that for each loop, make the variable (i) a number that starts with exactly 0000 (not just a single 0) and then increment the loop each time by 1 digit until we get through 9999. Each time the loop is run through, we want to echo the password variable, white space, and then the "i" variable. 
```bash
for i in {0000..9999}; do
        echo "$password $i"
```
Notice that this loop is not technically finished. I didn't show my last line of the script because I wanted to explain the options that could be done. Technically, we could add the connection as part of the loop, adding in nc localhost 30002 (our necessary command to connect to the daemon), but this would end up causing there to be the 10000 connection attempts, potentially (probably) overloading the system's resources. Instead, I closed the loop and then piped the output into a single connection by leaving the netcat command outside of the loop:
```bash
done | nc localhost 30002
```

When running the script, we get a bunch of fun results telling us how wrong we really are...until we aren't! To run the script, we create a tmp file, give it the permissions to execute (chmod +x), and the run it!"
```bash
Wrong! Please enter the correct current password and pincode. Try again.
Wrong! Please enter the correct current password and pincode. Try again.
Wrong! Please enter the correct current password and pincode. Try again.
Wrong! Please enter the correct current password and pincode. Try again.
Wrong! Please enter the correct current password and pincode. Try again.
Correct!
[here is where the password was given!]
```

## Level 25 to 26: 
* **Concept:** Logging in to bandit26 from bandit25 should be fairly easy… The shell for user bandit26 is not /bin/bash, but something else. Find out what it is, how it works and how to break out of it.
* **Commands Run:**
```bash
ssh -i bandit26.sshkey bandit26@bandit.labs.overthewire.org -p 2220
...
v
...
:set shell=/bin/bash
:shell
cat /etc/bandit_pass/bandit26
```
* **Notes:** Knowing Vim helps a lot with this challenge. I had to do a decent amount of research as I've not used Vim a whole lot. I've historically done as little as possible in Linux text editors but now this challenge has taught me a valuable lesson; Vim is important to know. Knowing Vim, though, isn't the first thing to know about this challenge. We are told that Bandit26's shell is not /bin/bash but something different. Before we even try to connect to bandit26, getting some intel from within bandit25 is crucial. To find out what a user's particular default shell is, we check the /etc/passwd file:
```bash
bandit25@bandit:~$ cat /etc/passwd | grep bandit26
bandit26:x:11026:11026:bandit level 26:/home/bandit26:/usr/bin/showtext
```
We can see after displaying and sifting appropriately (via cat and grep), we see at the end of the bandit26's user information the default shell is "/usr/bin/showtext". Let's see what exactly that is:
```bash
bandit25@bandit:~$ file /usr/bin/showtext 
/usr/bin/showtext: POSIX shell script, ASCII text executable
bandit25@bandit:~$ cat /usr/bin/showtext 
#!/bin/sh

export TERM=linux

exec more ~/text.txt
exit 0
```

Just a quick check on the kind of file we are dealing with here, we can see that the file command tells us that we are looking at a script file with ASCII text; something we can easily view. 

Taking a quick look at the file, we first see something that isn't terribly relevant for our purposes (the rendering of the text on the screen) but then we see the script executing the "more" command on the text.txt file followed by the exit command. Why that's relevant is because when we try to remote into the machine with bandit26, it displays the text and then forces us to exit the session. The sneaky thing here is that the "more" command is for text viewing and allows us to paginate when text exceeds what is viewable in the terminal. This is sneaky because we can at least get into the machine by minimizing our terminal size to force the text to be more than what can be displayed on our terminal! We end up seeing something like this:
```bash
 | |                   | (_) | |__ \ / /  
 | |__   __ _ _ __   __| |_| |_   ) / /_  
--More--(50%)
```
Here's where the Vim knowledge comes in handy. Originally intended as a feature, the "more" command drops us into an actual text editor. From here, we can enter "v" to enter "vi" and then we can start running commands from "Normal" mode! From here, we can change the default shell with the set command followed by the new shell path:
```bash
:set shell=/bin/bash
...
:shell
```
Since we set the shell, you can see above that we can actually just execute the new shell which brings us into a new sub-shell text editor! From here, we have the inherited permissions since we are logged in as bandit26 and can now check out the password file with ease!
```bash
cat /etc/bandit_pass/bandit26
[here is the password!]
```

