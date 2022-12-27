// 대괄호 문법을 사용하는 배열 
"--대괄호 문법 시작--" println

squareBrackets := method(call message arguments)  // arguments 자체가 원래 배열
List squareBrackets := method(index, value,
  if(value == nil,
    at(index),
    atPut(index, value)
  )
)

squareList := [10, 11, 12]
squareList println
squareList[1] println
// squareList[1] = 30 // 해당 문법은 지원되지 않는 문법
squareList[1, 21] println // 아쉽지만 해당 문법으로
