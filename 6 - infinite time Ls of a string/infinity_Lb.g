infinity_Lb := function(Q,rho,input_str,sigma,eps)

	local x,y,z,array,L,temp,i,temp1;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" or IsValidString(Q,rho,input_str,sigma,eps) = "Invalid Labelling" then 
		return "Invalid String";
	fi;

	if direct_left(Q,rho,input_str,sigma,eps) = "Cannot Perform The Operation" then
		return 0;
	fi;
	array := [];

	if input_str[1] = '(' then
		x := lb(Q,rho,input_str,sigma,eps);
		if x = 0 then return input_str;
		else input_str := x;
		fi;
		Append(array, [input_str[Length(input_str)]]);
	fi;

	while true do
		L := Length(input_str);
		x := lb(Q,rho,input_str,sigma,eps);
		if x = 0 then return input_str;
		else input_str := x;
		fi;

		if \in(input_str[Length(input_str)-L], array) = false then
			Append(array, [input_str[Length(input_str)-L]]);
		else 
			y := input_str[Length(input_str)-L];
			break;
		fi;
	od;

	for i in [1..L] do
		input_str[i] := input_str[i+Length(input_str)-L];
	od;

	for i in [1..Length(input_str)-L] do
		Unbind(input_str[Length(input_str)]);
	od;

	temp := ['['];
	i := 1;
	while (temp[Length(temp)] <> y) do
		Append(temp, [input_str[i]]);
		i  := i+1;
	od;

	temp1 := [];
	for i in [2..Length(temp)] do
		Append(temp1, [temp[i]]);
	od;
	temp := temp1;
	temp1 := [];

	while i <= Length(input_str) do
		Append(temp1,[input_str[i]]);
		i := i+1;
	od;

	return left_infinity_simplification(Q,rho,temp,temp1,sigma,eps);

end;