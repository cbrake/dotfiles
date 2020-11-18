# cbrake's dotfiles

Using git setup detailed [here](https://drewdevault.com/2019/12/30/dotfiles.html).

## To initialize in existing home dir

- `git init`
- `git remote add origin https://github.com/cbrake/dotfiles.git` (`git@github.com:cbrake/dotfiles.git` if you are cbrake :-) )
- `git fetch`
- `git status` (will show files that differ, etc)
- `git reset --hard` (to reset everything to current dotfiles)
- `git push -u origin HEAD` (will push changes and set remote to branch to be upstream)
