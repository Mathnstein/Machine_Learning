
include("misc.jl")

function rbfBasis(X,Y,sigma)
    # Take matrix and create Gaussian Distance matrix
    (n,d) = size(X)
    distances = distancesSquared(X,Y)
    Gauss = exp.(-distances/(2*sigma^2))
    return Gauss
end
