# oss-audit-24bce11026

**Name:** Nrishan Jyoti Das
**Reg No:** 24BCE11026
**Course:** Open Source Software | VIT
**Chosen Software:** Git

---

## What this is?

This repository is for the Vityarthi's Open Source Software Audit project. I picked **Git** as my software because its origin story is genuinely interesting — Linus Torvalds built it in about 2 weeks after the Linux kernel team lost access to BitKeeper (it was a proprietary VCS). Git is licensed under GPL v2.

The project report is submitted separately as a PDF. It covers Git's origin, license, ethics, how it works on Linux, its ecosystem, and a comparison with proprietary tools.

---

## Scripts

There are 5 shell scripts in this repo. Each one covers different shell scripting concepts.

### script1_system_identity.sh

Shows basic syst info like a welcome screen — distro name, kernel, user, uptime, date, and a note about the GPL v2 license.

**Concepts:** variables, echo, command substitution `$()`, if statement, reading `/etc/os-release`

```bash
chmod +x script1_system_identity.sh
./script1_system_identity.sh
```

---

### script2_package_inspector.sh

Checks if git is installed using dpkg or rpm, shows version info, and has a case statement with philosophy notes about different packages.

**Concepts:** if-then-else, case, `dpkg -s` / `rpm -qi`, grep piping, `command -v`

```bash
chmod +x script2_package_inspector.sh
./script2_package_inspector.sh
```

---

### script3_disk_auditor.sh

loops through system directories (/etc, /var/log, /home, /usr/bin, /tmp) and shows permissions, owner, group, and disk usage. Also checks git config files.

**Concepts:** for loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`, `printf`

```bash
chmod +x script3_disk_auditor.sh
./script3_disk_auditor.sh
```

---

### script4_log_analyzer.sh

Takes a log file and a keyword, reads it line by line, counts matches, and shows the last 5 matching lines. Has a retry loop if the file isn't found.

**Concepts:** while read loop, if-then, counters, `$1` `$2`, grep, tail, wc

```bash
chmod +x script4_log_analyzer.sh
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/auth.log "Failed"
```

---

### script5_manifesto_generator.sh

it asks 3 questions interactively, then writes a personalized open source manifesto to a .txt file.

**Concepts:** read, string concatenation, writing to file (`>` and `>>`), date, alias concept (in comments)

```bash
chmod +x script5_manifesto_generator.sh
./script5_manifesto_generator.sh
```

---

## Dependencies

Nothing special needed — just a normal Linux system. For script 2 to work fully you need git installed:

```bash
# ubuntu/debian
sudo apt install git

# fedora
sudo dnf install git
```

For script 4, you need a log file. If `/var/log/syslog` doesn't exist try `/var/log/auth.log` or `/var/log/kern.log`.

---

## Quick start

```bash
git clone https://github.com/njd07/oss-audit-24bce11026
cd oss-audit-24bce11026

chmod +x *.sh

./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_auditor.sh
./script4_log_analyzer.sh /var/log/syslog error
./script5_manifesto_generator.sh
```

---

## Report

The PDF report (submitted separately) covers:

* **Part A:** Git's origin story, GPL v2 license breakdown, and open source ethics
* **Part B:** How Git lives on Linux — directories, user/group, service management
* **Part C:** Git ecosystem — GitHub, GitLab, libgit2, etc.
* **Part D:** Git vs proprietary alternatives (SVN, Perforce, etc.)

*#THANK YOU*