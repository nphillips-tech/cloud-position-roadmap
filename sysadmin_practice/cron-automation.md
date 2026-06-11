# Cron Automation Task
**Date:** June 11, 2026

* **The Scenario:** Management wants an automated script that runs quietly in the background every single minute to append the system's current execution state to a rolling file. 
* **Goal:** Read up on Linux crontab syntax. Open your user's cron configuration tool and write a rule that executes every minute. The job must run the uptime command and redirect the output so it appends to a file named /tmp/sys_health.log.
* **Success Criteria:** Let it run for 3 minutes, then view /tmp/sys_health.log. If you see 3 distinct timestamps printed sequentially, your automation is live.

* **Notes:** This job was pretty simple. What I needed to do was go into the crontab and create a new cronjob. The following command allows us to edit our crontab and add a cronjob:
```bash
crontab -e
```
From here, we can add the following line to the file:
```* * * * * /usr/bin/uptime >> /tmp/sys_health.log```

Finally we get the expected output after our 3 minutes:
```bash
nick@nickubuntu:/tmp$ cat sys_health.log 
 16:40:01 up  2:03,  2 users,  load average: 0.17, 0.14, 0.15
 16:41:01 up  2:04,  2 users,  load average: 0.06, 0.11, 0.14
 16:42:01 up  2:05,  2 users,  load average: 0.19, 0.15, 0.15