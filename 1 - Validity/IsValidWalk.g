IsValidWalk := function (Q, input_str)
	local i,j,k,x,s,t,array, y;
	x := 0;

	y := [];
	for i in [1..Length(ArrowsOfQuiver(Q))] do
		Append(y, String(ArrowsOfQuiver(Q)[i]));
	od;

	for i in [1..Length(ArrowsOfQuiver(Q))] do
		Append(y, [CharInt(SIntChar(String(ArrowsOfQuiver(Q)[i])[1])-32)]);
	od;

	for i in [1..Length(input_str)] do
               if not input_str[i] in y then
                       return "Invalid Labelling";
               fi;
	od;
	
	for i in [1..Length(input_str)-1] do
		if SIntChar(input_str[i]) > 96 then
			if SIntChar(input_str[i+1]) > 96 then
				if SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i])-SIntChar('a')+1]) <> TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i+1])-SIntChar('a')+1]) then
					x := 1;
				fi;
			else
				if SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i])-SIntChar('a')+1]) <> SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i+1])-SIntChar('A')+1]) then
					x := 1;
				fi;
			fi;
		else
			if SIntChar(input_str[i+1]) > 96 then
				if TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i])-SIntChar('A')+1]) <> TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i+1])-SIntChar('a')+1]) then
					x := 1;
				fi;
			else
				if TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i])-SIntChar('A')+1]) <> SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[i+1])-SIntChar('A')+1]) then
					x := 1;
				fi;
			fi;
		fi;
	od;

	if x=0 then
		if SIntChar(input_str[Length(input_str)]) > 96 then s := SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[Length(input_str)])-SIntChar('a')+1]);
		else s := TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[Length(input_str)])-SIntChar('A')+1]);
		fi;

		if SIntChar(input_str[1]) > 96 then t := TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[1])-SIntChar('a')+1]);
		else t := SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[1])-SIntChar('A')+1]);
		fi;

		array := [s, t];
	fi;

	if x=1 then return "Invalid String";
	else return "Valid String";
	fi;
end;