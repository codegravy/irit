#!/bin/bash

function issues {
	if [ "$1" == "init" ]; then
		if hasIssuesBranch; then
			echo 'the _issues branch already exists';
		else
			branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
			branch_name=${branch_name##refs/heads/}
			git checkout --orphan "_issues" 2> /dev/null > /dev/null;
			git rm -rf * 2> /dev/null > /dev/null;
			git commit --allow-empty -m 'initial commit' > /dev/null;
			git checkout $branch_name 2> /dev/null > /dev/null;
			echo 'Empty issues set up'
		fi
	else
		if ! hasIssuesBranch; then
			echo 'Issues has not be initalized. Please run ${0} init';
		else
			if [ "$1" == "create" ]; then
				:
			fi
		fi
	fi
}

function hasIssuesBranch {
	if git rev-parse --verify "_issues" 2> /dev/null; then
		return 0;
	else
		return 1;
	fi
}
