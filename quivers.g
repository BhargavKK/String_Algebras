Lambda 2

Q := Quiver(4, [[1,2,"a"], [1,2,"b"], [2,3,"c"], [3,4,"d"], [3,4,"e"]]);
rho := [Q.b*Q.c, Q.c*Q.d];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];

X_1

Q := Quiver(2, [[1,2,"a"],[1,1,"b"],[2,2,"c"]]);
rho := [Q.b^2, Q.c^2, Q.b*Q.a*Q.c];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];

GP(2,2)

Q := Quiver(1, [[1,1,"a"],[1,1,"b"]]);
rho := [Q.a^2, Q.b^2, Q.a*Q.b, Q.b*Q.a];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];

GP(3,4)
Q := Quiver(1, [[1,1,"a"],[1,1,"b"]]);
rho := [Q.a^3, Q.b^4, Q.a*Q.b, Q.b*Q.a];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];

GP(2,3)

Q := Quiver(1, [[1,1,"a"],[1,1,"b"]]);
rho := [Q.a^2, Q.b^3, Q.a*Q.b, Q.b*Q.a];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];



Q := Quiver(3, [[1,2,"a"], [1,2,"b"], [2,3,"c"], [2,3,"d"]]);
rho := [Q.a*Q.d, Q.b*Q.c];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];


Q := Quiver(2, [[1,2,"a"], [1,2,"b"], [2,1,"c"], [2,1,"d"]]);
rho := [Q.a*Q.d, Q.b*Q.c, Q.c*Q.a, Q.d*Q.b, Q.d*Q.a];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];


Q := Quiver(8,[[2,1,"a"], [3,2,"b"],[4,3,"c"],[4,3,"d"],[5,2,"e"],[7,5,"f"],[6,5,"g"],[6,7,"h"],[7,8,"i"],[8,1,"j"]]);
rho := [Q.h*Q.i, Q.h*Q.f*Q.e*Q.a, Q.b*Q.a, Q.g*Q.e, Q.d*Q.b];
sigma := sigma_eps(Q,rho)[1];
eps := sigma_eps(Q,rho)[2];


N := Length(Joints(Q,rho,sigma,eps));
L := MaximumLengthOFDirectString(Q,rho,sigma,eps);
level := 2*L*N;
PrintTo("D:/IITK/Semester 3/Project/Codes/StringsLessThanOutput.g", "q := ", StringsLessThan(Q,rho,sigma,eps,level), ";");
PrintTo("D:/IITK/Semester 3/Project/Codes/BandsOutput.g", "b := ", Bands(Q,rho,sigma,eps,0,level), ";");
PrintTo("D:/IITK/Semester 3/Project/Codes/BandsRepresentativesOutput.g", "br := ", BandsRepresentatives(Q,rho,sigma,eps), ";");
IsDomestic(Q,rho,sigma,eps);

Q1 := WeakBridgeQuiver(Q,rho,sigma,eps);
Q2 := BridgeQuiver(Q,rho,sigma,eps);

WeakHalfBridges(Q,rho,sigma,eps);
HalfBridges(Q,rho,sigma,eps);
