### Global git ignore
Add to Global Git ignore Mac
1. Create ```~/.gitignore_global``` file if not existed.
```sh
touch ~/.gitignore_global
```
2. Add .gitignore_global as the global gitignore file in your global git config
```sh
git config --global core.excludesfile ~/.gitignore_global
```
3. Update/Edit ignore items
```sh
vim ~/.gitignore_global
```
