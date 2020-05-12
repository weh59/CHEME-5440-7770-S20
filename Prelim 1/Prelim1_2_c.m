% Prelim 1
clear all
% Given parameters
ax   = 1.5;
bx   = 5;
zx   = 0.4;
nzx  = 2.7;
xz   = 1.5;
nxz  = 2.7;
delz = 1;

%Determining Steady States
steady = 0;
unsteady = 0;
for x = 0:0.01:4;
    z = 1/(1+(x/xz)^nxz);

    syms S
    eqn1 = (ax+bx*S)/(1+S+(z/zx)^nzx) - x == 0;

    sol = vpasolve(eqn1, [S]);
    
    x_check = x + 0.01;
    z_check = 1/(1+(x_check/xz)^nxz);
    Steady_Check = (ax+bx*sol(1))/(1+sol(1)+(z_check/zx)^nzx) - (x_check);
    
        if Steady_Check < 0
            steady = steady + 1;
            x_steady(steady) = x;
            S_steady(steady) = sol(1);
        else
            unsteady = unsteady + 1;
            x_unsteady(unsteady) = x;
            S_unsteady(unsteady) = sol(1);
        end

end

scatter(S_steady,x_steady)
hold on
scatter(S_unsteady,x_unsteady)
xlabel('S')
ylabel('x')





