# SVNのユーザー名変更

- svnのAuthorを置換(調整)してgitのAutherとすることができます。

## authers_org.txt

次のコマンドで生成しました。

```
svn log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors_org.txt
```

## 参考元

次のページを参考にしました。

- https://www.gitkraken.com/blog/migrating-git-svn
