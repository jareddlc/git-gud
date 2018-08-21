#!/usr/bin/env bash

# Commands that need additional formatting without the formatting (base speed)
echo "1) git branch:"
{ time git branch > /dev/null; } 2>&1 | grep real

echo "2) git status:"
{ time git status > /dev/null; } 2>&1 | grep real

echo "3) cat .git/HEAD:"
{ time cat .git/HEAD > /dev/null; } 2>&1 | grep real

echo "4) git symbolic-ref HEAD:"
{ time git symbolic-ref HEAD > /dev/null; } 2>&1 | grep real

echo "5) git name-rev HEAD:"
{ time git name-rev HEAD > /dev/null; } 2>&1 | grep real

# Commands that need additional formatting
echo "6) git branch | grep \* | awk '{ \$1=\$1; print }' | tr -d \"* \":"
{ time git branch | grep \* | awk '{ $1=$1; print }' | tr -d "* " > /dev/null; } 2>&1 | grep real

echo "7) git branch | grep \* | cut -d ' ' -f2-:"
{ time git branch | grep \* | cut -d ' ' -f2- > /dev/null; } 2>&1 | grep real

echo "8) git branch | sed -n '/\* /s///p':"
{ time git branch | sed -n '/\* /s///p' > /dev/null; } 2>&1 | grep real

echo "9) git status | head -1 | awk '{ print \$3; }':"
{ time git status | head -1 | awk '{ print $3; }' > /dev/null; } 2>&1 | grep real

echo "10) cat .git/HEAD | awk -F refs/heads/ '{ print \$2; }':"
{ time cat .git/HEAD | awk -F refs/heads/ '{ print $2; }' > /dev/null; } 2>&1 | grep real

echo "11) git symbolic-ref HEAD | awk -F refs/heads/ '{ print \$2; }':"
{ time git symbolic-ref HEAD | awk -F refs/heads/ '{ print $2; }' > /dev/null; } 2>&1 | grep real

echo "12) git name-rev HEAD | awk '{ print \$2; }':"
{ time git name-rev HEAD | awk '{ print $2; }' > /dev/null; } 2>&1 | grep real

echo "13) git describe --all | awk -F heads/ '{ print \$2; }':"
{ time git describe --all | awk -F heads/ '{ print $2; }' > /dev/null; } 2>&1 | grep real

# Commands that dont need additional formatting
echo "14) git symbolic-ref --short HEAD:"
{ time git symbolic-ref --short HEAD > /dev/null; } 2>&1 | grep real

echo "15) git name-rev --name-only HEAD:"
{ time git name-rev --name-only HEAD > /dev/null; } 2>&1 | grep real

echo "16) git rev-parse --abbrev-ref HEAD:"
{ time git rev-parse --abbrev-ref HEAD > /dev/null; } 2>&1 | grep real
