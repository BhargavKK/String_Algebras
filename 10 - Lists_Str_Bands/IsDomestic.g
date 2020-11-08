IsDomestic := function(Q,rho,sigma,eps)
  local len,Q1, arr_quiver, i, j, count, temp, temp_arr;
  Read("D:/IITK/Semester 3/Project/Codes/BandsOutput.g");
  for i in [1..Length(b)] do
    if Length(b[i]) > 2*NumberOfVertices(Q) then
      return false;
    fi;
  od;

  count := 0;
  arr_quiver := [];
  len := Length(b);
  for i in [1..len] do
    for j in [1..len] do
      if i <> j then
        temp := Concatenation(b[i], b[j]);
        if IsValidString(Q,rho,temp,sigma,eps) = "Valid String" then
          count := count + 1;
          Append(arr_quiver, [[j,i,Concatenation("a",String(count))]]);
        fi;
      fi;
    od;
  od;

  Q1 := Quiver(len, arr_quiver);
  return IsAcyclicQuiver(Q1);
end;
