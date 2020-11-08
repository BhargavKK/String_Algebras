temp_in := function(Q,i,j)
	return SIntChar(String(Incoming_Arrows(Q,i)[j])[1])-SIntChar('a')+1;
end;