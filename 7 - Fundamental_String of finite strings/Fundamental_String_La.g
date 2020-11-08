Fundamental_String_La := function(Q,rho,input_str,sigma,eps)
	local temp, temp1;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then
		return "Invalid String";
	fi;
	temp := input_str;
	while true do
		input_str := La_Inverse(Q,rho,temp,sigma,eps);
		if input_str = "This is not La of any string" then break;
		fi;
		temp := input_str;
	od;

	if temp = temp1 then
		return "This is not La of any string";
	else
		return temp;
	fi;
end;