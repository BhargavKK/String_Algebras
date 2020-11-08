sigma_eps := function(Q,rho)

	local i,j,k,sigma,eps;
	sigma := [];
	eps := [];
	for i in [1..NumberOfArrows(Q)] do
		Append(sigma, [0]);
		Append(eps, [0]);
	od;
	
	for i in [1..NumberOfVertices(Q)] do
		if Length(Incoming_Arrows(Q,i)) = 2 then
			eps[temp_in(Q,i,1)] := 1;
			eps[temp_in(Q,i,2)] := -1;
			if Length(Outgoing_Arrows(Q,i)) = 1 then
				if IsComposable(Q,rho,Outgoing_Arrows(Q,i)[1],Incoming_Arrows(Q,i)[1]) = 1 then
					sigma[temp_out(Q,i,1)] := -1;
				elif IsComposable(Q,rho,Outgoing_Arrows(Q,i)[1],Incoming_Arrows(Q,i)[2]) = 1 then
					sigma[temp_out(Q,i,1)] := 1;
				fi;
			elif Length(Outgoing_Arrows(Q,i)) = 2 then
				if IsComposable(Q,rho,Outgoing_Arrows(Q,i)[1],Incoming_Arrows(Q,i)[1]) = 1 or IsComposable(Q,rho,Outgoing_Arrows(Q,i)[2],Incoming_Arrows(Q,i)[2]) = 1 then
					sigma[temp_out(Q,i,1)] := -1;
					sigma[temp_out(Q,i,2)] := 1;
				else 
					sigma[temp_out(Q,i,1)] := 1;
					sigma[temp_out(Q,i,2)] := -1;
				fi;
			fi;
		elif Length(Incoming_Arrows(Q,i)) = 1 then
			if Length(Outgoing_Arrows(Q,i)) = 1 then
				eps[temp_in(Q,i,1)] := 1;
				sigma[temp_out(Q,i,1)] := -1;
			elif Length(Outgoing_Arrows(Q,i)) = 2 then
				sigma[temp_out(Q,i,1)] := 1;
				sigma[temp_out(Q,i,2)] := -1;
				if IsComposable(Q,rho,Outgoing_Arrows(Q,i)[1],Incoming_Arrows(Q,i)[1]) = 1 then
					eps[temp_in(Q,i,1)] := -1;
				else
					eps[temp_in(Q,i,1)] := 1;
				fi;
			fi;
		elif Length(Incoming_Arrows(Q,i)) = 0 then
			sigma[temp_out(Q,i,1)] := 1;
			sigma[temp_out(Q,i,2)] := -1;
		fi;
	od;

	return [sigma, eps];
end;