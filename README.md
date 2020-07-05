# Projet CSAD
Projet du calcul scientifique et analyse des donnees


| **Documentation** | **Intégration continue** | **Julia** |
|:-----------------:|:------------------------:|:---------:|
|[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/Projet-CSAD/dev)|[![Build Status](https://travis-ci.com/mathn7/Projet-CSAD.svg?branch=master)](https://travis-ci.com/mathn7/Projet-CSAD)|[![](https://img.shields.io/github/v/release/JuliaLang/julia.svg)](https://docs.julialang.org)|


## Tester les scripts

### Dépendances à installer

On utilise pour l'affichage le backend Pyplot de l'API Matplotlib de Python. Sous MacOS, Windows ou Linux, vous pouvez l'instaler avec les commandes suivantes :  

```
python -m pip install -U pip
python -m pip install -U matplotlib
```
ou
```
python3 -m pip install -U pip
python3 -m pip install -U matplotlib
```

### Tester sans affichage

```julia
julia> ]
pkg> add https://github.com/mathn7/Projet-CSAD.git
(CSAD) pkg> test
```
si vous avez les sources en local, dans la racine du dossier contenant le module tapez:

```julia
julia> ]
pkg> activate . # Activer l'environnement du module CSAD
(CSAD) pkg> test
```

### Afficher les sorties des scripts du Tp1
##### Exercices 1 et 2
Décommentez la ligne 10 des script exercice_1.jl et exercice_2.jl pour utiliser les bibliothèques d'affichage.
Dans la racine (Projet-CSAD), chargez une image et exécutez la fonction `affichages` du script exercice_1.jl et
`affichages_2` des scripts (exercice_1.jl et exercice_2.jl).

```julia
julia> Im = load("src/TP1/automn.tiff");
julia> include("src/TP1/exercice_1.jl")
julia> affichages(Im)
julia> include("src/TP1/exercice_2.jl")
julia> affichages_2(Im)
```

### Tester le TP3 avec affichage des tracés
dans la racine du dossier contenant le module tapez :
```julia
julia> ]
pkg> activate . 
julia> include("test/test_affichage_tp3.jl")
```
