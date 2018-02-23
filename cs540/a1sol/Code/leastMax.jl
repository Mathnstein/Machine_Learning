using MathProgBase
using GLPKMathProgInterface
function leastMax(X,y)
    (n,d) = size(X)
    # Add a bias
    Z = [ones(n,1) X]
    (n,d) = size(Z)

    # Find regression weights using linprog
    c = [zeros(d,1); 1]
    c=vec(c)
    A = [ -Z -ones(n,1) ; Z -ones(n,1)]
    uppervec = [-y;y]
    uppervec = vec(uppervec)
    lowervec = -Inf*ones(2*n,1)
    lowervec = vec(lowervec)
    lowerbound = -Inf*ones(1+d,1)
    lowerbound = vec(lowerbound)
    upperbound = Inf*ones(1+d,1)
    upperbound = vec(upperbound)

    solution = linprog(c,A,lowervec,uppervec,lowerbound,upperbound, GLPKSolverLP())
    w = solution.sol[1:d]

	# Make linear prediction function
	predict(Xtilde) = [ones(size(Xtilde,1),1) Xtilde]*w

	# Return model
	return LinearModel(predict,w)
end
