"""
Sample module to show how packages are built
"""
module SolidGeometry

greet() = print("Hello World!") # Created by generate command

using LinearAlgebra

export Point2D, iscollinear, length

"""
 Point2D
```  
 x: Float64 x-cordinates
 y: Float64 y-cordinates
```
"""
struct Point2D
    x::Float64
    y::Float64
end

#Returns the point coincident tolerance value
let _epsilon = 1e-5
    global ϵ() = _epsilon
end

"""
```length(pA::Point2D, pB::Point2D)::Float64```

Compute the length of segment between `pA` and `pB`
"""
function length(pA::Point2D, pB::Point2D)
    x1, y1, x2, y2 = pA.x, pA.y, pB.x, pB.y
    dx, dy = x1 - x2, y1 - y2
    return sqrt(dx*dx+dy*dy)
end

∆(pA::Point2D, pB::Point2D, pC::Point2D) =
    0.5*det([pA.x pA.y 1; pB.x pB.y 1; pC.x pC.y 1])

L(pA::Point2D, pB::Point2D, pC::Point2D) =
    max(length(pA, pB), length(pB, pC), length(pC, pA))

"""
```iscollinear(pA::Point2D, pB::Point2D, pC::Point2D)::Bool```

report `true` when `pA::Point2D, pB::Point2D, pC::Point2D` are aligned
"""
function iscollinear(pA::Point2D, pB::Point2D, pC::Point2D)
    l = L(pA, pB, pC)
    # The longest length is too small if all the points
    # are coincident
    # This a special case to avoid divide by zero.
    l <= ϵ() && return true
    return 2∆(pA, pB, pC)/l <= ϵ()
end

end # module
