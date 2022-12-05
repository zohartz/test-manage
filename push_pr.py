# 1. get changed files
# 2. create branch , commit changed files and push
# 3. create pr
# 4. update to auto merge


from typing import List

import github

import os
import subprocess

def create_branch_and_auto_merge_pr(repo_name: str, branch_name: str, files_to_commit: List[str], commit_message: str):
    # create a Github instance:

    g = github.Github()
    # get the repository:
    repo = g.get_repo(repo_name)
    print(repo)
    # create the branch:
    # branch = repo.create_git_ref(ref='refs/heads/' + branch_name, sha=repo.get_branch(branch_name).commit.sha)
    # # commit the modified files:
    # for file in files_to_commit:
    #     repo.create_file(path=file, message=commit_message, content=open(file, 'r').read(), branch=branch_name)
    # # push the branch to the remote repository:
    # repo.push(branch)
    # # create the pull request:
    # pr = repo.create_pull(title=commit_message, body=commit_message, head=branch_name, base='master')
    # attempt to merge the pull request automatically:
    # pr.merge()

def create_pr():
    # Create a new branch and check it out
    branch_name = "my-new-branch"
    # subprocess.run(["git", "checkout", "-b", branch_name])
    #
    # # Add and commit changed files
    # subprocess.run(["git", "add", "-u"])
    # subprocess.run(["git", "commit", "-m", "Committing changes"])

    # Push the branch to GitHub
    subprocess.run(["git", "push", "origin", branch_name])

    # Create an automatic merge pull request
    subprocess.run(["hub", "pull-request", "-m", "Automatically merging changes"])

if __name__ == "__main__":
    #create_branch_and_auto_merge_pr('Granulate/cc-mgmt-testing', '', [], '')
    create_pr()
