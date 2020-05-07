%nullclines PS5
clear all
ii =  0;
jj = 0;
a  = 10;
n  = 2;

for vv = 0:0.01:20;
    ii = ii + 1;
    u(ii) = a/(1 + vv^n);
end 
for uu = 0:0.01:20;
    jj = jj + 1;
    v(jj) = a/(1 + uu^n);
end
vv = 0:0.01:20;
uu = 0:0.01:20;

plot(u,vv)
hold on
plot(uu,v)
xlabel('u')
ylabel('v')
legend('eq1','eq2')

