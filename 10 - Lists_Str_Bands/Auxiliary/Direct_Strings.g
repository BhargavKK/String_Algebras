Direct_Strings := function(Q,rho,sigma,eps)
  local arr, i, x, y;
  arr := [];
  for i in [1..NumberOfArrows(Q)] do
    x := [CharInt(i+96)];
    Append(arr,[x]);
    while true do
  		y := direct_left(Q,rho,x,sigma,eps);
  		if y = "Cannot Perform The Operation" then break;
  		else
        x := y;
        Append(arr,[x]);
  		fi;
  	od;
  od;
  return arr;

end;
