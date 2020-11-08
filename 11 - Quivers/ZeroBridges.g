ZeroBridges := function(Q,rho,sigma,eps)
  local lambda, i, j, k, str, temp, array, array1, perm, Q1, num, l;
  Read("D:/IITK/Semester 3/Project/Codes/WeakHalfBridgesOutput.g");
  Read("D:/IITK/Semester 3/Project/Codes/WeakZeroBridgesOutput.g");
  temp := [];
  lambda := [];
  for k in [1..Length(whb)] do
    lambda[k] := 1;
  od;

  for i in [1..Length(whb)] do
    for j in [1..Length(bridges)] do
      str := Concatenation(whb[i][3], bridges[j][3]);
      if IsValidString(Q,rho,str,sigma,eps) = "Valid String" then
        if IsBandFreeString(Q,rho,str,sigma,eps) = true then
          for k in [1..Length(whb)] do
            if str = whb[k][3] then
              lambda[k] := 0;
              break;
            fi;
          od;
        else
          perm := CyclicPermutationOfABand(Q,rho,whb[i][2],sigma,eps);
          for k in [1..Length(perm)] do
            num := KMPSearch(perm[k], str);
            if num <> 0 then
              for l in [1..num-1] do
                Add(temp, str[l]);
              od;
              for l in [num+Length(perm[k])..Length(str)] do
                Add(temp, str[l]);
              od;
              break;
            fi;
          od;

          for k in [1..Length(whb)] do
            if temp = whb[k][3] then
              lambda[k] := 0;
              break;
            fi;
          od;
        fi;
      fi;
    od;
  od;

  array := [];
  for k in [1..Length(lambda)] do
    if lambda[k] = 1 then
      Add(array, whb[k]);
    fi;
  od;
  PrintTo("D:/IITK/Semester 3/Project/Codes/HalfBridgesOutput.g", "halfbridges := ", array, ";");
end;
