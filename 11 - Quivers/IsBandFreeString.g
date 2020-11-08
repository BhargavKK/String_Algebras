IsBandFreeString := function(Q,rho,input_str,sigma,eps)
  local i,j,k,temp;
  if input_str[1] = '(' then
    return true;
  fi;
  
  for i in [1..Length(input_str)] do
    for j in [i+1..Length(input_str)] do
      if TargetOfArrow(Q,input_str[i]) = SourceOfArrow(Q,input_str[j]) then
        temp := [];
        for k in [i..j] do
          Add(temp,input_str[k]);
        od;
        if IsBandString(Q,rho,temp,sigma,eps) = "This Is A Band" then
          return false;
        fi;
      fi;
    od;
  od;

  return true;
end;
