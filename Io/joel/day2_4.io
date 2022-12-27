listNew := Object clone
my_list := list(1,2,3,list(1,2))
listNew serialTo := method(path,File open(path) write(my_list serialized) close)

listNew serialTo("list3.csv")
reading_list := doFile("list3.csv")
reading_list println
