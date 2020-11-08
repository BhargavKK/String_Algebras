temp_out := function(Q,i,j)
	return SIntChar(String(Outgoing_Arrows(Q,i)[j])[1])-SIntChar('a')+1;
end;
