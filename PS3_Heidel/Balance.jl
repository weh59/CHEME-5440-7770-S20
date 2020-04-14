using CSV

#import stoichiometric and atom matrices from csv files
S = Matrix{Float64}(CSV.read("C:\\Users\\weh01\\Documents\\PS3_Heidel\\Stoich_Clean.csv", header=0))
A = Matrix{Float64}(CSV.read("C:\\Users\\weh01\\Documents\\PS3_Heidel\\Atom_Clean.csv", header=0))

#determine if there is atomic balance in the cycle
Balance = A*S
