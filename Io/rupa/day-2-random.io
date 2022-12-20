// 랜덤 수 알아맞추기
randomGame := method(randomNumber,
    tryCount := 0
    loopStatus := true

    while (tryCount < 3 and loopStatus == true,
        "Guess a number between 1 and 100" println

        guess := File standardInput readLine("Make a guess: ")
        guess = if(guess asNumber isNan, 0, guess asNumber)

        tryCount = tryCount + 1

        if (guess == randomNumber, loopStatus=false "SUCCESS!!" println, "FAIL..." println)
    ) 

    "---GAME END---" println
)

randomGame(44)