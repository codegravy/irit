#!/bin/bash

if git rev-parse --verify "_issues"; then
	echo 'the _issues branch already exists';
else
	git checkout --orphan "_issues";
	git rm -rf ./*;
	touch debug.issue;
	echo "test issue please ignore" > ./debug.issue;
	git add -A .;
	git commit -m 'Added awesome issue tracking via irit';
	git push origin _issues;
fi
