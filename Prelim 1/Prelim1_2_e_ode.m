clear all

S    = 1000;
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


syms x y z
eqn = [(ax + bx*S)/(1 + S + (z/zx)^nzx)   - x        == 0;
       (ay + by*S)/(1 + S + (x/xy)^nxy)   - dely*y  == 0;
       1/(1 + (x/xz)^nxz + (y/yz)^nyz)    - delz*z  == 0];
sol = vpasolve(eqn, [x y z]);

tspan=0:0.1:100;
%fill in after solve
cx0 = double(sol.x);
cy0 = double(sol.y);
cz0 = double(sol.z);
c0  = [cx0; cy0; cz0];
c_75 = c0.*0.75;
c_125 = c0.*1.25;


[t,c] = ode45('Prelim1_2_d_fxn',tspan,c0);  
cz_norm = transpose(c(:,3)); 

[t,c] = ode45('Prelim1_2_d_fxn',tspan,c_75);  
cz_low = transpose(c(:,3)); 

[t,c] = ode45('Prelim1_2_d_fxn',tspan,c_125);  
cz_high = transpose(c(:,3)); 


semilogy(tspan,cz_norm)
hold on
semilogy(tspan,cz_low)
hold on
semilogy(tspan,cz_high)
xlabel('t')
ylabel('z')
legend('normal','lower','higher')
title('S initial = 1000')

