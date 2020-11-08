StringsLessThan := function(Q,rho,sigma,eps,level)
  local k, tree,array,i;
  array := [];
  for k in [1..NumberOfVertices(Q)] do
    vertex := Concatenation("(", String(k), ",", String(1), ")");
    tree := making_tree(Q,rho,vertex,sigma,eps,level);
    for i in [1..Length(tree)] do
      Add(array, tree[i][2]);
    od;

    vertex := Concatenation("(", String(k), ",", String(-1), ")");
    tree := making_tree(Q,rho,vertex,sigma,eps,level);
    for i in [1..Length(tree)] do
      Add(array, tree[i][2]);
    od;

  od;

end;
