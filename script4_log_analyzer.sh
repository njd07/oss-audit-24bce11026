#!/bin/bash
# Script 4: Log File Analyzer
# Nrishan Jyoti Das | 24BCE11026 | OSS Vityarthi Course
# Software: Git
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]

# get args
LOG_PATH=$1
SEARCH_WORD=${2:-"error"}   # defaults to "error"
MATCH_COUNT=0
RETRY_NUM=0
MAX_RETRY=3

echo ""
echo "+---------------------------------------------------------+"
echo "|              Log File Analyzer                          |"
echo "+---------------------------------------------------------+"
echo ""

# no file given? show usage and exit
if [ -z "$LOG_PATH" ]; then
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  e.g.: $0 /var/log/syslog error"
    exit 1
fi

# retry loop if file doesnt exist — asks for another path
while true; do
    RETRY_NUM=$((RETRY_NUM + 1))

    if [ -f "$LOG_PATH" ]; then
        break
    else
        echo "  attempt $RETRY_NUM/$MAX_RETRY: $LOG_PATH not found"

        if [ $RETRY_NUM -ge $MAX_RETRY ]; then
            echo ""
            echo "  gave up. try one of these:"
            echo "    /var/log/syslog"
            echo "    /var/log/messages"
            echo "    /var/log/auth.log"
            echo "    /var/log/kern.log"
            exit 1
        fi

        read -p "  enter another path: " LOG_PATH
    fi
done

# empty file check
if [ ! -s "$LOG_PATH" ]; then
    echo "  file is empty, nothing to do"
    exit 0
fi

echo "  file:    $LOG_PATH"
echo "  keyword: $SEARCH_WORD"
echo ""

# count total lines for context
TOTAL_LINES=$(wc -l < "$LOG_PATH")

# read line by line and count matches
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$SEARCH_WORD"; then
        MATCH_COUNT=$((MATCH_COUNT + 1))
    fi
done < "$LOG_PATH"

# results
echo "+---------------------------------------------------------+"
echo "|                   Results                               |"
echo "+---------------------------------------------------------+"
echo ""
echo "  file:     $LOG_PATH"
echo "  lines:    $TOTAL_LINES"
echo "  keyword:  $SEARCH_WORD"
echo "  matches:  $MATCH_COUNT"
echo ""

# show last 5 matches if any
if [ $MATCH_COUNT -gt 0 ]; then
    echo "  last 5 matching lines:"
    echo "  ----------------------"
    grep -i "$SEARCH_WORD" "$LOG_PATH" | tail -5 | while IFS= read -r MATCH; do
        echo "    >> $MATCH"
    done
else
    echo "  no matches for '$SEARCH_WORD'"
fi

echo ""
echo "+---------------------------------------------------------+"
