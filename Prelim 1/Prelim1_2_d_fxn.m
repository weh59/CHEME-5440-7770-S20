
function cdot = odefun(t,c)
% Given parameters
% global S
S = 100;
ax   = 0.039;
ay   = 0.0043;
bx   = 6.1;
by   = 5.7;
zx   = 0.000013;
xz   = 0.12;
xy   = 0.00079;   
yz   = 0.011;
nzx  = 2.32;
nyz  = 2;
nxy  = 2;
nxz  = 2;
dely = 1.05;
delz = 1.04;

cx_dt = (ax + bx*S)/(1 + S + (c(3)/zx)^nzx)   - c(1);
cy_dt = (ay + by*S)/(1 + S + (c(1)/xy)^nxy)   - dely*c(2);
cz_dt = 1/(1 + (c(1)/xz)^nxz + (c(2)/yz)^nyz) - delz*c(3);

cdot = [cx_dt;cy_dt;cz_dt];
end 