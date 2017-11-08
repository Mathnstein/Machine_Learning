
for i=1:4
    print("$i ")
end

for i ∈ [5,10, π]
    print(" $i ")
end

d=Dict("hi" => "bye","where" => "there")
for i in d
    print(i[2])
end

f=[x*y^2 for x in -1:1, y in 2:4]

i=0
while i<3
    print(" $i ")
    i=i+1
end

x=1
if x>0
    print("Great")
else 
    print("Nah")
end

function plus2(x)
    return x+2
end
plus2(5)

plus2(x)=x+2
plus2(5)

func(x,y)=x*y
func(2,y)

f=x->x+3

f(5)

π|>sin|>exp|>log,log(exp(sin(π)))

(exp∘sin)(π),exp(sin(π))

function logly(x,y=10)
    log(y,x)
end
logly(1),logly(1,10),logly(pi,e)

function logly(x; base=10)
    log(base,x)
end
logly(10,base=2),logly(10)

function logly(x::Real;base::Real=10)
    log(base,x)
end
logly(10,10)

function thumbsup(x)
    x+=1
end
y=1;
thumbsup(y)

function multiThumbsup(x)
    x[:]+=1
end
y=[1, 2, 3];
multiThumbsup(y)

thumbsup.([1,2,3,4]),thumbsup.([1 2; 3 4])

function duplicate(x)
    (x,x)
end
duplicate(1)

function f(x::Float64)
    x
end
function f(x::Int64)
    "$x is not a Float"
end
f(1.0000),f(2)

@code_native f(1.0)

?Val

Val(0)

"""
example(x)

This function returns the area of a circle with radius r, ``A=πr^2``

* Useful for being lazy
* Other things
# Arguments
* `r` : Radius
# Examples
julia> example(1)->
Area=π
"""
function example(r)
    π*r^2
end

?example

Pkg.status()

Pkg.update()



Pkg.add("SpecialFunctions")
using SpecialFunctions

airyai(8)

Pkg.clone("https://github.com/scheinerman/LatexPrint.jl")

using LatexPrint

lap(2//3)
lap(π)

Pkg.add("Plots")
Pkg.add("PyPlot")

using Plots

plotly(); plot(sin,0:.1:7)

gr(); plot(sin,0:.1:7)

pyplot(); plot(sin,0:0.1:7)

Plots.PyPlot.xkcd()

plot(sin,0:0.1:7)

histogram2d(rand(500,500),nbins=10)

scatter(rand(50),rand(50))

contour(-10:10,-10:10,(x,y)-> ((x+y*im)^2|>abs),fill=true)

heatmap([exp(-(x^2+y^2)) for x in -1:0.1:1,y in -1:0.1:1])


plotly(); surface([exp(-(x^2+y^2)) for x in -1:0.1:1,y in -1:0.1:1],aspectratio=1)

pyplot();
 anim= @animate for i in 1:50
    plot(x->sin(x*π*i),0:0.1:2*π)
    end

gif(anim,fps=3)

?gif

pyplot(); plot(sin,0:0.1:7,line=(:red,5,:dot))

plot(sin,0:0.1:1)
plot!(cos,0:0.1:1)
scatter!(rand(50),rand(50))

?scatter

using DataFrames

slideTime=DataFrames.readtable("slideTimes.csv",separator=';')

?directory
