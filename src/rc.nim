import docopt
import rcpkg/main

let doc = """
rc. remove char from file

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
"""

proc start() : int =
  let args = docopt(doc, version = "rc 0.1.0")
  # echo "args=>",args
  result = main(args)

# 引数チェック
when isMainModule:
  quit(start())
