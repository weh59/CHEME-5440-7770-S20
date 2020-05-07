
function cdot = odefun(t,c)
ror = 1;
rr  = 100;
roa = 100;
ra  = 5000;
da  = 30;
ca  = c(1);
cr  = c(2);
ca_dt = -da*ca + (roa+ra*ca^2)/(1+ca^2+cr^2);
cr_dt = -cr + (ror+rr*ca^2)/(1+ca^2);

cdot = [ca_dt;cr_dt];
end 