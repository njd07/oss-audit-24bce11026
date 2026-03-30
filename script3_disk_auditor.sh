#!/bin/bash
# Script 3: Disk and Permission Auditor
# Nrishan Jyoti Das | 24BCE11026 | OSS Vityarthi Course
# Software: Git

# dirs to check
SYS_DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo ""
echo "+---------------------------------------------------------+"
echo "|          Disk and Permission Auditor                    |"
echo "+---------------------------------------------------------+"
echo ""

# table header
printf "  %-18s | %-30s | %-10s\n" "Path" "Perms / Owner / Group" "Size"
echo "  -----------------------------------------------------------------"

# looping through each dir
for CURR_DIR in "${SYS_DIRS[@]}"; do
    if [ -d "$CURR_DIR" ]; then
        # get perms + owner + group
        DIR_INFO=$(ls -ld "$CURR_DIR" | awk '{print $1, $3, $4}')
        # get size
        DIR_SIZE=$(du -sh "$CURR_DIR" 2>/dev/null | cut -f1)
        printf "  %-18s | %-30s | %-10s\n" "$CURR_DIR" "$DIR_INFO" "${DIR_SIZE:-N/A}"
    else
        printf "  %-18s | %-30s | %-10s\n" "$CURR_DIR" "(doesn't exist)" "---"
    fi
done

echo ""
echo "+---------------------------------------------------------+"
echo "|     Git Config Check                                    |"
echo "+---------------------------------------------------------+"
echo ""

# check user-level git config
GIT_USER_CFG="$HOME/.gitconfig"

if [ -f "$GIT_USER_CFG" ]; then
    CFG_PERMS=$(ls -l "$GIT_USER_CFG" | awk '{print $1, $3, $4}')
    CFG_SIZE=$(du -sh "$GIT_USER_CFG" 2>/dev/null | cut -f1)
    echo "  found: $GIT_USER_CFG"
    echo "  perms: $CFG_PERMS"
    echo "  size:  $CFG_SIZE"
    echo ""
    echo "  this file has your name/email, sometimes creds."
    echo "  should be 644 max, never 777."
else
    echo "  no git config at $GIT_USER_CFG"
    echo "  set up with:"
    echo "    git config --global user.name 'Nrishan'"
    echo "    git config --global user.email 'you@example.com'"
fi

echo ""

# system-wide git config (usually not there)
if [ -f "/etc/gitconfig" ]; then
    SYS_PERMS=$(ls -l "/etc/gitconfig" | awk '{print $1, $3, $4}')
    echo "  system config: /etc/gitconfig | $SYS_PERMS"
else
    echo "  no /etc/gitconfig (thats normal)"
fi

echo ""
echo "+---------------------------------------------------------+"
