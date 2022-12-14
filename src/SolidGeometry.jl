module SolidGeometry

using NearestNeighbors
using DataStructures
using IntervalTrees
using Triangulate
using SparseArrays
using LinearAlgebra
using Distributed
using LinearAlgebraicRepresentation
Lar = LinearAlgebraicRepresentation

export Lar, Points, Cells, Chain, ChainOp, ChainComplex, LAR, LARmodel, GComplex

"""
    Points = Matrix{Number}

Alias declation of LAR-specific data structure.
Dense `Array{Number,2,1}` ``M x N`` to store the position of *vertices* (0-cells) of a *cellular complex*. The number of rows ``M`` is the dimension of the embedding space. The number of columns ``N`` is the number of vertices.
"""
const Points = Matrix


"""
    Cells = Vector{Vector{Int}}

Alias declation of LAR-specific data structure.
Dense `Array` to store the indices of vertices of `P-cells` of a cellular complex. The linear space of `P-chains` is generated by `Cells` as a basis. Simplicial `P-chains` have ``P+1`` vertex indices for `cell` element in `Cells` array. Cuboidal `P-chains` have ``2^P`` vertex indices for `cell` element in `Cells` array. Other types of chain spaces may have different numbers of vertex indices for `cell` element in `Cells` array. 
"""
const Cells = Vector{Vector{Int}}


"""
    Chain = SparseArrays.SparseVector{Int8,Int}

Alias declation of LAR-specific data structure.
Binary `SparseVector` to store the coordinates of a `chain` of `N-cells`. It is `nnz=1` with `value=1` for the coordinates of an *elementary N-chain*, given by a singleton *N-chain*. 
"""
const Chain = SparseArrays.SparseVector{Int8,Int}


"""
    ChainOp = SparseArrays.SparseMatrixCSC{Int8,Int}

Alias declation of LAR-specific data structure.
`SparseMatrix`, in *`Compressed Sparse Column`* format, to contain the coordinate representation of an operator between linear spaces of `P-chains`. Operators ``P-Boundary : P-Chain -> (P-1)-Chain`` and ``P-Coboundary : P-Chain -> (P+1)-Chain`` are typically stored as `ChainOp` with elements in ``{-1,0,1}`` or in ``{0,1}``, for *signed* and *unsigned* operators, respectively. 
"""
const ChainOp = SparseArrays.SparseMatrixCSC{Int8,Int}


"""
    ChainComplex = Vector{ChainOp}

Alias declation of LAR-specific data structure. It is a
1-dimensional `Array` of `ChainOp` that provides storage for either the *chain of boundaries* (from `D` to `0`) or the transposed *chain of coboundaries* (from `0` to `D`), with `D` the dimension of the embedding space, which may be either ``R^2`` or ``R^3``. 
"""
const ChainComplex = Vector{ChainOp}


"""
    LAR = Pair{Points,Vector{Cells}}

Alias declation of LAR-specific data structure.
`LARmodel` is a pair (*Geometry*, *Topology*), where *Geometry* is stored as `Points`, and *Topology* is stored as `Array` of `Cells`. The number of `Cells` values may vary from `1` to `N+1`.
"""
const LAR = Pair{Points,Vector{Cells}}


"""
    GComplex = Pair{Points, ChainComplex}

Alias declation of evaluated LAR data structure. 
`GComplex` is a pair (*Geometry*, *Topology*), where *Geometry* is stored as `Points`, and *Topology* is stored as `ChainComplex`. 
"""
const GComplex = Tuple{Points, ChainComplex}


include("./largrid.jl")


end # SolidGeometry
