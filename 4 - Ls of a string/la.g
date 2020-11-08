la := function(Q,rho,input_str,sigma,eps)
	local x,y;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then return "Invalid String";
	fi;
	x := inverse_left(Q,rho,input_str,sigma,eps);
	if x = "Cannot Perform The Operation" then return 0;
	fi;

	while true do
		y := direct_left(Q,rho,x,sigma,eps);
		if y = "Cannot Perform The Operation" then return x;
		else x := y;
		fi;
	od;
end;