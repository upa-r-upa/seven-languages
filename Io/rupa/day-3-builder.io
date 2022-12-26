Builder := Object clone
Builder indent := 0

Builder getIndent := method(
    indentString := ""
    indent repeat(
        indentString = indentString .. "    "

    )
    |    indentString
)

Builder forward := method(

    writeln(getIndent() .. "<", call message name, ">")


    call message arguments foreach(
        arg,
        indent = indent + 1
        content := self doMessage(arg);
        indent = indent - 1

        if (content type == "Sequence", writeln(getIndent() .. content))
    )


    writeln(getIndent() .. "</", call message name, ">")
)

Builder ul(
    li("Io"),
    li("lua"),
    li("Javascript")
    ul(
        li("Io"),
        li("lua"),
        li("Javascript")
    )
)