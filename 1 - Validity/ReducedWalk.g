IsReducedWalk := function(Q, input_str)
	local x,y,i,j;
	x := 0;
	y := ['-','1'];
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
		if SIntChar(input_str[i])-SIntChar(input_str[i+1])=32 or SIntChar(input_str[i+1])-SIntChar(input_str[i]) = 32 then
			x := 1;
		else continue;
		fi;
	od;
	if x=0 then return 1;
	else return 0;
	fi;
end;