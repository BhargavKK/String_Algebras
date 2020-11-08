IsBandString := function(Q,rho,input_str,sigma,eps)
	local output, w1, w2, n, i, j, k, arr, m_arr, small, capital, count, temp;
	output := IsValidString(Q,rho,input_str,sigma,eps);
	if output = "Invalid String" or output =  "Invalid Labelling" then
	return output;
	fi;

	if output[1] = "Valid Zero Length String" then return "Not A Band";
	fi;

	if Length(input_str) = 1 then return "Not A Band";
	fi;

	n := Length(input_str);
	w1 := SourceOfArrow(Q,input_str[n]);
	w2 := TargetOfArrow(Q,input_str[1]);

	if w1 <> w2 then
		return "Not A Cyclic String";
	fi;
	
	capital := 0;
	small := 0;
		
	for i in [1..Length(input_str)] do
		if SIntChar(input_str[i]) >= SIntChar('A') and SIntChar(input_str[i]) <= SIntChar('Z') then
			capital := 1;
		elif SIntChar(input_str[i]) >= SIntChar('a') and SIntChar(input_str[i]) <= SIntChar('z') then
			small := 1;
		fi;
	od;

	if capital = 0 or small = 0 then return "Not A Mixed String";
	fi;

	temp := Concatenation(input_str, input_str);
	if IsValidString(Q,rho,temp,sigma,eps) <> "Valid String" then
		return "Not Squarable";
	fi;

	arr := computeLPSarray(input_str);
	if arr[Length(arr)] <> 0 and Length(input_str) mod (Length(input_str)-arr[Length(arr)]) = 0 then
		return "Not A Primitive String";
	else
		return "This Is A Band";
	fi;
end;