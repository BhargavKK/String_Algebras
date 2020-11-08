WeakBridgeQuiver := function(Q,rho,sigma,eps)
  local i,j,k,arr_quiver,arr_quiver1,len,j1,j2,temp,Q1;
  if IsDomestic(Q,rho,sigma,eps) = false then
    return 0;
  fi;

  Read("D:/IITK/Semester 3/Project/Codes/BandsRepresentativesOutput.g");

  arr_quiver := [];
  arr_quiver1 := [];
  len := Length(br);
  for i in [1..len] do
    for j in [1..len] do
#      if i <> j then
        j1 := SIntChar(String(TargetOfArrow(Q,br[j][1]))[2]) - SIntChar('0');
        j2 := SIntChar(String(SourceOfArrow(Q,br[i][Length(br[i])]))[2]) - SIntChar('0');
        temp := BFS_TwoVertices(Q,rho,j1,j2,sigma,eps);   #make changes
        for k in [1..Length(temp)] do
          if IsValidString(Q,rho,Concatenation(br[i], temp[k], br[j]),sigma,eps) = "Valid String" then
            Add(arr_quiver, [j,i,temp[k]]);
            Add(arr_quiver1, [br[j],br[i],temp[k]]);
          fi;
        od;
#      fi;
    od;
  od;
  PrintTo("D:/IITK/Semester 3/Project/Codes/WeakBridgeQuiverArrowsOutput.g", "wb := ", arr_quiver1, ";", "wb1 := ", arr_quiver, ";");
  Q1 := Quiver(len, arr_quiver);
  return Q1;
end;
