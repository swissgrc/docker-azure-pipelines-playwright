---
name: release
description: Automate Git Flow release process. Creates a release branch from develop, merges into main, tags, and merges back into develop.
disable-model-invocation: true
argument-hint: <version>
---

# Git Flow Release

Release version **$ARGUMENTS**.

Execute each step sequentially. After each step, show the output. If any step fails, stop and report the error.

## 1. Validate preconditions

- Verify `$ARGUMENTS` is not empty. If it is, abort with: "Usage: /release <version>"
- Run `git status --porcelain` — if there are uncommitted changes, abort
- Run `git tag -l "$ARGUMENTS"` — if the tag already exists, abort
- Ensure develop is up to date: `git checkout develop && git pull origin develop`

## 2. Create release branch

Run: `git checkout -b release/$ARGUMENTS`

## 3. Merge release branch into main

Run: `git checkout main && git pull origin main && git merge --no-ff release/$ARGUMENTS -m "Merge branch 'release/$ARGUMENTS' into main"`

## 4. Tag the release on main

Create an annotated tag (no `v` prefix).

Run: `git tag -a $ARGUMENTS -m "Release $ARGUMENTS"`

## 5. Merge the tag back into develop

Merge the **tag** (not the branch) back into develop.

Run: `git checkout develop && git merge --no-ff $ARGUMENTS -m "Merge tag '$ARGUMENTS' into develop"`

## 6. Delete the release branch

Run: `git branch -d release/$ARGUMENTS`

## 7. Verify

Run `git log --oneline --graph --all -20` and show the result to the user. Confirm the graph looks correct before proceeding.

## 8. Push (requires confirmation)

**Ask the user for confirmation before pushing.** Show exactly what will be pushed:

- Branch `main`
- Branch `develop`
- Tag `$ARGUMENTS`

Once confirmed, run: `git push origin main && git push origin develop && git push origin $ARGUMENTS`
