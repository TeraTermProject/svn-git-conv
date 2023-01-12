# convert.shを実行

- 起動トリガ
  - 手動で実行
  - push,リポジトリへプッシュ

- 環境は ubuntu-latest
  - git-svn (git svn clone)の動作が速い
- cache
  - cloneした ttssh2/ をキャッシュしておく
- install
  - git が標準のものと異なっているのでいったん uninstall
    - git-svn がインストールできない
    - git-man も依存しているので uninstall
  - git と git-svn をインストール
  - ダウンロードに失敗するので対策
    - https://github.com/actions/runner-images/issues/675#issuecomment-610483420
- git svn
  - convert.sh を呼び出し
  - 生成
    - ttssh2/
      - OSDN の svn を git svn clone した物
    - ttssh2.tar.bz2
      - ttssh2/ を tar した物
- git_svn_tar
  - ttssh2.tar.bz2 を生成物とする
