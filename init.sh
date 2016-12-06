#!/bin/bash

PREFIX=fcc
ME=`git config user.name`
USERNAME=`git config user.username`
EMAIL=`git config user.email`

read -p 'project codename: ' PROJECT_NAME

# log
cat << EOC
prefix: $PREFIX
name: $ME
username: $USERNAME
email: $EMAIL

project: $PREFIX-$PROJECT_NAME
repository: https://github.com/$USERNAME/$PREFIX-$PROJECT_NAME
EOC

echo -e '\n\nLooks good?  ^c  to cancel\n\n'
read

# build templates
for template in README.md package.json go.js
do
  cat $template \
    | sed s/#ME#/"$ME"/ \
    | sed s/#EMAIL#/"$EMAIL"/ \
    | sed s/#PREFIX#/"$PREFIX"/ \
    | sed s/#USERNAME#/"$USERNAME"/ \
    | sed s/#PROJECT_NAME#/"$PROJECT_NAME"/ \
    > $template
done

# install dependencies
echo -e '\nInstalling dependencies ...\n'
[[ '`which yarn 2>/dev/null`' ]] && yarn 1>/dev/null || npm i 1>/dev/null

# housecleanig
rm $0

# re-init repo
rm -rf .git \
  && git init \
  && git add . \
  && git commit -am 'Challenge Accepted!' \
  && git remote add origin "git@github.com:$USERNAME/$PREFIX-$PROJECT_NAME.git"
