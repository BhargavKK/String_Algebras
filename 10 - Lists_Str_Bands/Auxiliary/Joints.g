Joints := function(Q,rho,sigma,eps)
  local arr, i, temp;
  arr := [];
  for i in [1..NumberOfArrows(Q)] do
    temp := inverse_right(Q,rho,[CharInt(i+96)],sigma,eps);
    if temp <> "Cannot Perform The Operation" then
      Append(arr, [temp]);
    fi;
  od;
  return arr;
end;
