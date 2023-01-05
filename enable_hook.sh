#!/bin/bash
set -e
echo 'pre push'
ln -s "../../gpush.py" "$(git rev-parse --show-toplevel)/.git/hooks/pre-push"