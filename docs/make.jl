using Documenter

makedocs(
    sitename = "CSAD.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",            
            "Sujet TP2" => "Sujet_TP2.md",
	    "Documentation des fonctions" =>"fct_index.md"
            ]
    )

deploydocs(repo = "github.com/mathn7/Projet-CSAD.git")
