# Package

packageName   = "rc"
version       = "0.1.0"
author        = "input your name"
description   = "sample app with nimble"
license       = "MIT"           

srcDir        = "src"                     # ソースフォルダ
binDir        = "bin"                     # 実行モジュールを配置するフォルダ
bin           = @[ "rc" ]    # アプリケーションファイル名
skipDirs      = @[ "tests" , "util" ]     # nimble install時にスキップするフォルダ
backend       = "c"                       # デフォルトはc

# Dependencies

requires "nim >= 0.19.0"
requires "docopt >= 0.6.7"

task run, "アプリケーションを実行します":
  exec "nimble build"
  exec "bin/" & packageName & " nim"

task test2, "テスト実行":                  # デフォルトのtestコマンドは、backendの値を参照しない
  # キャッシュファイルをクリア
  exec "nimble clean"
  # テスト実行開始
  exec "nim " & backend & " -r tests/alltest"

task clean, "キャッシュのクリア":
  rmDir "bin"
  rmDir "src/nimcache"
  rmDir "tests/nimcache"
  rmDir "util/nimcache"
  mkDir "bin"

task rename, "プロジェクト名を伴うファイル名・内容を置換します":
  rmDir ".git"
  mkDir "bin"
  exec "nim c -r --out:bin/rename_app util/rename_app.nim . " & packageName
  rmDir "src/" & packageName & "pkg"
  exec "nimble clean"

task rename_test, "リネームテスト用":
  mkDir "bin"
  rmDir "../rc2"
  exec "cp -rp . ../rc2"
  exec "nim c -r --out:bin/rename_app util/rename_app.nim ../rc2 " & packageName
  rmDir "../rc2/src/" & packageName & "pkg"

