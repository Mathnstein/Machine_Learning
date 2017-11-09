
using StatsBase

A=[ .4 .1 .2;
    .2 .6 .4;
    .3 .8 0;
    .8 .1 1;
    1 .5 1;
    0 0 .8;]
y=[1;0;1;1;1;0]

(n,d) = size(A)  # Get dimensions 
minerror = sum(y .!= mode(y))  #Find base accuracy
minRule = []  # Initialize branch point

for j = 1:d  # For Each feature 'j'
    p = sortperm(A[:,j])
    y = y[p]
    A[:,j] = A[p,j]
    for i = 1:n    # For each example 'i'
        t = A[i,j]   # Set threshold to [i,j]
        temp=y[A[:,j] .> t]
        if isempty(temp)  #Test if we get the empty vector
            y_above=0
            print(i,j)
        else
        y_above = mode(temp)  # Find above mode
        end
        temp = y[A[:,j] .<= t]
        if isempty(temp)  # Test if we get the empty vector
            y_below=0
            print(i,j)
        else
        y_below = mode(temp)  # Find below mode
        end
        yhat = fill(y_above,n)  # Classify each
        yhat[A[:,j] .<= t] = y_below
        error=sum(yhat .!= mode(yhat))  # Count Hamming distance
        if error < minerror    # Store if it has the least error
            minerror = error
            minRule = [j t]
        end
    end
end
minRule
