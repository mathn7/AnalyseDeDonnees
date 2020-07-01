# Application de l'ACP : les <<Eigenfaces>>
	### Calcul efficace des vecteurs propres principaux

Le travail de M. Turk et A. Pentland intitulé <<Eigenfaces>> for Recognition1et publié en 1991 dans la revue <<Journal of Cognitive Neuroscience >>(vol. 3, pp 71-86) constitue une des applications les plus intéressantes et populaires de l’ACP au domaine de la reconnaissance de forme. Il s’agit tout simplement d'appliquer l’ACP à partir de données de très grandes tailles : des images de visages.

## 1 Données manipulées
La figure 1 montre une base de n=9 visages présentant 3 personnes dans 3 positions différentes relativement à la caméra. Dans cet exemple, chaque image est de taille : 480 lignes×640 colonnes.Il est immédiat, par empilement des colonnes, de se ramener à la situation où chaque image est un vecteur xi∈Rp avec p=480×640=307200 composantes (niveaux de gris / pixels).

En adoptant les notations usuelles pour l’ACP, la base d’images forme un tableau de donnees X∈MR(n=9,p=307200) avec,en ligne i,le vecteur xTi∈Rp qui représente la iieme image de la base.L'individu moyen  ̄x∈Rp est le vecteur des moyennes arithmétiques des variables: il represente alors, tout simplement, la version <<vectorisée>>de l'image moyenne  ̄x=1n∑ni=1xi des images de la base.Cette image moyenne est montrée en haut et à gauche de la figure 3. Il est alors possible de centrer les données (c’est-`a-dire les images de la base) pour former le tableau centre Xc=X−1n ̄x>.
