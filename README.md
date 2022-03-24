# Brewfiles
Brewfileにアプリを記載して、Brewでインストールするアプリを管理する。
また、stowコマンドで、設定ファイルも合わせて管理する。

[この動画](https://www.youtube.com/watch?v=QZr33TQnIRk)を参考に設定した

# 使い方
1. Brewfileに追加したいアプリを追加する。
2. そのアプリで使う設定ファイル(例：tmuxなら.tmux.conf)をpackagesディレクトリ以下のアプリごとの個別ディレクトリを作成して設定ファイルを置く。
3. installスクリプト内のstowコマンド末尾に、手順2で作成したディレクトリ名を記載する。
4. installスクリプトを実行して、アプリをインストールならびに設定ファイル配置を行う。

# すでにBrewを使っていて、Brewfileを事後的に作りたい場合
下記コマンドで、Brewfileがカレントパスに自動生成される。
```
$ brew bundle dump
```