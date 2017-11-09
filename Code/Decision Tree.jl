
# Takes a random matrix and labels and returns the optimal
# branch points per feature.
# Note: Also tracks the times where there were empty vectors
# being tested under mode.

using StatsBase

(n,d)=(10,4)  # Set dimensions
A=randn(n,d)  # Forms random matrix
y=rand([0,1],n)  # Forms random labels

minRule = zeros(d,2)  # Initialize branch points
X = zeros(n,1)  #Vector for sorted column
ycopy = y  # Copy of y to hold original

for j = 1:d  # For Each feature 'j'
    y = ycopy # Resets value of y to original position
    minerror = sum(y .!= mode(y))  #Find base accuracy
    X = A[:,j]  # Store the column of interest
    p = sortperm(X)  #Track the permutations
    y = y[p]  # Permute y
    X = X[p]  #Permute X
    for i = 1:n    # For each example 'i'
        t = X[i]   # Set threshold to the ith entry in X
        temp=y[X .> t]
        if isempty(temp)  #Test if we get the empty vector
            y_above=0
            print(-2,i,j)  # Print the pair that cause this error with a -2 before
        else
        y_above = mode(temp)  # Find above mode
        end
        temp = y[X .<= t]
        if isempty(temp)  # Test if we get the empty vector
            y_below=0
            print(-1,i,j)  # Print the pair that cause this error with a -1 before
        else
        y_below = mode(temp)  # Find below mode
        end
        yhat = fill(y_above,n)  # Classify each
        yhat[X .<= t] = y_below
        error=sum(yhat .!= mode(yhat))  # Count Hamming distance
        if error < minerror    # Store if it has the least error
            minerror = error
            minRule[j,:] = [j,t]
        end
    end
end
["Feature" "Branch point";
minRule]
