CyclicPermutationOfABand := function(Q,rho,band,sigma,eps)
	local array, temp, i,j;
	array := [];
	for i in [1..Length(band)] do
		Append(array, [0]);
	od;
	for i in [1..Length(band)] do
		temp := band[1];
		for j in [1..Length(band)-1] do
			band[j] := band[j+1];
		od;
		band[j+1] := temp;
		array[i] := Concatenation(band,"");
	od;
	return array;
end;
