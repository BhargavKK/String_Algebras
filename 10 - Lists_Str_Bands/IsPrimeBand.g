IsPrimeBand := function(Q,rho,input_str,sigma,eps)
	local i,j,temp,k,output, count;
	count := 0;
	output := IsValidString(Q,rho,input_str,sigma,eps);
	if output = "Invalid String" or output =  "Invalid Labelling" then
	return output;
	fi;

	if IsBandString(Q,rho,input_str,sigma,eps) = "This Is A Band" then
		if SIntChar(input_str[1]) < SIntChar('a') or SIntChar(input_str[Length(input_str)]) >= SIntChar('a') then
			return "First Letter Of The Input Band Has To Be Small And Last Letter Has To Be Capital";
		else
			for i in [1..Length(input_str)-1] do
				if SIntChar(input_str[i]) >= SIntChar('a') and SIntChar(input_str[i+1]) < SIntChar('a') then
					count := count + 1;
				fi;
				if count >= 2 then return false;
				fi;
			od;
		fi;
		
		return true;
	fi;

	return "Not A Band";

end;
