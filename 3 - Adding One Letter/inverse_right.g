inverse_right := function(Q,rho,input_str,sigma,eps)
	local x,y,z,temp,output;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then 
		return "Invalid String";
	fi;

	output := IsValidString(Q,rho,input_str,sigma,eps);

	if output[1] = "Valid Zero Length String" then
		temp := Outgoing_Arrows(Q,output[2]);
		if input_str[output[3]+3] = '1' then
			if Length(temp) = 1 and sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then 
				z := [CharInt(SIntChar(String(temp[1])[1])-32)];
			elif Length(temp) = 2 then
				if sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then 
					z := [CharInt(SIntChar(String(temp[1])[1])-32)];
				else
					z := [CharInt(SIntChar(String(temp[2])[1])-32)];
				fi;
			else z := "Cannot Perform The Operation";
			fi;
			return z;
		elif input_str[output[3]+3] = '-' then
			if Length(temp) = 1 and sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then 
				z := [CharInt(SIntChar(String(temp[1])[1])-32)];
			elif Length(temp) = 2 then
				if sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then 
					z := [CharInt(SIntChar(String(temp[1])[1])-32)];
				else
					z := [CharInt(SIntChar(String(temp[2])[1])-32)];
				fi;
			else z := "Cannot Perform The Operation";
			fi;
			return z;
		fi;
	fi;

	temp := input_str;
	if SIntChar(temp[Length(temp)]) > 96 then
		x := SIntChar(String(SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(temp[Length(temp)])-SIntChar('a')+1]))[2])-SIntChar('0');
		if Length(Outgoing_Arrows(Q,x)) = 2 then 
			if String(Outgoing_Arrows(Q,x)[1])[1] = temp[Length(temp)] then y := String(Outgoing_Arrows(Q,x)[2])[1];
			else 
				y := String(Outgoing_Arrows(Q,x)[1])[1];
			fi;
			z := [CharInt(SIntChar(y)-32)];
			Append(temp,z);
			if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
			fi;
		else
			return "Cannot Perform The Operation";
		fi;
	else
		x := SIntChar(String(TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(temp[Length(temp)])-SIntChar('A')+1]))[2])-SIntChar('0');
		if Length(Outgoing_Arrows(Q,x)) = 2 then
			z := [CharInt(SIntChar(String(Outgoing_Arrows(Q,x)[1])[1])-32)];
			temp := Concatenation(temp, z);

			if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then
				temp := input_str;
				z := [CharInt(SIntChar(String(Outgoing_Arrows(Q,x)[2])[1])-32)];
				Append(temp, z);
				if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
				fi;
			fi;
		elif Length(Outgoing_Arrows(Q,x)) = 1 then
			z := [CharInt(SIntChar(String(Outgoing_Arrows(Q,x)[1])[1])-32)];
			Append(temp, z);
			if IsValidString(Q,rho,temp,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
			fi;
		else return "Cannot Perform The Operation";
		fi;
	fi;
	return temp;

end;