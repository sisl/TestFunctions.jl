"""
    TestFunctions.jl

A collection of test functions for evaluating optimization algorithms.  Excerpted from Appendix B of:
Kochenderfer and Wheeler, "Algorithms for Optimization", MIT Press, 2019 (forthcoming)
"""
module TestFunctions

export 
    ackley,
    booth,
    branin,
    flower,
    michalewicz,
    rosenbrock,
    wheeler,
    circle
    

"""
    ackley(x, a=20, b=0.2, c=2π)

Ackley's function.  N-D.
"""
function ackley(x, a=20, b=0.2, c=2π)
    d = length(x)
    return -a*exp(-b*sqrt(sum(x.^2)/d)) -
        exp(sum(cos.(c*xi) for xi in x)/d) + a + e
end

"""
    booth(x)

Booth's function. 2D.
"""
booth(x) = (x[1]+2x[2]-7)^2 + (2x[1]+x[2]-5)^2

"""
    branin(x; a=1, b=5.1/(4π^2), c=5/π, r=6, s=10, t=1/(8π))

Branin Function. 2D. 
"""
function branin(x; a=1, b=5.1/(4π^2), c=5/π, r=6, s=10, t=1/(8π))
    return a*(x[2]-b*x[1]^2+c*x[1]-r)^2 + s*(1-t)*cos(x[1]) + s
end

"""
    flower(x; a=1, b=1, c=4)

Flower function. 2D. 
"""
function flower(x; a=1, b=1, c=4)
    return a*norm(x) + b*sin(c*atan2(x[2],x[1]))
end

"""
    michalewicz(x; m=10)

Michaelewicz function.  N-D.
"""
function michalewicz(x; m=10)
    return -sum(sin(v)*sin(i*v^2/π)^(2m) for
                (i,v) in enumerate(x))
end

"""
    rosenbrock(x; a=1, b=5) 

Rosenbrock's banana function. 2-D.
"""
rosenbrock(x; a=1, b=5) = (a-x[1])^2 + b*(x[2] - x[1]^2)^2

"""
    wheeler(x, a=1.5)

Wheeler's ridge. 2-D.
"""
wheeler(x, a=1.5) = -exp(-(x[1]*x[2] - a)^2 - (x[2]-a)^2)

"""
    circle(x)

Circle function. Multiobjective.  2-D.
"""
function circle(x)
    θ = x[1]
    r = 0.5 + 0.5*(2x[2]/(1+x[2]^2))
    y1 = 1 - r*cos(θ)
    y2 = 1 - r*sin(θ)
    return [y1, y2]
end

end # module
