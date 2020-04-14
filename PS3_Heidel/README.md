CHEME 7770 PS3

Part a)
Determine the stoichometric array using Kegg to determien the equations and molecules in the problem. V5 was split into a forward and reversible reaction, this meant that there had to be two fluxes for water depending on which way V5 went.

Part b)
By multiplying the stoichometric array by the atomic array we can determine if the system is balanced. This was achieved by running Balance.jl and if the first 6 columns are zeros then it is balanced.

Part c)
Using flux.jl and magic.jl I was able to determine the optimal flux to be 1.24 mmol/g-Dw/hr. This is equal to 1.1 mol/L/hr.
