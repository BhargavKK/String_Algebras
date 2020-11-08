La_Inverse := function(Q,rho,input_str,sigma,eps)
	local i, j, temp, v, val;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then
	return "Invalid String";
	fi;

	if direct_left(Q,rho,input_str,sigma,eps) <> "Cannot Perform The Operation" then return "This is not La of any string";
	fi;

	temp := 0;

	for i in [1..Length(input_str)] do
		if SIntChar(input_str[i]) > SIntChar('A')-1 and SIntChar(input_str[i]) < SIntChar('Z')+1 then
			temp := 1;
			break;
		fi;  
	od;

	if temp = 0 then return "This is not La of any string";
	fi;

	if i = Length(input_str) then
		for j in [1..NumberOfArrows(Q)] do
			if SIntChar(String(ArrowsOfQuiver(Q)[j])[1]) - SIntChar(input_str[i]) = 32 then
				v := String(TargetOfPath(ArrowsOfQuiver(Q)[j]))[2];
				break;
			fi;
		od;

		val := String((-1)*eps[SIntChar(input_str[i])-SIntChar('A')+1]);

		return Concatenation("(", [v], ",", val, ")");
	fi;

	temp := [];

	for j in [i+1..Length(input_str)] do
		Append(temp, [input_str[j]]);
	od;
	return temp;
end;