#!/bin/bash
set -e

run() {
    echo ""
    printf "\033[1;32m$\033[0m %s\n" "$1"
    sleep 0.8
    eval "$1" 2>&1
    sleep 1.5
}

run_head() {
    echo ""
    printf "\033[1;32m$\033[0m %s\n" "$1 | head -5"
    sleep 0.8
    eval "$1" 2>&1 | head -5
    echo "  ..."
    sleep 2
}

clear
echo ""
echo "  brow — browser automation CLI for AI agents"
echo "  ============================================"
echo ""
sleep 2

run 'brow session new --profile demo-gif2'

SID=$(brow session list 2>/dev/null | grep demo-gif2 | awk '{print $1}')

run_head "brow navigate -s $SID \"https://news.ycombinator.com\""

run_head "brow snapshot -s $SID"

run "brow click -s $SID \"text=new\" 2>&1 | head -1"

run "brow url -s $SID"

run "brow session delete $SID"

echo ""
echo "  pip install brow-cli"
echo ""
sleep 3
