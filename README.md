ghc-mod wrappers for stack env.

## インストール

1. windowsならwinディレクトリ、linuxならlinuxディレクトリの中にあるファイルをパスの通ってるディレクトリのうち、既にghc-mod/ghc-modiがインストールされているディレクトリより優先順位の高いディレクトリにコピーします(スクリプトのファイル名もghc-mod/ghc-modiなので)。
2. linuxの場合はコピーしたスクリプトを実行できるようにパーミッションを変更します。
3. おわり

※winディレクトリの中のbashスクリプトはmsys2のシェルで実行する為の物です。

## 使い方

1. ghc-modを使用する前にstack buildを実行しておきます。
2. ghc-modを普段通り使います。cabal configureは不要です。

