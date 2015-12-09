#!/bin/bash

function issues {
	if [ "$1" == "init" ]; then
		if git rev-parse --verify "_issues"; then
			echo 'the _issues branch already exists';
		else
			branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
			branch_name=${branch_name##refs/heads/}
			git checkout --orphan "_issues";
			git rm -rf *;
			git commit --allow-empty -m 'initial commit'
			git checkout $branch_name;
		fi
	fi
}
