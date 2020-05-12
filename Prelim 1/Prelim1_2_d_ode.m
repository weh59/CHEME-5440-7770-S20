clear all
tspan=0:0.1:50;
cx0 = 0;
cy0 = 0;
cz0 = 0;
c0  = [cx0; cy0; cz0];
counter = 0;

for S = [0.02, 10, 10^5];
    global S
    counter = counter + 1;
    [t,c] = ode45('Prelim1_2_d_fxn',tspan,c0);  
    cx(:,counter) = transpose(c(:,1)); 
end


semilogy(tspan,cx(:,1))
hold on
semilogy(tspan,cx(:,2))
hold on
semilogy(tspan,cx(:,3))
xlabel('t')
ylabel('x')
legend('S = 0.02','S = 10','S = 10^5')

