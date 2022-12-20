Task := Object clone
Task desc := method("Task is done" println) 
Task what := method("What is a task?" println)
Task doIt := method(TaskName, perform(TaskName))

Task doIt("what")
