find_num := function(tree, num)
  local i;
  for i in [1..Length(tree)] do
    if num = tree[i][1] then
      return i;
    fi;
  od;
  return 0;
end;
