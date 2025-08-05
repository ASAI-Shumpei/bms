#!/usr/bin/env bash
# Exit if any command fails
set -e

echo "Running bundle install..."
bundle install

echo "Running assets:precompile..."
bundle exec rails assets:precompile

echo "Running db:migrate..."
bundle exec rails db:migrate