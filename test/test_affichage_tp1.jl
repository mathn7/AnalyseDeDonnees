using Markdown
using PyPlot, Plots, Gtk.ShortNames , ImageView , ImageMagick

include("../src/TP1/exercice_1.jl");
include("../src/TP1/exercice_2.jl");


# fonction
pause(text) = (print(stdout, text); read(stdin, 1); nothing)

#chargement de l'image de test
Im = load("src/TP1/automn.tiff");

println("Lancement des tests d'affichage ...")

pause("tapez entrée pour lancer l'exo 1")
affichages(Im)
println("\n")

pause("tapez entrée pour lancer l'exo 2")
affichages_2(Im)
println("\n")

pause("tapez entrée pour lancer l'exo 3")
include("../src/TP1/exercice_3.jl")
