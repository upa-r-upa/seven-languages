Builder := Object clone do (
  forward := method(
    writeln("<", call message name, ">")
    call message arguments foreach(arg, 
      content := self doMessage(arg)
      if (content type == "Sequence", writeln(content))
    )
    writeln("</", call message name, ">")
  )
)

doFile("originFile.io")
