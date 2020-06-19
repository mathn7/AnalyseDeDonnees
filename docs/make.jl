using Documenter
using Analyse_donnees

makedocs(
    modules = [Analyse_donnees],
    sitename = "Analyse_donnees.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",            
            "Sujet" => "Sujet.md",
	        "Documentation des fonctions" =>"fct_index.md"
            ]
    )

deploydocs(repo = "github.com/mathn7/Analyse_de_donnees.git")
