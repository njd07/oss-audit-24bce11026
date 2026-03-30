#!/bin/bash
# Script 2: FOSS Package Inspector
# Nrishan Jyoti Das | 24BCE11026 | OSS Vityarthi Course
# Software: Git

TARGET_PKG="git"

echo ""
echo "+---------------------------------------------------------+"
echo "|            FOSS Package Inspector                       |"
echo "+---------------------------------------------------------+"
echo ""
echo "  Checking: $TARGET_PKG"
echo ""

# checking dpkg first (debian/ubuntu), then trying rpm
if command -v dpkg &>/dev/null; then
    if dpkg -s "$TARGET_PKG" &>/dev/null; then
        echo "  [INSTALLED] $TARGET_PKG found"
        echo ""
        # grabbing version, maintainer, homepage
        dpkg -s "$TARGET_PKG" | grep -E '^(Version|Maintainer|Homepage):' | sed 's/^/    /'
        echo ""
        echo "  Binary: $(git --version 2>/dev/null || echo 'not in PATH')"
    else
        echo "  [NOT FOUND] $TARGET_PKG not installed"
        echo "  try: sudo apt install $TARGET_PKG"
    fi
elif command -v rpm &>/dev/null; then
    if rpm -q "$TARGET_PKG" &>/dev/null; then
        echo "  [INSTALLED] $TARGET_PKG found (rpm)"
        echo ""
        rpm -qi "$TARGET_PKG" | grep -E 'Version|License|Summary' | sed 's/^/    /'
    else
        echo "  [NOT FOUND] $TARGET_PKG not installed"
        echo "  try: sudo dnf install $TARGET_PKG"
    fi
else
    echo "  [WARN] no dpkg or rpm found"
fi

echo ""
echo "+---------------------------------------------------------+"
echo "|          Philosophy Notes                               |"
echo "+---------------------------------------------------------+"
echo ""

# case statement — short short description about each package
case $TARGET_PKG in
    git)
        echo "  Git: Linus built it in ~2 weeks after BitKeeper"
        echo "  cut off access. GPL v2. Now everyone uses it."
        ;;
    httpd|apache2)
        echo "  Apache: made web hosting free. runs ~30% of sites."
        ;;
    mysql|mariadb)
        echo "  MySQL: dual licensed — GPL for community, paid for enterprise."
        ;;
    firefox)
        echo "  Firefox: nonprofit browser, fighting for an open web."
        ;;
    vlc)
        echo "  VLC: started as a student project in Paris."
        ;;
    python3|python)
        echo "  Python: community-driven, governed by PEPs."
        ;;
    libreoffice)
        echo "  LibreOffice: forked from OpenOffice after Oracle took over."
        ;;
    *)
        echo "  $TARGET_PKG: open source — someone built it and shared it."
        ;;
esac

echo ""
echo "+---------------------------------------------------------+"
