direct_left := function(Q,rho,input_str,sigma,eps)
       local x,y,z,temp,output;
       if IsValidString(Q,rho,input_str,sigma,eps) = "Invalid String" then
               return "Invalid String";
       fi;

       output := IsValidString(Q,rho,input_str,sigma,eps);

       if output[1] = "Valid Zero Length String" then
               temp := Outgoing_Arrows(Q,output[2]);
               if input_str[output[3]+3] = '1' then
                       if Length(temp) = 1 and sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then
                               z := String(temp[1]);
                       elif Length(temp) = 2 then
                               if sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = -1 then
                                       z := String(temp[1]);
                               else
                                       z := String(temp[2]);
                               fi;
                       else z := "Cannot Perform The Operation";
                       fi;
                       return z;
               elif input_str[output[3]+3] = '-' then
                       if Length(temp) = 1 and sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then
                               z := String(temp[1]);
                       elif Length(temp) = 2 then
                               if sigma[SIntChar(String(temp[1])[1])-SIntChar('a')+1] = 1 then
                                       z := String(temp[1]);
                               else
                                       z := String(temp[2]);
                               fi;
                       else z := "Cannot Perform The Operation";
                       fi;
                       return z;
               fi;
       fi;

       if SIntChar(input_str[1]) > 96 then
               x := SIntChar(String(TargetOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[1])-SIntChar('a')+1]))[2])-SIntChar('0');
               if Length(Outgoing_Arrows(Q,x)) = 2 then
                       z := [String(Outgoing_Arrows(Q,x)[1])[1]];
                       Append(z, input_str);

                       if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then
                               z := [String(Outgoing_Arrows(Q,x)[2])[1]];
                               Append(z, input_str);
                               if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
                               fi;
                       fi;
               elif Length(Outgoing_Arrows(Q,x)) = 1 then
                       z := [String(Outgoing_Arrows(Q,x)[1])[1]];
                       Append(z, input_str);
                       if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
                       fi;
               else return "Cannot Perform The Operation";
               fi;

       else
               x := SIntChar(String(SourceOfPath(ArrowsOfQuiver(Q)[SIntChar(input_str[1])-SIntChar('A')+1]))[2])-SIntChar('0');
               if Length(Outgoing_Arrows(Q,x)) = 2 then
                       if SIntChar(String(Outgoing_Arrows(Q,x)[1])[1]) - SIntChar(input_str[1]) = 32 then y := String(Outgoing_Arrows(Q,x)[2])[1];
                       else
                               y := String(Outgoing_Arrows(Q,x)[1])[1];
                       fi;
                       z := [y];
                       Append(z, input_str);
                       if IsValidString(Q,rho,z,sigma,eps) = "Invalid String" then return "Cannot Perform The Operation";
                       fi;
                else
                    		return "Cannot Perform The Operation";
               	fi;
       		   fi;
       return z;
 end;
