#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Nrishan Jyoti Das | 24BCE11026 | OSS Vityarthi Course
# Software: Git

# alias demo :
# alias gs='git status'
# put aliases in ~/.bashrc so they stick across sessions

echo ""
echo "+---------------------------------------------------------+"
echo "|        Open Source Manifesto Generator                  |"
echo "|        Nrishan Jyoti Das | 24BCE11026                  |"
echo "+---------------------------------------------------------+"
echo ""
echo "  answer 3 questions and ill make your manifesto."
echo ""

# get user input
read -p "  1. an open-source tool u use daily: " DAILY_TOOL
echo ""
read -p "  2. one word — what does freedom mean to u: " FREEDOM_WORD
echo ""
read -p "  3. something u'd build and share freely: " SHARE_IDEA
echo ""

# date for the header
GEN_DATE=$(date '+%d %B %Y')

# outpurt file named after current user
OUT_FILE="manifesto_$(whoami).txt"

# write header (> overwrites)
echo "+---------------------------------------------------------+" > "$OUT_FILE"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUT_FILE"
echo "  by $(whoami) | $GEN_DATE" >> "$OUT_FILE"
echo "+---------------------------------------------------------+" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# build the paragraph from answers (>> appends)
echo "  I use $DAILY_TOOL every day. someone built it and gave" >> "$OUT_FILE"
echo "  it away for free, just so others could use it too." >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "  freedom to me means $FREEDOM_WORD. open source is one" >> "$OUT_FILE"
echo "  of the few places where that actually happens." >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "  someday i want to build $SHARE_IDEA and put it out" >> "$OUT_FILE"
echo "  there the same way. not for money, just because thats" >> "$OUT_FILE"
echo "  how the best software gets made — by people who care" >> "$OUT_FILE"
echo "  about the problem more than the credit." >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "  git is proof. one guy wrote it in 2 weeks because he" >> "$OUT_FILE"
echo "  was frustrated, and now the whole world depends on it." >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "+---------------------------------------------------------+" >> "$OUT_FILE"
echo "  'Given enough eyeballs, all bugs are shallow.' - Linus's Law" >> "$OUT_FILE"
echo "+---------------------------------------------------------+" >> "$OUT_FILE"

# now show it
echo "  generating..."
echo ""
cat "$OUT_FILE"
echo ""
echo "  saved to: $OUT_FILE"
echo "+---------------------------------------------------------+"
