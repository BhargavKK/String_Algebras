MaximumLengthOFDirectString := function(Q,rho,sigma,eps)
  local arr, i, max, x, y;
  arr := [];
  for i in [1..NumberOfArrows(Q)] do
    x := [CharInt(i+96)];
    while true do
  		y := direct_left(Q,rho,x,sigma,eps);
  		if y = "Cannot Perform The Operation" then
        Append(arr, [Length(x)]);
        break;
  		else
        x := y;
  		fi;
  	od;
  od;
  max := arr[1];
  for i in [2..Length(arr)] do
    if arr[i] > max then max := arr[i];
    fi;
  od;
  return max;
end;
