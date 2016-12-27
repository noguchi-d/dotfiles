dotfile 系の設定
================

概要
----

bash や git などの dotfile の設定を管理します。

設定
----

```sh
$ cd ${HOME}
$ git clone [Repository URL]
$ cd dotfiles
$ ./deploy.sh
```

注意点
------

1. vim プラグインの管理には、dein.vim を使用しています。
[Shougo/dein.vim](https://github.com/Shougo/dein.vim)
1. git の user.name, user.email は ~/.gitconfig.local を個別に用意し、インクルードすることで設定することを想定しています。

