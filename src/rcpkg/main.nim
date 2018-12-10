
import private/main_impl
import docopt
import os
import strutils
import sequtils

proc hex2char(words: openArray[string]) : seq[string] =
  result = @[]
  for w in words: 
    if w.startsWith("0x"):
      result.add $(char(w.parseHexInt))
    else:
      result.add w

proc main*(args:Table[string,Value]) : int =
  result = 0
  var 
    codes : seq[string] = @[]
    file: string = ""

  if args["<code>"].kind == vkStr:
    codes.add $args["<code>"]

  elif args["<code>"].kind == vkList:
    for x in @(args["<code>"]):
      codes.add x

  codes = hex2char(codes)

  file = $args["<file>"]

  echo remove_char(file, codes, args["--replace"])




