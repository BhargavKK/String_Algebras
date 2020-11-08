direct_right := function(Q,rho,input_str,sigma,eps)
	local x,y,z,temp,output;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then
		return "Invalid String";
	fi;

	output := IsValidString(Q,rho,input_str,sigma,eps);

	if output[1] = "Valid Zero Length String" then
		temp := Incoming_Arrows(Q,output[2]);
		if input_str[output[3]+3] = '1' then
			if Length(temp) = 1 and eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then
				z := temp;
			elif Length(temp) = 2 then
				if eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then
					z := String(temp[1]);
				else
					z := String(temp[2]);
				fi;
			else z := "Cannot Perform The Operation";
			fi;
			return z;
		elif input_str[output[3]+3] = '-' then
			if Length(temp) = 1 and eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then
				z := String(temp[1]);
			elif Length(temp) = 2 then
				if eps[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then
					z := String(temp[1]);
				else
					z := String(temp[2]);
				fi;
			else z := "Cannot Perform The Operation";
			fi;
			return z;
		fi;
	fi;

	temp := input_str;
	if SIntChar(temp[Length(temp)]) > 96 then
		x := SIntChar(String(SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(temp[Length(temp)])-SIntChar('a')+1]))[2])-SIntChar('0');
		if Length(Incoming_Arrows(Q,x)) = 2 then
			z := [String(Incoming_Arrows(Q,x)[1])[1]];
			temp := Concatenation(temp,z);

			if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then
				z := [String(Incoming_Arrows(Q,x)[2])[1]];
				temp := input_str;
				temp := Concatenation(temp,z);
				if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
				fi;
			fi;
		elif Length(Incoming_Arrows(Q,x)) = 1 then
			z := [String(Incoming_Arrows(Q,x)[1])[1]];
			temp := Concatenation(temp,z);
			if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
			fi;
		else return "Cannot Perform The Operation";
		fi;

	else
		x := SIntChar(String(TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(temp[Length(temp)])-SIntChar('A')+1]))[2])-SIntChar('0');
		if Length(Incoming_Arrows(Q,x)) = 2 then
			if SIntChar(String(Incoming_Arrows(Q,x)[1])[1]) - SIntChar(temp[Length(temp)]) = 32 then y := String(Incoming_Arrows(Q,x)[2])[1];
			else
				y := String(Incoming_Arrows(Q,x)[1])[1];
			fi;
			z := [y];
			temp := Concatenation(temp,z);
			if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
			fi;
		else
			return "Cannot Perform The Operation";
		fi;
	fi;
	return temp;
end;
