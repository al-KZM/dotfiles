# Merge the dev branch into every feature branch

git branch -v  | grep feature | cut -d ' '  -f 3 | while read -r branch; do

    git checkout $branch
    git merge dev

done
