    if Base.HOME_PROJECT[] !== nothing
        # JuliaLang/julia/pull/28625
        Base.HOME_PROJECT[] = abspath(Base.HOME_PROJECT[])
    end

    using Documenter, SolidGeometry

    makedocs(
        format = Documenter.HTML(),
        modules = [SolidGeometry],
        sitename = "SolidGeometry",
        pages = [
            "README.md",
            "API Reference" => "index.md"
        ]
    )

    deploydocs(
        repo   = "github.com/cvdlab/SolidGeometry.git",
    )
