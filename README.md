# Projet CSAD
Projet du calcul scientifique et analyse des donnees


| **Documentation** | **Intégration continue** | **Julia** |
|:-----------------:|:------------------------:|:---------:|
|[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/Projet-CSAD/dev)|[![Build Status](https://travis-ci.com/mathn7/Projet-CSAD.svg?branch=master)](https://travis-ci.com/mathn7/Projet-CSAD)|[![](https://img.shields.io/github/v/release/JuliaLang/julia.svg)](https://docs.julialang.org)|


# Comment Tester les scripts

# Dépendances à installer
Pour l'affichage on utilise Pyplot qui dépend de la
bibliothèque matplotlib de Python.
Il faut donc avoir Python et installer matplotlib.
Sous linux :
```linux
python -m pip install -U matplotlib
```
ou
```linux
python3 -m pip install -U matplotlib
```

## Activer le module
dans la racine (Projet-CSAD) tapez

```julia
julia> ]
pkg> activate .
(CSAD) pkg>
```

## Afficher les sorties des scripts du Tp1
##### Exercices 1 et 2
Décommentez la ligne 10 des script exercice_1.jl et exercice_2.jl
pour utiliser les bibliothèques d'affichage.
Dans la racine (Projet-CSAD) , vous chargez une image et
exécutez la fonction `affichages` du script exercice_1.jl et
`affichages_2` des scripts (exercice_1.jl et exercice_2.jl).

```julia
julia> Im = load("src/TP1/automn.tiff");
julia> include("src/TP1/exercice_1.jl")
julia> affichages(Im)
julia> include("src/TP1/exercice_2.jl")
julia> affichages_2(Im)
```
## Tester le TP3 avec affichage des figures
dans la racine du dossier contenant le module tapez :
```julia
julia> ]
pkg> activate .
julia> include("test/test_affichage_tp3.jl")
```
