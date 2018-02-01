
include("leastSquaresRBFL2.jl")
# Load X and y variable
lambda=1; sigma=1;
using JLD
data = load("nonLinear.jld")
(X,y,Xtest,ytest) = (data["X"],data["y"],data["Xtest"],data["ytest"])

# Compute number of training examples and number of features
(n,d) = size(X)

# Fit least squares model
model = leastSquaresRBFL2(X,y,lambda,sigma)

# Report the error on the test set
t = size(Xtest,1)
yhat = model.predict(Xtest)
testError = sum((yhat - ytest).^2)/t
@printf("TestError = %.2f\n",testError)

# Plot model
using PyPlot
figure()
plot(X,y,"b.")
plot(Xtest,ytest,"g.")
Xhat = minimum(X):.1:maximum(X)
Xhat = reshape(Xhat,length(Xhat),1) # Make into an n by 1 matrix
yhat = model.predict(Xhat)
plot(Xhat,yhat,"r")
ylim((-300,400))

include("leastSquaresRBFL2.jl")
# Load X and y variable
using JLD
data = load("nonLinear.jld")
(X,y,Xtest,ytest) = (data["X"],data["y"],data["Xtest"],data["ytest"])

# Compute number of training examples and number of features
(n,d) = size(X)

# Split into training and validation sets
floorN = floor(Int8,n/2)
Xtrain = X[1:floorN,:]
ytrain = y[1:floorN]
Xval = X[floorN+1:n,:]
yval = y[floorN+1:n]

(n,d) = size(Xval)

# Generate a range of values
range = -15:2
sigmavec = 2.0.^range
lambdavec = 2.0.^range
m = length(range)

valErrorMatrix = zeros(m,m)

# Create a model for each pair
for i = 1:m
    for j = 1:m
        lambda = lambdavec[i]
        sigma = sigmavec[j]
        
        # Fit least squares model
        model = leastSquaresRBFL2(Xtrain,ytrain,lambda,sigma)
        
        # Find lowest validation error
        t = size(Xval,1)
        yhat = model.predict(Xval)
        valErrorMatrix[i,j] = sum((yhat - yval).^2)/n
    end
end

# Find smallest validation error and choose that model
s = indmin(valErrorMatrix)
divisor = floor(Int8,s/m)
remainder = rem(s,m)
if remainder == 0
    sigma = sigmavec[divisor]
    lambda = lambdavec[m]
else
    sigma = sigmavec[divisor+1]
    lambda = lambdavec[remainder]
end
@printf("Best sigma= %f\n",sigma)
@printf("Best lambda= %f\n",lambda)
 
    
model = leastSquaresRBFL2(Xtrain,ytrain,lambda,sigma)

# Report the error on the test set
t = size(Xtest,1)
yhat = model.predict(Xtest)
testError = sum((yhat - ytest).^2)/t
@printf("TestError = %.2f\n",testError)

# Plot model
using PyPlot
figure()
plot(X,y,"b.")
plot(Xtest,ytest,"g.")
Xhat = minimum(X):.1:maximum(X)
Xhat = reshape(Xhat,length(Xhat),1) # Make into an n by 1 matrix
yhat = model.predict(Xhat)
plot(Xhat,yhat,"r")
ylim((-300,400))
