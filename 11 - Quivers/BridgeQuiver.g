BridgeQuiver := function(Q,rho,sigma,eps)
  local lambda, i, j, k, str, temp, array, array1, perm, Q1, num, l;
  Read("D:/IITK/Semester 3/Project/Codes/BandsRepresentativesOutput.g");
  Read("D:/IITK/Semester 3/Project/Codes/WeakBridgeQuiverArrowsOutput.g");
  temp := [];
  lambda := [];
  for k in [1..Length(wb)] do
    lambda[k] := 1;
  od;
  for i in [1..Length(wb)] do
    for j in [1..Length(wb)] do     #make changes
      str := Concatenation(wb[i][3], wb[j][3]);
      if IsValidString(Q,rho,str,sigma,eps) = "Valid String" then
        if IsBandFreeString(Q,rho,str,sigma,eps) = true then
          for k in [1..Length(wb)] do
            if str = wb[k][3] then
              lambda[k] := 0;
              break;
            fi;
          od;
        else
          perm := CyclicPermutationOfABand(Q,rho,wb[i][2],sigma,eps);
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

          for k in [1..Length(wb)] do
            if temp = wb[k][3] then   #changes
              lambda[k] := 0;
              break;
            fi;
          od;
        fi;
      fi;
    od;
  od;

  array := [];
  array1 := [];
  for k in [1..Length(lambda)] do
    if lambda[k] = 1 then
      Add(array, wb[k]);
      Add(array1, wb1[k]);
    fi;
  od;
  PrintTo("D:/IITK/Semester 3/Project/Codes/BridgeQuiverArrowsOutput.g", "bridges := ", array, ";");
  Q1 := Quiver(Length(br), array1);
  return Q1;
end;
