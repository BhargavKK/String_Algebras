IsValidString := function(Q, rho, input_str, sigma, eps)
	local i,j,k,rel,temp, temp_caps, temp1, y, x, l, length, count, num, num_digits,lit;
	
	num := NumberOfVertices(Q);
	num_digits := 0;
	while num <> 0 do
		num := num - num mod 10;
		num := num/10;
		num_digits := num_digits + 1;
	od;
	 

	y := "0123456789(-,)";

	for i in [1..Length(ArrowsOfQuiver(Q))] do
		y := Concatenation(String(ArrowsOfQuiver(Q)[i]), y);
	od;
	for i in [1..Length(ArrowsOfQuiver(Q))] do
		y := Concatenation([CharInt(SIntChar(String(ArrowsOfQuiver(Q)[i])[1])-32)], y);
	od;

	for i in [1..Length(input_str)] do
               if not input_str[i] in y then
                       return "Invalid Labelling";
               fi;
	od;	
	
	if input_str[1] = '(' then
		num := 0;
		for j in [2..num_digits+1] do
			num := num + (SIntChar(input_str[j])-SIntChar('0'))*10^(num_digits-j+1);
		od;
		if \in(num,[1..NumberOfVertices(Q)]) and input_str[num_digits+2] = ',' and input_str[num_digits+3] = '1' and input_str[num_digits+4] = ')' then
			return ["Valid Zero Length String",num,num_digits];
		elif \in(num,[1..NumberOfVertices(Q)]) and input_str[num_digits+2] = ',' and input_str[num_digits+3] = '-' and input_str[num_digits+4] = '1' and input_str[num_digits+5] = ')' then
			return ["Valid Zero Length String",num,num_digits];
		fi;
	fi;

	for i in [1..14] do
		Unbind(y[Length(y)]);
	od;

	count := 0;
	if Length(input_str)>2 then
	for i in [1..Length(input_str)-2] do
		if input_str[i] = '-' and input_str[i+1] = '1' and \in(input_str[i+2],y) then
			if SIntChar(input_str[i+2]) > 96 and eps[SIntChar(input_str[i+2]) - SIntChar('a') + 1] = 1 then return "Invalid String";
			elif SIntChar(input_str[i+2]) < 96 and sigma[SIntChar(input_str[i+2]) - SIntChar('A') + 1] = 1 then return "Invalid String";
			else
				for j in [i..Length(input_str)-2] do
					input_str[j] := input_str[j+2];
				od;
				count := count + 2;
			fi;
			if input_str[i+1] = '1' then input_str[i+1] := '2';
			fi;
		fi;
	od;
	fi;
		
	if Length(input_str) > 1 then
	for i in [1..Length(input_str)-1] do
		if input_str[i] = '1' and \in(input_str[i+1],y) then
			if SIntChar(input_str[i+1]) > 96 and eps[SIntChar(input_str[i+1]) - SIntChar('a') + 1] = -1 then return "Invalid String";
			elif SIntChar(input_str[i+1]) < 96 and sigma[SIntChar(input_str[i+1]) - SIntChar('A') + 1] = -1 then return "Invalid String";
			else
				for j in [i..Length(input_str)-1] do
					input_str[j] := input_str[j+1];
				od;
				count := count + 1;
			fi;
		fi;
	od;
	fi;

	if Length(input_str)>1 then
	if input_str[Length(input_str)-1] = '-' and input_str[Length(input_str)] = '1' and \in(input_str[Length(input_str)-2], y) then
		if SIntChar(input_str[Length(input_str)-2]) > 96 and sigma[SIntChar(input_str[Length(input_str)-2]) - SIntChar('a') + 1] = -1 then return "Invalid String";
		elif SIntChar(input_str[Length(input_str)-2]) < 96 and eps[SIntChar(input_str[Length(input_str)-2]) - SIntChar('A') + 1] = -1 then return "Invalid String";
		else
			count := count + 2;
		fi;
	elif input_str[Length(input_str)] = '1' and \in(input_str[Length(input_str)-1], y) then
		if SIntChar(input_str[Length(input_str)-1]) > 96 and sigma[SIntChar(input_str[Length(input_str)-1]) - SIntChar('a') + 1] = 1 then
			return "Invalid String";
		elif SIntChar(input_str[Length(input_str)-1]) < 96 and eps[SIntChar(input_str[Length(input_str)-1]) - SIntChar('A') + 1] = 1 then
			return "Invalid String";
		else
			count := count + 1;
		fi;
	fi;
	fi;

	for i in [1..count] do
	Unbind(input_str[Length(input_str)]);
	od;
	
	for i in [1..Length(input_str)] do
               if not input_str[i] in y then
                       return "Invalid Labelling";
               fi;
	od;

	if IsReducedWalk(Q, input_str) = 0 then return "Invalid String";
	fi;

	if IsValidWalk(Q, input_str) = "Invalid String" then return "Invalid String";
	fi;

	x := 0;
	for i in [1..Length(rho)] do
		temp := "";
		temp_caps := "";
		rel := WalkOfPath(rho[i]);
		for j in [1..Length(rel)] do
			temp := Concatenation(String(rel[j]), temp);
		od;
		
		for j in [1..Length(rel)] do
			temp1 := CharSInt(SIntChar(String(rel[j])[1]) - 32);
			temp_caps[j] := temp1;
		od;
		
		l := Length(input_str)-Length(temp);

		for j in [0..l] do
			for k in [1..Length(temp)] do
				if input_str[j+k] <> temp[k] then
					break;
				fi;
			od;

			if k = Length(temp) and input_str[j+k] = temp[k] then
				x := 3;
				break;
			fi;
		od;
	
		for j in [0..l] do
			for k in [1..Length(temp_caps)] do
				if input_str[j+k] <> temp_caps[k] then
					break;
				fi;
			od;

			if k = Length(temp_caps) and input_str[j+k] = temp_caps[k] then
				x := 3;
				break;
			fi;
		od;
	od;
	
	if x=0 then return "Valid String";
	else return "Invalid String";
	fi;
end;