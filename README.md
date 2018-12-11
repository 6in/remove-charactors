# rc アプリケーション

## 概要

任意のファイルから指定した文字 or キャラクタコードを取り除きます

## インストール

```
git clone https://github.com/6in/remove-charactors.git
cd remove-charactors
nimble install
```

## コマンドラインオプション

```
Usage:
  rc [ (-r | --replace) ] <file> <code>... 
  rc (-h | --help)
  rc --version

Options:
  -r --replace       replace file.
  <file>             file name
  <code>             hex or char separated by space
  -h --help          Show this screen.
  --version          Show version.
```

## サンプル

README.mdファイルから、BSコード(0x08)を取り除く

```
rc README.md 0x08 > README.md
```

--replaceオプションを使うと、上記と同様な動作となり、ファイルは自動バックアップされます。
バックアップファイル名は、元のファイル名.backup.YYYYMMDD-HHmmSSとなります。

```
rc --replace README.md 0x08
```
