// 이해했던 의도
slot := method(
    "SLOT" println
)

// 추가 내용
Excuter := Object clone
Excuter target := method("Task excute" println)
Excuter excuter := method(name, perform(name))

Excuter excuter("target");