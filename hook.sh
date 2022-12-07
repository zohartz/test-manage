
get_pr_number2() {
  # Check if the current branch is a pull request branch
  if ! gh pr view &> /dev/null; then
    echo "Error: current branch is not a pull request branch."
    return 1
  fi
  # Get the pull request number
  gh pr view --number
}

get_pr_number() {
  # Use `gh` to get the pull request information for the current branch
  pr_info=$(gh pr view)
  # Extract the PR number from the output
  pr_number=$(echo "$pr_info" | grep number | cut -d':' -f 2 | tr -d ' ')
#    pr_number=$(echo $pr_info | grep -oP '(?<=Number:\s)[0-9]+')
  # Print the PR number to the console
  echo $pr_number
}

PR_TITLE="cc-automated-pr"
BRANCH_NAME="cc-automated-branch-$(date +%s)"
gh auth login
git switch -c $BRANCH_NAME
git add .

git push origin $BRANCH_NAME
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Creating PR \"$PR_TITLE\" for branch $BRANCH_NAME"
  # git commit -m "$PR_TITLE"
  git switch -c "$BRANCH_NAME"
  git add .
  git push origin "$BRANCH_NAME"
  gh pr create --title "$PR_TITLE" --body "This is an automated PR to update ..."
  gh pr merge --auto --delete-branch --squash "$BRANCH_NAME"
else
  # Shouldn't end up here, but log that there was nothing to sync
  echo "Looks like there was nothing to update."
fi

PR_NUMBER=$(get_pr_number)
echo "$PR_NUMBER"

if [ "$PR_STATUS" = "true" ]; then
  echo "PR #$PR_NUMBER was merged!"
#  git switch master
#  git clean -f
#  git pull
else
  echo "PR #$PR_NUMBER was not merged."

fi