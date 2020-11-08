SigmaOfString := function(Q,rho,input_str,sigma,eps)

	local x;
	if sigma[1] = 0 then return "Invalid Sigma Values";
	fi;

	if SIntChar(input_str[Length(input_str)]) > 96 then
		x := SIntChar(input_str[Length(input_str)]) - SIntChar('a')+1;
		return sigma[x];
	else
		x := SIntChar(input_str[Length(input_str)]) - SIntChar('A')+1;
		return eps[x];
	fi;
end;
