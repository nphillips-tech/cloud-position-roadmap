# Auditing and Filtering Active System Processes
**Date:** June 17, 2026

* **Goal:** Research the ss utility (the modern replacement for netstat). Look at the flags -tulpn using man ss. Run the command on your VM and filter the output to show only services that are actively LISTENing for incoming traffic
* **Success Criteria:** You can identify every open port on your machine and determine which Process ID (PID) or service name is currently bound to it.
* **Notes:**