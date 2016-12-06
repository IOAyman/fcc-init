#!/bin/bash
read -p 'remote url: ' url
git remote set-url origin $url
rm $0
