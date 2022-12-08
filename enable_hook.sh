#!/bin/bash
set -e
echo 'pre push'
ln -s "../../create_pr.py" "$(git rev-parse --show-toplevel)/.git/hooks/pre-push"