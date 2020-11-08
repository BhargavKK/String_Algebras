WeakHalfBridges := function(Q,rho,sigma,eps)
  local arr_quiver, i, j, k, str,temp,j1,j2;
  Read("D:/IITK/Semester 3/Project/Codes/BandsOutput.g");

  arr_quiver := [];
  for i in [1..NumberOfVertices(Q)] do
    for j in [1..Length(b)] do
      str := Concatenation("(", String(i), ",", String(1), ")");
      j1 := i;
      j2 := SIntChar(String(SourceOfArrow(Q,b[j][Length(b[j])]))[2]) - SIntChar('0');
      temp := BFS_TwoVertices(Q,rho,j1,j2,sigma,eps);   #make changes
      for k in [1..Length(temp)] do
        if IsValidString(Q,rho,Concatenation(b[j], temp[k]),sigma,eps) = "Valid String" and SigmaOfString(Q,rho,temp[k],sigma,eps) = 1 then
          Add(arr_quiver, [str, b[j], temp[k]]);
        fi;
      od;

      str := Concatenation("(", String(i), ",", String(-1), ")");
      j1 := i;
      j2 := SIntChar(String(SourceOfArrow(Q,b[j][Length(b[j])]))[2]) - SIntChar('0');
      temp := BFS_TwoVertices(Q,rho,j1,j2,sigma,eps);   #make changes
      for k in [1..Length(temp)] do
        if IsValidString(Q,rho,Concatenation(b[j], temp[k]),sigma,eps) = "Valid String" and SigmaOfString(Q,rho,temp[k],sigma,eps) = -1 then
          Add(arr_quiver, [str, b[j], temp[k]]);
        fi;
      od;
    od;
  od;

  PrintTo("D:/IITK/Semester 3/Project/Codes/WeakHalfBridgesOutput.g", "whb := ", arr_quiver, ";");

  #return arr_quiver;
end;
