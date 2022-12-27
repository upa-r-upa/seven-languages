//task3.1
fib := method(num, if((num==1)or(num==2),return(1)); fib(num-1)+fib(num-2))
fib(3) println


task 3.2
Number originM := Number getSlot("/")
Number / := method(num, if( num == 0, return(0), self originM(num)))
1/0 println
1/1 println

task 3.3 
lis := list(list(1,2,3), list(4,5,6))
lis flatten sum println 



