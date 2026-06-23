# Build and Register a Custom systemd Service
**Date:** June 23, 2026

* **Scenario:** A client wants a custom backup monitoring script to launch automatically the exact millisecond the server boots up, run completely in the background, and automatically restart itself if it ever encounters a fatal error and crashes.
* **Goal:** You will write a basic baseline bash script on your Ubuntu VM, and then navigate to the system control directory at /etc/systemd/system/. You will create a custom service configuration file (e.g., nick-monitor.service).
* **Success Criteria:** You can control your own custom background script seamlessly using the standard administration commands:
```bash
sudo systemctl daemon-reload
sudo systemctl start nick-monitor
sudo systemctl status nick-monitor
```
* **Notes:** 

For service unit files, there are three primary configuration sections and their respective details:

* [Unit]: This configuration section contains directives which basically modify settings for a configuration. There are a few commonly used directives for services:
    * After: Sets the unit to *start* after the designated units (for instance, if there was another unit that we wanted to start first, then we would have the service "start after X unit").
    * Before: Similar to "After" but reverse the order; this service must start *before* the designated unit(s).
    * Description: Describes what the unit does/is.
    * Documentation: Usually lists Uniform Resource Identifiers (URIs) that point to documentation sources.
    * Conflicts: Tells the unit not to start if a designated unit is started/running.
    * Requires: The opposite of conflicts; this one will not start unless the specified unit is running (hence, it *requires* it to be started).
    * Wants: Sets the unit to start alongside the designated unit(s). Even if other units do not start, this one still will.
* [Service]: The Service directives are configurations specific to the service itself:
    * ExecReload: Indicates scripts or commands (with any additional options) to run when unit is *loaded*.
    * ExecStart: Indicates scripts or commands (with any additional options) to run when unit is *started*.
    * ExecStop: Indicates scripts or commands (with any additional options) to run when unit is *stopped*.
    * Environment: Sets environment variable subtitutes (space separated). 
    * Environment File: Specifies the file that actually defintes the variable substitutes.
    * RemainAfterExit: "No" is default, but if set to "Yes", the service will remain active even when the process started by "ExecStart" terminates. "No" will call "ExecStop" when the process is terminated.
    * Restart: Service is restarted when process started by "ExecStart" terminates. This is ignored if the "systemctl restart" or "systemctl stop" commands are run. Options you can choose are **on-success, on-failure, on-abnormal, on-watchdog, on-abort, always**. 
    * Type: Sets the startup type. The "Type" directive can be set to any of the following specifications:
        * forking: ExecStart starts a parent process which then creates the service's main process as a child process and then exits.
        * simple: ExecStart starts the service's main process - this is the default setting.
        * oneshot: ExecStart starts the service's main process, which is normally a configuration setting or a quick command and then the process exits.
        * idle:  ExecStart starts the service's main process but waits until all other start jobs are finished.
* [Install]: This section determines what happens to a particular services if it's enabled or disabled. Enabled means that it runs at system boot whereas disabled means it does not.
    * Alias: Sets additional names that can be used to denote the service in the systemctl commands.
    * Also: Sets additional units that must be enabled or disabled for the service. These additional units tend to be socket type units.
    * RequiredBy: Determines what other units require *this* service.
    * WantedBy: Determines what other units *manage this* service.

Although not all of the details above are going to be leveraged (they can't be since some are opposites of other mentioned options), it's important to be aware of commonly used setting flags so as to make a better decision for our service. One thing to note is that the service itself determines which scripts/commands to run (see "Service" section; Exec[command]), so we will need to build our script and then reference it to be executed as part of the processes of the service we create.

So in revisiting the scenario and goal, we need to create a custom *backup monitoring script* that *automatically launches* immediately *when the server boots up*, *runs in the background* and *automatically restart itself if it every encounters a fatal error and crashes*. We can already tell a lot about what we need to set in the service by reviewing the predefined labels above. 

Here's what I've come up with for my service:

```bash
[Unit]
Description=Nick's Logging Service


[Service]
ExecStart=/home/nick/nick-scripts/custom-monitoring-script.sh
Restart=always


[Install]
WantedBy=multi-user.target
```
To break it down section by section, we have the Unit which is simply describing what I am creating. I don't have any special dependencies or documentation, so a description is sufficient for me. Next we have the service and I am telling it to run my monitoring script (which we will look at next) and to restart always which means that when the service is stopped or terminated (unless done so via sudo systemctl stop), it will automatically come back on. Finally, we have the Install section where I simply define that I want to set it to be running as part of the standard system boot. Next we will look at the actual script that I have being run:

```bash
#!/bin/bash
while true; do
    # Uses ss to check if anything is listening on port 80
    if ! ss -tulpn | grep -q ":80 "; then
        echo "[ALERT] $(date): Port 80 (Web Server) is DOWN or unresponsive!" >> /var/log/custom-monitoring.log
    else
        echo "[INFO] $(date): Port 80 health check passed." >> /var/log/custom-monitoring.log
    fi
    
    sleep 60
done
```

There was no *clear* definition as to what kind of monitoring script was being asked for, so I chose one tha checks if a critical networking service that coule be running on Port 80 (like Apache) drops offline, and logs an alert. Just to explain the concept, the flow goes:

"While true; do" meaning, when being run, since we don't have any logic that would evaluate it either to true or false and then falling to this logic. So basically when the service calls on this script, it becomes "true". Next we have the beginning of our if / then / else logic which determines that "if there is no output (from the ! flag) from the ss -tulpn command (which shows network statistics, specifically set show numerical values over human readability, only ones that are being listened for, the processes, and the TCP and UDP connections) and filtered through to see port 80 (quietly via  grep -q), then echo to the log file that port 80 is down and to note the date as well as ALERT. If this does not get matched, then it will echo an informational update for the date and say that the health check passed. 

After the logic statement, we set the sleep command to 60 so that it doesn't run nonstop. The script never completes because though the "while true" runs infintely, the sleep 60 pauses the loop before the next check. Below is a way to conceptualize how this flow works:
[00:00.00] ──> Check Port 80 & Write Log (Takes ~5ms)
   │
[00:00.05] ──> sleep 60 activates (Process goes dormant)
   │                60-Second Sleep Window
[01:00.05] ──> Sleep expires ──┐
   ▲                           │ (Loop Repeats)
   └───────────────────────────┘
[01:00.05] ──> Check Port 80 & Write Log (Takes ~5ms)