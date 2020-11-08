EpsOfString := function(Q,rho,input_str,sigma,eps)

	local x;
	if sigma[1] = 0 then return "Invalid Sigma Values";
	fi;

	if SIntChar(input_str[1]) > 96 then
		x := SIntChar(input_str[1]) - SIntChar('a')+1;
		return eps[x];
	else
		x := SIntChar(input_str[1]) - SIntChar('A')+1;
		return sigma[x];
	fi;
end;