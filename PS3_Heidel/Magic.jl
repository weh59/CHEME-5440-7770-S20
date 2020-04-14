#given Flux.jl
include("Flux.jl")
using LinearAlgebra
using CSV

#import stoichometric matrix
stoichiometric_matrix = Matrix{Float64}(CSV.read("C:\\Users\\weh01\\Documents\\PS3_Heidel\\Stoich_Clean.csv", header=0))

(number_of_species,number_of_fluxes) = size(stoichiometric_matrix);
default_bounds_array = zeros(number_of_fluxes,2);

# maximization function
objective_coefficient_array = zeros(number_of_fluxes);

species_bounds_array = zeros(number_of_species,2);

#parameters given in problem statement for reactions
k_cat = [203;           ## E.C.6.3.4.5
        34.5;           ## E.C.4.3.2.1
         249;           ## E.C.3.5.3.1
        88.1;           ## E.C.2.1.3.3
        13.7;           ## E.C.1.14.13.39
        13.7;           ## E.C.1.14.13.39
        ];              ## untis 1/s

E = 0.01;                                           ## umol/gDW

f_cat = [4.67/(4.67+10)*14.9/(14.9+.614);           ## E.C.6.3.4.5
        1;                                          ## E.C.4.3.2.1
        .255/(.255/2.5);                            ## E.C.3.5.3.1
        1;                                          ## E.C.2.1.3.3
        1*.065/(.065+.03)*.255/(.255+2.5);          ## E.C.1.14.13.39
        1;                                          ## E.C.1.14.13.39
        ];                                          ## Park et. al.

v_max = 3600/10^3*E.*k_cat.*f_cat;  #mmol/gdW.hr

default_bounds_array[1:length(v_max),2] .= v_max;
## reversible transfer of metabolites involved in v5
default_bounds_array[(length(v_max)+1):end,2] .= 10;
default_bounds_array[(15:20),1] .= -10;

objective_coefficient_array[10] = -1;

optimize = (objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag, status_flag)=calculate_optimal_flux_distribution(stoichiometric_matrix, default_bounds_array, species_bounds_array, objective_coefficient_array);
optimized_flux = optimize[2];
max_urea_flux = optimized_flux[10];
println("maximum urea flux=", max_urea_flux)
