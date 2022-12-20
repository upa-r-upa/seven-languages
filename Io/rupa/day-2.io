// 반복울 사용한 피보나치 배열
fib := method(n, 
    prev := 0
    present := 1
    result := 0

    for(i, 2, n, 
        result = prev + present
        prev = present
        present = result
    )

    result
)

fib(7) println

// 0 나누기 override
Number origin := Number getSlot("/")
Number / = method(n, if(n == 0, 0, self origin(n)))

4 / 0 println
4 / 2 println

// 2차원 배열 모두 더하기
sumAll := method(
    arr,
    sum := 0
    for (i, 0, arr size - 1, 
        sum = sum + arr at(i)
    )
    sum
)

sumAll(list(1,2,3,4)) println

// List 평균값 구하기
List getAverage := method(
    if (self size == 0, "Error" println, 
        sum := sumAll(self)
        sum / self size
    )
)

list(1,2,3,4) getAverage println
