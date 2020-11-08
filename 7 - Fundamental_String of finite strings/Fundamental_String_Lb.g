Fundamental_String_Lb := function(Q,rho,input_str,sigma,eps)
	local temp;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then
		return "Invalid String";
	fi;
	temp := input_str;
	while true do
		input_str := Lb_inverse(Q,rho,temp,sigma,eps);
		if input_str = "This is not Lb of any string" then break;
		fi;
		temp := input_str;
	od;
	return temp;
end;