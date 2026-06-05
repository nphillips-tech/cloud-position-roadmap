# Linux Journey: Day 1 Notes
**Date:** June 1, 2026

##  The Linux Kernel vs. A Distribution
**The Kernel:** The kernel is the mediator between the hardware of a machine (CPU, RAM, peripherals, etc) and the software itself. It's not actually an OS itself, it's moreso the brains that allows the hardware and software to play nicely.
**The Distribution (Distro):** The distro is the actual OS that is built around the kernel, and there are many, many, many distros...

##  Major Distro Families
**Debian Family (e.g., Ubuntu):** Free & open source; existed since early days of Linux. Well known for it's solid base system, very large collection of software, and clear project principles. It's very stable and consistent (changes are more reliable but less frequent). This is particularly useful for cloud infrastructure environments. It also offers branches (stable, testing and unstable) so that different user types can have an environment they can benefit from. Package management uses APT toolset & .deb package format. ultimately, Debian's common use cases are servers, dev environments, desktop systems, and even learning Linux!
**Red Hat Family (e.g., Rocky Linux, RHEL):** This is a commercial flavor of Linux built by Red Hat for enterprise usage. It's heavily focused on long-term life-cycles and supportability so as to support enterprise environments more reliably. Simply put, there are more expectations and baselines that are built into Red Hat due to the nature of where it's used whereas distros like Debian are more community focused. RHEL uses DNF for package management.

##  Introduction to the Command Line
**Key Takeaway:** The terminal/shell is the primary interface for Cloud Engineers and SREs. It allows us to communicate directly with the OS without a graphical interface.

### CLI Commands:
**Familiarity & Needs Improvement:** I'm actually familiar with a decent number of commands, such as ls, cp, rm, mkdir, man, touch, vi / vim / nano, systemctl, ip, and others, but the depth at which I am familiar with them varies. I look forward to getting more use with all of these commands (and more!).

---

**Update: June 7, 2026**

In addition to my Bandit Wargames practice I'm doing to grow, I've also created an interactive script that actually ties in well with my practicing. I've made a script that saves me the effort of having to type in a command to ssh into the bandit servers each time. What I wanted to do was to make it easier to simply run a command and connect. 

Here's what I created:

```bash
#!/bin/bash

# Clear the screen for a clean interface
clear
echo "========================================="
echo "   OVERTHEWIRE BANDIT SSH AUTOMATOR      "
echo "========================================="
echo ""

# Prompt the user for the level number
echo -n "Enter the Bandit level number you want to join (e.g., 00, 06, 10): "
read LEVEL

# Dynamically construct the username
USERNAME="bandit$LEVEL"

echo ""
echo "Connecting to $USERNAME..."
echo "----------------------------------------="

# Execute the SSH command dynamically
ssh "$USERNAME@bandit.labs.overthewire.org" -p 2220
```
The first section clears the screen of anything currently present on the terminal followed by what is essentially a banner that is presented once running the command. The command "echo" simply prints to screen, as everyone who's printed their first "Hello World" to the CLI is familiar with. 

From here, we print the prompt to the screen that indicates what level we want to join at and are also requiring the input to be submitted on the same line (the -n flag). The reason I did this is because the ssh command that connects us to the server requires a different username based on the level we want to join for, therefore I needed a prompt to ask me for an input for the level I'd like to join in to. For this, we are creating a variable LEVEL which is what the input of the prompt becomes. We see this with the "read LEVEL" line. 

In the next section, we create a new variable called "USERNAME" which is now the combination of the constant "bandit" plus the "LEVEL" the user just submitted. This then becomes "USERNAME=bandit$LEVEL". After this, we add the next line that gets printed to the screen to tell the end user that they are connecting to the level based on the new USERNAME variable.

Finally, the actual command that gets us to connect is executed, leveraging our new USERNAME variable in the username field of what would normally be a manually entered bandit[number].