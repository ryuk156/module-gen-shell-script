#!/bin/bash

baseRepo="master"
headRepo="module_gen"
prTitle="add: Generated Modules"
prDesc="This Pr generate the modules from terasology  org and  generates modules ifo"
             
             


data=$(cat <<-END
{
"title": "$prTitle",
"base": "$baseRepo",
"head": "$headRepo",
"body": "$prDesc"
}
END )

if git diff-index --quiet HEAD --; then
    echo "Nothing to psuh"
else
    git push https://${GIT_CREDS_USR}:${GIT_CREDS_PSW}@github.com/${GIT_CREDS_USR}/ModuleSite.git module_gen -f
    curl -i -H "Authorization: token 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" -X POST "https://api.github.com/repos/ryuk156/ModuleSite/pulls" -d "$data"
fi
