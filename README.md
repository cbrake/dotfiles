# cbrake's dotfiles

Using git setup detailed
[here](https://drewdevault.com/2019/12/30/dotfiles.html).

This dotfiles scheme uses a super simple scheme where your home dir is checked
into Git. In order to avoid checking everything in, we have `*` in `.gitignore`,
which by default ignores everything. To `git add` a file, you typically need to
add the `-f` (force) option.

## To initialize in existing home dir

- `cd ~`
- `git init`
- `git remote add origin https://github.com/cbrake/dotfiles.git`
  - `git@github.com:cbrake/dotfiles.git` (if you are cbrake :-) )
- `git fetch`
- `git status` (will show files that differ, etc)
- `git reset --hard` (to reset everything to current dotfiles)
- `git push -u origin HEAD` (will push changes and set remote to branch to be
  upstream)
