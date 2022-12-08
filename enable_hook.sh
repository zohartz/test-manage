#!/bin/bash
set -e
echo 'post push'
ln -s "../../create_pr.py" "$(git rev-parse --show-toplevel)/.git/hooks/post-push"
