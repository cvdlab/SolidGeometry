using Test
using SolidGeometry

@testset "iscollinear" begin
    @test iscollinear(Point2D(0, 0), Point2D(10, 0), Point2D(20, 2ϵ()))
    @test !iscollinear(Point2D(0, 0), Point2D(10, 0), Point2D(20, 3ϵ()))
    @test  iscollinear(Point2D(10, 0), Point2D(10, 0), Point2D(20, 3ϵ()))
end