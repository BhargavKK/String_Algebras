inverse_left := function(Q,rho,input_str,sigma,eps)

	local x,y,z,temp,output;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then 
		return "Invalid String";
	fi;

	output := IsValidString(Q,rho,input_str,sigma,eps);

	if output[1] = "Valid Zero Length String" then
		temp := Incoming_Arrows(Q,output[2]);
		if input_str[output[3]+3] = '1' then
			if Length(temp) = 1 and eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then 
				z := [CharInt(SIntChar(String(temp[1])[1])-32)];
			elif Length(temp) = 2 then
				if eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then 
					z := [CharInt(SIntChar(String(temp[1])[1])-32)];
				else
					z := [CharInt(SIntChar(String(temp[2])[1])-32)];
				fi;
			else z := "Cannot Perform The Operation";
			fi;
			return z;
		elif input_str[output[3]+3] = '-' then
			if Length(temp) = 1 and eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then 
				z := [CharInt(SIntChar(String(temp[1])[1])-32)];
			elif Length(temp) = 2 then
				if eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then 
					z := [CharInt(SIntChar(String(temp[1])[1])-32)];
				else
					z := [CharInt(SIntChar(String(temp[2])[1])-32)];
				fi;
			else z := "Cannot Perform The Operation";
			fi;
			return z;
		fi;
	fi;

	if SIntChar(input_str[1]) > 96 then
		x := SIntChar(String(TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[1])-SIntChar('a')+1]))[2])-SIntChar('0');
		if Length(Incoming_Arrows(Q,x)) = 2 then 
			if String(Incoming_Arrows(Q,x)[1])[1] = input_str[1] then y := String(Incoming_Arrows(Q,x)[2])[1];
			else 
				y := String(Incoming_Arrows(Q,x)[1])[1];
			fi;
			z := [CharInt(SIntChar(y)-32)];
			Append(z, input_str);
			if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
			fi;
		else
			return "Cannot Perform The Operation";
		fi;
	else
		x := SIntChar(String(SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[1])-SIntChar('A')+1]))[2])-SIntChar('0');
		if Length(Incoming_Arrows(Q,x)) = 2 then
			z := [CharInt(SIntChar(String(Incoming_Arrows(Q,x)[1])[1])-32)];
			Append(z, input_str);

			if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then
				z := [CharInt(SIntChar(String(Incoming_Arrows(Q,x)[2])[1])-32)];
				Append(z, input_str);
				if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
				fi;
			fi;
		elif Length(Incoming_Arrows(Q,x)) = 1 then
			z := [CharInt(SIntChar(String(Incoming_Arrows(Q,x)[1])[1])-32)];
			Append(z, input_str);
			if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
			fi;
		else return "Cannot Perform The Operation";
		fi;
	fi;
	return z;
end;