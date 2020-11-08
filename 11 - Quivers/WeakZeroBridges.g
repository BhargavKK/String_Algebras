WeakZeroBridges := function(Q,rho,sigma,eps)
  local arr_quiver, i, j, k, str1, str2 ,temp,j1,j2;

  arr_quiver := [];
  for i in [1..NumberOfVertices(Q)] do
    for j in [1..NumberOfVertices(Q)] do
      str1 := Concatenation("(", String(i), ",", String(1), ")");
      str2 := Concatenation("(", String(j), ",", String(1), ")");
      j1 := i;
      j2 := j;
      temp := BFS_TwoVertices(Q,rho,j1,j2,sigma,eps);   #make changes
      for k in [1..Length(temp)] do
        if temp[k][1] = '(' then Add(arr_quiver, [str2, str1, temp[k]]);
        else
          if SigmaOfString(Q,rho,temp[k],sigma,eps) = 1 and EpsOfString(Q,rho,temp[k],sigma,eps) = 1 then
            Add(arr_quiver, [str2, str1, temp[k]]);
          fi;
        fi;
      od;

      str1 := Concatenation("(", String(i), ",", String(1), ")");
      str2 := Concatenation("(", String(j), ",", String(-1), ")");
      j1 := i;
      j2 := j;
      temp := BFS_TwoVertices(Q,rho,j1,j2,sigma,eps);   #make changes
      for k in [1..Length(temp)] do
        if temp[k][1] = '(' then Add(arr_quiver, [str2, str1, temp[k]]);
        else
          if SigmaOfString(Q,rho,temp[k],sigma,eps) = -1 and EpsOfString(Q,rho,temp[k],sigma,eps) = 1 then
            Add(arr_quiver, [str2, str1, temp[k]]);
          fi;
        fi;
      od;

      str1 := Concatenation("(", String(i), ",", String(-1), ")");
      str2 := Concatenation("(", String(j), ",", String(1), ")");
      j1 := i;
      j2 := j;
      temp := BFS_TwoVertices(Q,rho,j1,j2,sigma,eps);   #make changes
      for k in [1..Length(temp)] do
        if temp[k][1] = '(' then Add(arr_quiver, [str2, str1, temp[k]]);
        else
          if SigmaOfString(Q,rho,temp[k],sigma,eps) = 1 and EpsOfString(Q,rho,temp[k],sigma,eps) = -1 then
            Add(arr_quiver, [str2, str1, temp[k]]);
          fi;
        fi;
      od;

      str1 := Concatenation("(", String(i), ",", String(-1), ")");
      str2 := Concatenation("(", String(j), ",", String(-1), ")");
      j1 := i;
      j2 := j;
      temp := BFS_TwoVertices(Q,rho,j1,j2,sigma,eps);   #make changes
      for k in [1..Length(temp)] do
        if temp[k][1] = '(' then Add(arr_quiver, [str2, str1, temp[k]]);
        else
          if SigmaOfString(Q,rho,temp[k],sigma,eps) = -1 and EpsOfString(Q,rho,temp[k],sigma,eps) = -1 then
            Add(arr_quiver, [str2, str1, temp[k]]);
          fi;
        fi;
      od;
    od;
  od;

  PrintTo("D:/IITK/Semester 3/Project/Codes/WeakZeroBridgesOutput.g", "wzb := ", arr_quiver, ";");

  #return arr_quiver;
end;
