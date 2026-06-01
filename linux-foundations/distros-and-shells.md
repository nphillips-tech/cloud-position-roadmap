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
