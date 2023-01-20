sort_list([A], [A]).

sort_list([Head|Tail], Sorted) :- 
	min([Head|Tail], Min), 
	Head > Min, 
	append(Tail, [Head], HeadAfterTail), 
	sort_list(HeadAfterTail, Sorted).

sort_list([Head|Tail], [Head|SortedTail]) :- 
	min([Head|Tail], Head), 
	sort_list(Tail, SortedTail), 
	append([Head], SortedTail, Sorted).