#!/bin/bash

mkdir -p helm
cd helm  
git config user.name "Github Actions"
git config user.email "development@kvalitetsit.dk"
git clone https://github.com/KvalitetsIT/helm-repo
cd helm-repo
cp ../../service-*.tgz service
git add -A
git commit -m "Adding new service chart"
git push
