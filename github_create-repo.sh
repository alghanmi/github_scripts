#!/bin/bash

##
## Create Repositories
##	Documentation:	http://developer.github.com/v3/repos/
##

# Setup Env. Variables
. github.conf

ORG_NAME=usc-csci200-fall2012
REPO_LIST=(team01 team02 team03 team04 team05 team06 team07 team08 team09 team10 team11 team12 team13 team14 team15 team16 team17)

# List all current teams
#curl -u "$GH_USERNAME:$GH_PASSOWRD" https://api.github.com/orgs/$ORG_NAME/teams


# Create repositories
for REPO_NAME in ${REPO_LIST[*]}
do
	curl --silent --user "$GH_USERNAME:$GH_PASSOWRD" https://api.github.com/orgs/$ORG_NAME/repos \
		--data "{
			\"name\":\"$REPO_NAME\", 
			\"description\":\"\", 
			\"private\":true, 
			\"has_issues\":true, 
			\"has_wiki\":true, 
			\"has_downloads\":true, 
			\"auto_init\":true,
			\"gitignore_template\":\"Java\"
		}" -o create_$REPO_NAME.log
done
