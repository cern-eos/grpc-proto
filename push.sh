#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git add Rpc.pb.go
  git commit --message "Updating Rpc.pb.go"
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/ffurano/grpc-proto/edit/master/.travis.yml > /dev/null 2>&1
  git push --quiet --set-upstream origin master
}

setup_git
commit_website_files
upload_files
