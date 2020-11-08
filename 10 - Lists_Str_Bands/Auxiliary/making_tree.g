making_tree := function(Q,rho,vertex,sigma,eps,level)
	local tree, x, i, count, j;

	tree := [];
	tree[1] := [1, vertex];
	i := 1;
	count := 0;
	x := direct_left(Q,rho,vertex,sigma,eps);
	if x <> "Cannot Perform The Operation" then
		Add(tree, [2*1, x]);
		j := 2;
	else
		count := count + 1;
	fi;

	x := inverse_left(Q,rho,vertex,sigma,eps);
	if x <> "Cannot Perform The Operation" then
		Add(tree, [2*1+1, x]);
		j := 3;
	else
		count := count + 1;
	fi;

	if count = 2 then return [];
	fi;
	i := 2;
	while true do
		if 2*tree[i][1] > 2^(level+1)-1 then break;
		fi;
		x := direct_left(Q,rho,tree[i][2],sigma,eps);
		if x <> "Cannot Perform The Operation" then
			Add(tree, [2*tree[i][1], x]);
			j := 2*tree[i][1];
		fi;

		x := inverse_left(Q,rho,tree[i][2],sigma,eps);
		if x <> "Cannot Perform The Operation" then
			Add(tree, [2*tree[i][1]+1, x]);
			j := 2*tree[i][1]+1;
		fi;
		i := i + 1;
	od;
	return tree;
end;
