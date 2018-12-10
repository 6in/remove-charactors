import unicode,strutils,sequtils,times,os


proc backup_file(file: string) =
  let nowstr = format( now() , "yyyyMMdd-HHmmss" )
  let newFile = file & ".backup." & nowstr
  moveFile file, newFile

proc remove_char* (path:string, chars: openArray[string], replaceFlg: bool) : string = 
  result = ""
  # todo: toFlatMap

  let checkChars: seq[seq[Rune]] = chars.map do (x:string) -> seq[Rune] : x.toRunes()
  let f : File = open(path, FileMode.fmRead)
  let runes = f.readAll().toRunes()
  f.close

  var resultString : seq[Rune] = @[]
  for rune in runes :
    for checkChar in checkChars:
      if checkChar.find(rune) == -1:
        resultString.add rune
  
  result = $resultString
  if replaceFlg :
    backup_file(path)
    let ff = open(path, FileMode.fmWrite)
    ff.write(result)
    ff.close()
