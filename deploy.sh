#!/bin/bash
git checkout main
git branch -D gh-pages
git checkout -b gh-pages
git filter-branch --subdirectory-filter _site/ -f
git push --all
git checkout main