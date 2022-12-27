// 될 거라고 생각했는데.. 아니었다
unless := method(
    condition,
    a,
    b,
    (condition) ifFalse(a()) ifTrue(b())
)

unless (1 == 2, write("One is not two\n"), write("One is two\n"))

// 멋져!
unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
        call sender doMessage(call message argAt(1))) ifTrue(
            call sender doMessage(call message argAt(2)))
)

unless (1 == 2, write("One is not two\n"), write("One is two\n"))