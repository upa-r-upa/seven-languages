TwoList := Object clone
TwoList main_list := list()
TwoList dim := method(x,y,
	for(i,1,x,
		child_list := list()
		for(j,1,y, child_list append(nil))
			main_list append(child_list)
	)
)

TwoList set := method(x,y,value, main_list at(x) atPut(y,value))
TwoList get := method(x,y,main_list at(x) at(y))

my_list := TwoList clone 
my_list dim(2,4)

my_list set(1,1,"hello")
my_list set(1,2,"world")

my_list get(1,1) println 
my_list get(1,2) println 
