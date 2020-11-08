La_Lb := function(Q,rho,input_str,sigma,eps)
	local temp, temp1, temp2, i, j, k, lnb,lnu,b,u,d,d1;
	if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" or IsValidString(Q,rho,input_str,sigma,eps) = "Invalid Labelling" then
		return "Invalid String";
	fi;

	temp := infinity_La(Q,rho,input_str,sigma,eps);
	if temp = "Invalid String" or temp = 0 then return temp;
	fi;
	b := temp[1];
	u := temp[2];

	lnb := Length(b);
	lnu := Length(u);

	if u[1] = '(' then
		temp2 := infinity_Lb(Q,rho,u,sigma,eps);
		if temp2 <> 0 then
			if temp2[2] = u and IsEqualBands(Q,rho,b, temp2[1],sigma,eps) = true then
				return u;
			fi;
		fi;

		for i in [1..lnb] do
			temp1 := [];
			for j in [1..i] do
				Append(temp1, [b[lnb-(i-j)]]);
			od;
			temp2 := infinity_Lb(Q,rho,temp1,sigma,eps);
			if temp2 <> 0 then
				if temp2[2] = u and IsEqualBands(Q,rho,b, temp2[1],sigma,eps) = true then
					return temp1;
				fi;
			fi;
		od;

	else
		temp1 := [];
		d1 := [];
		d := String(SourceOfArrow(Q, u[Length(u)]));
		for k in [2..Length(d)] do
			Append(d1, [d[k]]);
		od;
		Append(temp1, ['(']);
		Append(temp1, d1);
		Append(temp1, [',']);
		Append(temp1, String(-1*SigmaOfString(Q,rho,u,sigma,eps)));
		Append(temp1, [')']);

		temp2 := infinity_Lb(Q,rho,temp1,sigma,eps);
		if temp2 <> 0 then
			if temp2[2] = u and IsEqualBands(Q,rho,b, temp2[1],sigma,eps) = true then
				return temp1;
			fi;
		fi;

		for i in [1..lnu] do
			temp1 := [];
			for j in [1..i] do
				Append(temp1, [u[lnu-(i-j)]]);
			od;
			temp2 := infinity_Lb(Q,rho,temp1,sigma,eps);
			if temp2 <> 0 then
				if temp2[2] = u and IsEqualBands(Q,rho,b, temp2[1],sigma,eps) = true then
					return temp1;
				fi;
			fi;
		od;

		for i in [1..lnb] do
			temp1 := [];
			for j in [1..i] do
				Append(temp1, [b[lnb-(i-j)]]);
			od;
			temp1 := Concatenation(temp1, u);
			temp2 := infinity_Lb(Q,rho,temp1,sigma,eps);
			if temp2 <> 0 then
				if temp2[2] = u and IsEqualBands(Q,rho,b, temp2[1],sigma,eps) = true then
					return temp1;
				fi;
			fi;
		od;
	fi;

	return 0;
end;
