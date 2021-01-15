#!/usr/bin/env bash

# goto website root dir
cd `dirname $0`/..

# get number of remote commits waiting
_commit_count=`git fetch; git rev-list HEAD...@{u} --count`

# update website if any commits waiting
if [ ${_commit_count} != "0" ]; then
  # correct ownership
  chown -R apache:apache `pwd`
  # pull in commits
  sudo -u apache `which git` pull
  # update dependencies
  /usr/local/bin/bundle install --quiet
  # correct ownership
  chown -R apache:apache `pwd`
  # compile website
  sudo -u apache /usr/local/bin/nanoc compile
fi
