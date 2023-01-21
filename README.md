# 目的

- git-svn clone に時間がかかるのでclone済みファイルツリーを保存
- OSDN 上のソース,リポジトリ(svn)のバックアップ
- git へミラーを作成するための元データ
- git へ push

## 使い方

### gitへpush

次の値をセットしておくと push する
- secrets.GIT_REPOSITORY
- vars.GIT_USER_NAME
- vars.GIT_USER_EMAIL

### artifact

- ttssh2_git.tar.bz2 をダウンロード、展開する
- ttssh2/ がソースツリーとしてそのまま使える

## OSDN (svnリポジトリ)

- このリポジトリが正
- リモートリポジトリ(svn)
  - http://svn.osdn.net/svnroot/ttssh2/
  - Read Only
  - Read/Write リポジトリに変更する場合
    - .git/config の svn-remote "svn" の URL を
    - `svn+ssh://[ACCOUNT]@svn.osdn.net/svnroot/ttssh2` に変更する
- ユーザー名の変換は[authers.md](authers.md)参照してください

## GitHub (gitリポジトリ)

- このリポジトリはミラー
- リモートリポジトリ
  - remote名github
  - git@github.com:TeraTermProject/teraterm-mirror-gitsvn.git
- Web URL
  - https://github.com/TeraTermProject/teraterm-mirror-gitsvn

### git設定

Windowsでは次の設定が必要になることが多いです。
```
git config core.filemode false
```

### GitHub設定/E-Mail非公開

GitHubにE-Mailを公開しない設定にすることができます。

ローカルでは次のように設定します。
```
git config --local user.name "zmatsuo"
git config --local user.email "6488847+zmatsuo@users.noreply.github.com"
```
