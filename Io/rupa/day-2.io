// 반복을 사용한 피보나치 배열
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

fib_recursive := method(n,
    if (n <= 1, n, fib_recursive(n-1) + fib_recursive(n-2))
)

// fib_recursive(7) println
// fib(7) println

// 0 나누기 override
Number origin := Number getSlot("/")
Number / = method(n, if(n == 0, 0, self origin(n)))

// 4 / 0 println
// 4 / 2 println

// 2차원 배열 값 모두 더하기
sum2D := method(
    arr,
    flatList := arr flatten
    flatList reduce(+)
)

sum2D(list(2,3, list(1,1,1), 4,5))

// List 평균값 구하기
sumAll := method(
    arr,
    sum := 0
    for (i, 0, arr size - 1, 

        if (arr at(i) isKindOf(Number),
            sum = sum + arr at(i), 
            Exception raise("Type is not a number")
        )
    )
    sum
)
List myAverage := method(
    if (self size == 0, "List is empty" println, 
        sum := sumAll(self)
        sum / self size
    )
)

list(5, 6) myAverage println

// 2차원 리스트를 위한 프로토타입
List2D := List clone

List2D dim := method(x, y, 
    y repeat(
        inner := list()
        x repeat(inner push(nil))
    
        self append(inner) 
    )
)

List2D set := method(x, y, value,
    self at(x) atPut(y, value)
)

List2D get := method(x, y,
    self at(x) at(y)
)

// 전치 행렬
List2D transpose := method(
    new_matrix := List2D clone
    x_len := self at(0) size
    y_len := self size
    new_matrix dim(x_len, y_len)
    
    x_len repeat(x,
        y_len repeat(y,
            new_matrix set(y, x, get(x, y))
        )
    )

    new_matrix
)

matrix := List2D clone
matrix dim(2,4)
matrix set(0, 0, "TEST A")
matrix set(0, 1, "TEST B")

matrix transpose println