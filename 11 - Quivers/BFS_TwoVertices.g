BFS_TwoVertices := function(Q,rho,v1,v2,sigma,eps)
  local tree,tree1,i,j,k,array,count,vertex,x;

  Read("D:/IITK/Semester 3/Project/Codes/StringsLessThanOutput.g");

  array := [];

  for i in [1..Length(q)] do
    if q[i][1] = '(' then
      if v1 = v2 and q[i][2] = String(v1)[1] then
        Add(array, q[i]);
      fi;
    else
      if String(TargetOfArrow(Q, q[i][1])) = Concatenation("v", String(v2)) and String(SourceOfArrow(Q, q[i][Length(q[i])])) = Concatenation("v", String(v1)) then
        if IsBandFreeString(Q,rho,q[i],sigma,eps) = true then
          Add(array, q[i]);
        fi;
      fi;
    fi;
  od;

  return array;
end;


#  tree := [];
#  vertex := Concatenation("(", String(v1), ",", String(1), ")");
#  tree[1] := [1, vertex, Concatenation("v", String(v1))];
#  count := 0;
#  x := direct_left(Q,rho,vertex,sigma,eps);
#  if x <> "Cannot Perform The Operation" then
#    Add(tree, [2*1, x, String(TargetOfArrow(Q, x[1]))]);
#    j := 2;
#  else
#    count := count + 1;
#  fi;
#
#  x := inverse_left(Q,rho,vertex,sigma,eps);
#  if x <> "Cannot Perform The Operation" then
#    Add(tree, [3, x, String(TargetOfArrow(Q, x[1]))]);
#    j := 3;
#  else
#    count := count + 1;
#  fi;
#
#  if count = 2 then return [];
#  fi;
#  i := 2;
#  while true do
#		if 2*tree[i][1] > 2^(level+1)-1 then break;
#		fi;
#		x := direct_left(Q,rho,tree[i][2],sigma,eps);
#		if x <> "Cannot Perform The Operation" then
#			Add(tree, [2*tree[i][1], x, String(TargetOfArrow(Q, x[1]))]);
#			j := 2*tree[i][1];
#		fi;
#
#		x := inverse_left(Q,rho,tree[i][2],sigma,eps);
#		if x <> "Cannot Perform The Operation" then
#			Add(tree, [2*tree[i][1]+1, x, String(TargetOfArrow(Q, x[1]))]);
#			j := 2*tree[i][1]+1;
#		fi;
#		i := i + 1;
#	od;
#
#  tree1 := [];
#  vertex := Concatenation("(", String(v1), ",", String(-1), ")");
#  tree1[1] := [1, vertex, Concatenation("v", String(v1))];
#  count := 0;
#  x := direct_left(Q,rho,vertex,sigma,eps);
#  if x <> "Cannot Perform The Operation" then
#    Add(tree1, [2*1, x, String(TargetOfArrow(Q, x[1]))]);
#    j := 2;
#  else
#    count := count + 1;
#  fi;
#  x := inverse_left(Q,rho,vertex,sigma,eps);
#  if x <> "Cannot Perform The Operation" then
#    Add(tree1, [3, x, String(TargetOfArrow(Q, x[1]))]);
#    j := 3;
#  else
#    count := count + 1;
#  fi;
#
#  if count = 2 then return [];
#  fi;
#  i := 2;
#  while true do
#		if 2*tree1[i][1] > 2^(level+1)-1 then break;
#		fi;
#		x := direct_left(Q,rho,tree1[i][2],sigma,eps);
#		if x <> "Cannot Perform The Operation" then
#			Add(tree1, [2*tree1[i][1], x, String(TargetOfArrow(Q, x[1]))]);
#			j := 2*tree1[i][1];
#		fi;
#
#		x := inverse_left(Q,rho,tree1[i][2],sigma,eps);
#		if x <> "Cannot Perform The Operation" then
#			Add(tree1, [2*tree1[i][1]+1, x, String(TargetOfArrow(Q, x[1]))]);
#			j := 2*tree1[i][1]+1;
#		fi;
#		i := i + 1;
#	od;

#  Remove(tree, 1); Remove(tree1, 1);

#  array := [];
#  vertex := Concatenation("v", String(v2));
#  for i in [1..Length(tree)] do
#    if tree[i][3] = vertex and IsBandFreeString(Q,rho,tree[i][2],sigma,eps) = true then
#      Add(array, tree[i][2]);
#    fi;
#  od;
#
#  for i in [1..Length(tree1)] do
#    if tree1[i][3] = vertex and IsBandFreeString(Q,rho,tree1[i][2],sigma,eps) = true then
#      Add(array, tree1[i][2]);
#    fi;
#  od;
#  return array;
#end;
