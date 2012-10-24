#!/bin/bash

##
## Create Repositories
##	Documentation:	http://developer.github.com/v3/repos/
##

# Setup Env. Variables
. github.conf

ORG_NAME=usc-csci200-fall2012
#TEAM_LIST=(team01 team02 team03 team04 team05 team06 team07 team08 team09 team10 team11 team12 team13 team14 team15 team16 team17)
TEAM_LIST=(team02 team03 team04 team05 team06 team07 team08 team09 team10 team11 team12 team13 team14 team15 team16 team17)

# List all current teams
#curl -u "$GH_USERNAME:$GH_PASSOWRD" https://api.github.com/orgs/$ORG_NAME/teams


# Create repositories
for TEAM_NAME in ${TEAM_LIST[*]}
do
	curl --silent --user "$GH_USERNAME:$GH_PASSOWRD" https://api.github.com/orgs/$ORG_NAME/teams \
		--data "{
			\"name\":\"$TEAM_NAME\", 
			\"permission\":\"push\", 
			\"repo_names\": [ \"$ORG_NAME/$TEAM_NAME\" ]
		}" -o create_team_$TEAM_NAME.log
done
