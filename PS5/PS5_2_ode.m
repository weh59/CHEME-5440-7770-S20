tspan=0:0.1:10;
ca0 = 1;
cr0 = 10;
c0  = [ca0;cr0];

[t,c] = ode45('PS5_2',tspan,c0);  
ca = transpose(c(:,1));      
cb = transpose(c(:,2));

figure
plot(t,ca)
hold on
plot(t,cb)
xlabel('t')
ylabel('c')
legend('c_a','c_r')
