#!/usr/bin/env bash
set -e

ansible-playbook -i hosts playbook.yml
