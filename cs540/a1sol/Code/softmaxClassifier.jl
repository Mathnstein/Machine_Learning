
include("findMin.jl")
function softmaxReg(X,y)
    # Set up dimensions
    (n,d) = size(X)
    k = maximum(y)
    W = zeros(d,k)
    
    funObj(W) = softmaxObj(W[:],X,y)
    W[:] = findMin(funObj,W[:],verbose=false,derivativeCheck=true)
    W=reshape(W,d,k)

	# Make prediction from maximum over each row
	predict(Xhat) = maxRow(Xhat*W)
    

	# Return model
	return LinearModel(predict,W)
end

function maxRow(X)
    n= size(X,1)
    labels = []
    for i= 1:n
        (maxprob,nextlabel) = findmax((X)[i,:])
        labels = append!(labels, nextlabel)
    end
    return labels
end


function softmaxObj(W,X,y)
    # Parameter input can be a vector
    (n,d) = size(X)
    k = maximum(y)
    W = reshape(W,d,k)
    
    # Compute the function value
    f = 0
    for i = 1:n
        f = f-W[:,y[i]]'*X[i,:]
    end
    f = f+sum(log.(sum(exp.(X*W),2)))
    
    # Gradient
    g=zeros(d,k)
    for j = 1:k
        for i = 1:n
            if j == y[i]
                g[:,j] = g[:,j]-X[i,:]
            end
            g[:,j] = g[:,j]+X[i,:]*exp(W[:,j]'*X[i,:])./(sum(exp.(X*W),2)[i])
        end
    end
    g=g[:]
    return (f,g)
end