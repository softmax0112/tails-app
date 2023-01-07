#!/bin/bash
set -e

bundle config set --local path 'vendor/bundle'
bundle install

exec "/bin/bash"