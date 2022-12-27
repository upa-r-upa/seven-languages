List myAverage := method(call target foreach(x,if(x type != "Number", Exception raise("List only numeric")))
 (call target sum) / (call target size)
)

my_list := list(1,2,3,4)

my_list myAverage println 

my_list_not_num := list(1,2,"Three")

my_list_not_num myAverage println 
