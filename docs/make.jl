using Documenter

makedocs(
    strict=true,
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",            
            "Sujet" => "Sujet.md"	        
		
            ]
    )

deploydocs(
    repo   = "github.com/mathn7/Analyse_de_donnees.git",
    branch = "gh-pages",
    devbranch = "master",
)
