TargetOfArrow := function(Q,ch)
	local i,ch1;
	ch1 := ch;
	if SIntChar(ch) < SIntChar('Z')+1 and SIntChar(ch) > SIntChar('A')-1 then
		ch := CharInt(SIntChar(ch)+32);
	fi;
	
	if SIntChar(ch)-SIntChar('a')+1 > NumberOfArrows(Q) then
		return "Invalid Labelling";
	fi;

	for i in [1..NumberOfArrows(Q)] do
		if String(ArrowsOfQuiver(Q)[i])[1] = ch then
			break;
		fi;
	od;

	if SIntChar(ch1) < SIntChar('Z')+1 and SIntChar(ch) > SIntChar('A')-1 then
	return SourceOfPath(ArrowsOfQuiver(Q)[i]);
	else
	return TargetOfPath(ArrowsOfQuiver(Q)[i]);
	fi;
end;