#!/usr/bin/env bash

# Commands that need additional formatting without the formatting (base speed)
echo "git branch:"
{ time git branch > /dev/null; } 2>&1 | grep real

echo "git status:"
{ time git status > /dev/null; } 2>&1 | grep real

echo "cat .git/HEAD:"
{ time cat .git/HEAD > /dev/null; } 2>&1 | grep real

echo "git symbolic-ref HEAD:"
{ time git symbolic-ref HEAD > /dev/null; } 2>&1 | grep real

echo "git name-rev HEAD:"
{ time git name-rev HEAD > /dev/null; } 2>&1 | grep real

# Commands that need additional formatting
echo "git branch | grep \* | awk '{ $1=$1; print }' | tr -d \"* \":"
{ time git branch | grep \* | awk '{ $1=$1; print }' | tr -d "* " > /dev/null; } 2>&1 | grep real

echo "git branch | grep \* | cut -d ' ' -f2-:"
{ time git branch | grep \* | cut -d ' ' -f2- > /dev/null; } 2>&1 | grep real

echo "git branch | sed -n '/\* /s///p':"
{ time git branch | sed -n '/\* /s///p' > /dev/null; } 2>&1 | grep real

echo "git status | head -1 | awk '{ print $3; }':"
{ time git status | head -1 | awk '{ print $3; }' > /dev/null; } 2>&1 | grep real

echo "cat .git/HEAD | awk -F / '{ print $3; }':"
{ time cat .git/HEAD | awk -F / '{ print $3; }' > /dev/null; } 2>&1 | grep real

echo "git symbolic-ref HEAD | awk -F / '{ print $3; }':"
{ time git symbolic-ref HEAD | awk -F / '{ print $3; }' > /dev/null; } 2>&1 | grep real

echo "git name-rev HEAD | awk '{ print $2; }':"
{ time git name-rev HEAD | awk '{ print $2; }' > /dev/null; } 2>&1 | grep real

echo "git describe --all | awk -F / '{ print $2; }':"
{ time git describe --all | awk -F / '{ print $2; }' > /dev/null; } 2>&1 | grep real

# Commands that dont need additional formatting
echo "git symbolic-ref --short HEAD:"
{ time git symbolic-ref --short HEAD > /dev/null; } 2>&1 | grep real

echo "git name-rev --name-only HEAD:"
{ time git name-rev --name-only HEAD > /dev/null; } 2>&1 | grep real

echo "git rev-parse --abbrev-ref HEAD:"
{ time git rev-parse --abbrev-ref HEAD > /dev/null; } 2>&1 | grep real
