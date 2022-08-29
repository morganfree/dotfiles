# dotfiles
*.files*

#### Remove submodule

```shell
git submodule deinit -f -- [submodule_path]
rm -rf .git/modules/[submodule_path]
git rm -f [submodule_path]
```

#### Update submodule

```shell
git submodule update --rebase --remote [submodule_path]
```
