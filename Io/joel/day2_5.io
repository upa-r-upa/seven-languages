//ranNum := Random value(1,100) floor
ranNum := 10
stanIO := File standardInput 

10 repeat(
	"Guess Number: " println;
        guess := stanIO readLine asNumber; 
	if((guess==ranNum),break;);
	if(guess < ranNum, "More!" println, "Smaller" println);
);
if((guess == ranNum),"Excellent!" println,"try again #{ranNum}"println); 
