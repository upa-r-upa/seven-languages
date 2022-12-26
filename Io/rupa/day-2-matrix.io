MatrixHelper := Object clone

MatrixHelper write := method(
    filename,
    list2D,

    directory := Directory currentWorkingDirectory
    file := File with(list(directory, filename) join("/Io/rupa/"))
    file remove
    file openForUpdating

    list2D foreach(line, 
        file write(line join(", "))
        file write("\n")
    )
    file close
)

MatrixHelper read := method(filename,
    matrix := List clone
    directory := Directory currentWorkingDirectory
    file := File with(list(directory, filename) join("/Io/rupa/"))
    file openForReading
    file foreachLine(
        line,
        matrix push(line split(", "))
    )

    file close
    matrix
)

matrixHelper := MatrixHelper clone
matrixHelper read("matrix.txt") println

matrixHelper := MatrixHelper clone
matrixHelper write("matrix.txt", list(list(2,3,1), list(1,1,1), list(4,5,6))) 
