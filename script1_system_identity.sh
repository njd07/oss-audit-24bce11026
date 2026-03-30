#!/bin/bash
# Script 1: System Identity Report
# Nrishan Jyoti Das | 24BCE11026 | OSS Vityarthi Course
# Software: Git

# my info
MY_NAME="Nrishan Jyoti Das"
MY_REG="24BCE11026"
CHOSEN_SW="Git"

# pulling system details
SYS_KERNEL=$(uname -r)
SYS_ARCH=$(uname -m)
SYS_HOST=$(hostname)
LOGGED_USER=$(whoami)
USER_HOME="$HOME"
SYS_UPTIME=$(uptime -p)
TODAY=$(date '+%A, %d %B %Y at %H:%M:%S')

# get distro name from os-release if it exists
if [ -f /etc/os-release ]; then
    DISTRO_NAME=$(grep "^PRETTY_NAME" /etc/os-release | cut -d'"' -f2)
else
    DISTRO_NAME="Unknown"
fi

# printing everything out
echo ""
echo "+---------------------------------------------------------+"
echo "|       SYSTEM IDENTITY REPORT - Open Source Audit        |"
echo "+---------------------------------------------------------+"
echo ""
echo "  Student       : $MY_NAME"
echo "  Reg No        : $MY_REG"
echo "  Software      : $CHOSEN_SW"
echo ""
echo "+---------------------------------------------------------+"
echo "|               System Info                               |"
echo "+---------------------------------------------------------+"
echo ""
echo "  Hostname      : $SYS_HOST"
echo "  Distro        : $DISTRO_NAME"
echo "  Kernel        : $SYS_KERNEL"
echo "  Arch          : $SYS_ARCH"
echo "  User          : $LOGGED_USER"
echo "  Home Dir      : $USER_HOME"
echo "  Uptime        : $SYS_UPTIME"
echo "  Date/Time     : $TODAY"
echo ""
echo "+---------------------------------------------------------+"
echo "|               License Note                              |"
echo "+---------------------------------------------------------+"
echo ""
echo "  Linux runs under GNU GPL v2."
echo "  Git is also GPL v2 — anyone can read, modify"
echo "  and share the source code."
echo ""
echo "  'Free software is a matter of liberty, not price.' - RMS"
echo ""
echo "+---------------------------------------------------------+"
