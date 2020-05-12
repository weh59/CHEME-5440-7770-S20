clear all 
%Prelim 1 Problem 1c

n    = [19;21;41;67;86;93;93];               %mRNA/cell
IPTG = [0;0.0005;0.005;0.012;0.053;0.216;1]; %mM
Nc   = 10^8;                                 %number of cells/mL
V    = 1;                                    %mL
m    = 280*10^-15;                           %gDW/cell

nmol_gDW = n/(6.02*10^23)*10^9*V/m;

Kx = .55;
K  = .4;
nn = 1.5;
W1 = 0.26;
W2 = 520;
counter = 0;
%Fitting Line
for I_guess = 0:.0001:10;
    counter = 1 + counter;
    f_guess(counter) = Kx*(W1+W2*(I_guess^nn/(K^nn+I_guess^nn)))/(1+(W1+W2*(I_guess^nn/(K^nn+I_guess^nn))));
end
I_guess = 0:0.0001:10;

%logx = log(IPTG)
%logy = log(nmol_gDW./(1-nmol_gDW))
%plot(logx,logy)
scatter(IPTG,nmol_gDW)
set(gca,'xscale','log')
hold on
plot(I_guess,f_guess)