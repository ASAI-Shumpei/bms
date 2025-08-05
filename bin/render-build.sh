#!/usr/bin/env bash
# Exit if any command fails
set -e

echo "Running bundle install..."
bundle install

echo "Running assets:precompile..."
RAILS_ENV=production bundle exec rake assets:precompile

echo "Running db:migrate..."
bundle exec rails db:migrate

echo "Running db:seed to create admin user..."
bundle exec rails db:seed