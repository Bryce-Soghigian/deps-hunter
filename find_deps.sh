#!/bin/bash
####### GPT GENERATED FILE, DO NOT MODIFY ####### 
REPO_LIST="repo1 repo2 repo3..."
TARGET_LIBS=("github.com/Azure/azure-sdk-for-go" "github.com/Azure/go-autorest/autorest")

for repo in $REPO_LIST; do
  git clone https://github.com/${repo}.git
  cd ${repo}
  for lib in ${TARGET_LIBS[@]}; do
    if grep -q ${lib} go.mod; then
      echo "Dependency found in ${repo}: ${lib}"
    fi
    if grep -r -q ${lib} .; then
      echo "Code reference found in ${repo}: ${lib}"
    fi
  done
  cd ..
  rm -rf ${repo}
done

