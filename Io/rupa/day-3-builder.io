Builder := Object clone
Builder indent := 0

Builder getIndent := method(
    indentString := ""
    indent repeat(
        indentString = indentString .. "    "

    )
    indentString
)

// 기본 문법 
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


// 중괄호를 사용해 첫번째 인자로 속성을 넘길 수 있게 하기

OperatorTable addAssignOperator(":", "atPutAttribute")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
) 

Map atPutAttribute := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Builder forward := method(

    arg := call message arguments first
    attributeStr := ""

    if(arg name == "curlyBrackets",
        attribute := doMessage(arg)
        attribute foreach(key, value,
          attributeStr = attributeStr = " " .. key .. "=" .. "\"" .. value .. "\""
        )
    )

    writeln(getIndent() .. "<", call message name, attributeStr, ">")

    call message arguments foreach(
        arg,
        indent = indent + 1
        content := self doMessage(arg);
        indent = indent - 1

        if (content type == "Sequence", writeln(getIndent() .. content))
    )


    writeln(getIndent() .. "</", call message name, ">")
)

parse_string := """
ul(
    { "custom_list_type": "ul-1-depth" },
    li("Io"),
    li({ "custom_list_type_0": "li-0-index" },"lua"),
    li({ "custom_list_type_1": "li-1-index" }, "Javascript")
    ul(
        { "custom_list_type_inner": "ul" },
        li("Io"),
        li("lua"),
        li("Javascript")
    )
    ul(
        li("Io"),
        li("lua"),
        li("Javascript")
    )
)
"""

// doString을 사용하지 않으면 : 문법이 동작하지 않음. 
// 참고: https://github.com/shanx/seven-languages-in-seven-weeks/blob/master/io/day3/3-xml-with-attributes.io
Builder doString(parse_string)