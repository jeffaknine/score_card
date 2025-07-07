#!/bin/bash

# This script deploys the Flutter web project to GitHub
peanut --extra-args "--base-href=/score_card/"
git push origin --set-upstream gh-pages