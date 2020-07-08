# Projet CSAD
Projet du calcul scientifique et analyse des donnees


| **Documentation** | **Intégration continue** | **Julia** |
|:-----------------:|:------------------------:|:---------:|
|[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/Projet-CSAD/dev)|[![Build Status](https://travis-ci.com/mathn7/Projet-CSAD.svg?branch=master)](https://travis-ci.com/mathn7/Projet-CSAD)|[![](https://img.shields.io/github/v/release/JuliaLang/julia.svg)](https://docs.julialang.org)|


## Tester les scripts

### Prérequis

On utilise pour l'affichage le backend Pyplot de l'API Matplotlib de Python. Vous pouvez l'instaler sous MacOS, Windows et Linux avec les commandes suivantes :  

```
python -m pip install -U matplotlib
```
ou
```
python3 -m pip install -U matplotlib
```

### Tester le module CSAD

```julia
julia> ]
pkg> add https://github.com/mathn7/Projet-CSAD.git
(CSAD) pkg> test
```

si vous avez les sources en local, dans la racine (Projet-CSAD) tapez:
```julia
pkg> activate . # Activer l'environnement du module CSAD
    Activating environment at `.../Projet-CSAD/Project.toml`
(CSAD) pkg> test
```

### Afficher les sorties des scripts du Tp1
Dans la racine (Projet-CSAD) tapez :
```julia
julia> ]
pkg> activate .
julia> include("test/test_affichage_tp1.jl")
```
On teste avec l'image `automn.tiff` , pour changer d'image
il suffit de changer le path à la ligne 12 du script
``test_affichage_tp1.jl``

### Tester le TP3 avec affichage des tracés

```julia
julia> include("test/test_affichage_tp3.jl")
```
### Tester le TP4 avec affichage des résultats

```julia
julia> include("test/test_affichage_tp4.jl")
```
