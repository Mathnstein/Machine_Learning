
include("misc.jl")
include("rbfBasis.jl")

function leastSquaresRBFL2(X,y,lambda,sigma)

	# Add bias column
	(n,d) = size(X)
	Z = rbfBasis(X,X,sigma)
    Z = [ones(n,1) Z]

	# Find regression weights minimizing squared error
	w = (Z'*Z+lambda*eye(n+1))\(Z'*y)

	# Make linear prediction function
	predict(Xtilde) = [ones(size(Xtilde,1),1) rbfBasis(Xtilde,X,sigma)]*w

	# Return model
	return LinearModel(predict,w)
end

