var documenterSearchIndex = {"docs":
[{"location":"fct_index/#Index-des-fonctions","page":"Documentation des fonctions","title":"Index des fonctions","text":"","category":"section"},{"location":"fct_index/","page":"Documentation des fonctions","title":"Documentation des fonctions","text":"Documentation de toute les fonctions du package CSAD","category":"page"},{"location":"fct_index/","page":"Documentation des fonctions","title":"Documentation des fonctions","text":"Pages = [\"fct_index.md\"]","category":"page"},{"location":"fct_index/","page":"Documentation des fonctions","title":"Documentation des fonctions","text":"Modules = [CSAD]\nOrder   = [:function, :type]","category":"page"},{"location":"sujet_tp4/#Reconnaissance-de-chiffres-manuscrits-par-k-plus-proches-voisins","page":"Sujet TP4","title":"Reconnaissance de chiffres manuscrits par k plus proches voisins","text":"","category":"section"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"L’objectif de ce TP est de reconnaı̂tre des chiffres manuscrits d’une base de test à partir d’une base d’apprentissage  et de la méthode des k plus proches voisins. La base de données du MNIST sur les chiffres manuscrits comprend un ensemble  e 60 000 exemples d’apprentissage (database_train_images) et un ensemble de 10 000 exemples de test (database_test_images).  Les chiffres, dont quelques exemples sont représentés sur la figure 1, ont été normalisés et centrés dans une image de taille fixe 28 times 28 pixels. ","category":"page"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"(Image: )","category":"page"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"hspace*45cm Figure 1 – Exemples de chiffres manuscrits ","category":"page"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":" Chaque image est considérée comme un vecteur 1D de 28times28 = 784 coordonnées. On fournit les labels des ensembles d’apprentissage (database_train_labels) et de test (database_test_labels).","category":"page"},{"location":"sujet_tp4/#Exercice-1-:-méthode-des-k-plus-proches-voisins","page":"Sujet TP4","title":"Exercice 1 : méthode des k plus proches voisins","text":"","category":"section"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"En intelligence artificielle, la méthode des k plus proches voisins (k-ppv) est une méthode d'apprentissage supervisé. Dans ce cadre, on dispose d'une base de données d'apprentissage constituée de couples donnée-label . Pour estimer la sortie associée à une nouvelle entrée x, la méthode des k plus proches voisins consiste à prendre en compte (de façon identique) les k échantillons d'apprentissage dont l'entrée est la plus proche de","category":"page"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"la nouvelle entrée x, selon une distance à définir. L’algorithme 1 associé et un exemple (figure 2) sont donnés par la suite.  rule14cm20pt  Algorithm 1 Algorithme des k-ppv  INPUT : Data_A et Label_A ensemble de données et labels d'apprentissage, Data_T ensemble de test.     1.  Soit x in Data_T le point dont on cherche les k-ppv et d une distance, Calculer les distances d(xx_i)forall x_i inData_A     2.  Trouver les k points x_k in Data_A plus proches voisins de x au sens de la distance d      3.  Déterminer la classe C la plus représentée parmi les k plus proches voisins de x     4.  Assigner la classe C à la donnée x.  rule14cm05pt  (Image: )","category":"page"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"FIGURE 2- Exemple de classification k-ppv. L'échantillon de test (cercle vert) doit être classé soit dans la première classe des carrés bleus, soit dans la deuxième classe des triangles rouges. Si mathrmk=3 (cercle plein), il est assigné à la deuxième classe parce qu'il y a 2 triangles et seulement 1 carré à l'intérieur du cercle intérieur. Si mathrmk=5 (cercle en pointillés), il est assigné à la première classe (3 carrés contre 2 triangles à l'intérieur du cercle extérieur","category":"page"},{"location":"sujet_tp4/#Question-:","page":"Sujet TP4","title":"Question :","text":"","category":"section"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"En utilisant la distance euclidienne, complétez la fonction kppv.m permettant d’effectuer la classification par k-ppv sur un ensemble de test à partir d’un ensemble d’apprentissage et de leurs labels et en spécifiant le nombre k voisins que l’on cherche.","category":"page"},{"location":"sujet_tp4/#Exercice-2-:-évaluation-de-la-reconnaissance","page":"Sujet TP4","title":"Exercice 2 : évaluation de la reconnaissance","text":"","category":"section"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"En disposant des labels exacts des données de l’ensemble de test, l’évaluation de la bonne reconnaissance est réalisée par une matrice de confusion et par un taux d’erreur :","category":"page"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"La matrice de confusion est une matrice 10 times 10 dont l’élément générique d’indice (i j) est le nombre de vecteurs de classe correspondant à l’indice i qui ont été affectés à la classe correspondant à l’indice j par le processus de décision. Si la matrice de confusion est diagonale alors la reconnaissance est parfaite.\nle taux d’erreur correspond à un pourcentage défini par le nombre d’éléments hors diagonaux de la matrice de confusion divisé par le nombre total d’éléments testés","category":"page"},{"location":"sujet_tp4/#Questions-:","page":"Sujet TP4","title":"Questions :","text":"","category":"section"},{"location":"sujet_tp4/","page":"Sujet TP4","title":"Sujet TP4","text":"En utilisant les labels de l’ensemble de test database_test_labels, complétez kppv.m afin de rajouter le calcul de la matrice de confusion et le taux d’erreur.\nTestez l’algorithme pour k = 1 et k = 10 et calculez les taux d’erreur respectifs.","category":"page"},{"location":"sujet_tp1/#Espaces-de-représentation-des-couleurs","page":"Sujet TP1","title":"Espaces de représentation des couleurs","text":"","category":"section"},{"location":"sujet_tp1/#Exercice-1-Corrélations-et-contrastes-des-canaux-RVB","page":"Sujet TP1","title":"Exercice 1 - Corrélations et contrastes des canaux RVB","text":"","category":"section"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Le script exercice_1.jl  lit  l'image autumn.tif codée en RVB (Rouge, Vert, Bleu) et la stocke dans une matrice tridimensionnelle I de taille hauteur times largeur times 3  On peut séparer cette matrice en trois sousmatrices bidimensionnelles appelées canaux : mathrmR=mathrmI(mathrmi mathrmj 1) pour le canal rouge, mathrmV=mathrmI(mathrmi mathrmj 2) pour le canal vert, et  mathrmB=mathrmI(mathrmi mathrmj 3) pour le canal bleu. Chacun d'entre eux est composé d'entiers compris entre 0 et 255, qui représentent l'intensité lumineuse du pixel situé sur la ligne mathrmi et la colonne mathrmj.De part leur dénomination, chaque canal apporte donc une part de couleur à l'image, que ce soit du rouge, du vert ou du bleu.","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"En affichant les matrices mathrmImathrmR mathrmV et mathrmB sous forme d'images, on peut observer une forte corrélation entre les trois canaux, à part pour les régions très colorées (comme pour l'arbre situé au centre de l'image que l'on ne distingue plus dans le canal bleu par exemple). Dans une seconde fenêtre, les pixels sont considérés comme des points de mathbbR^3 que l'on affiche dans un repère dont les axes correspondent aux trois niveaux de couleur. Ils forment un nuage de forme très allongée suivant plusieurs axes simultanément, ce qui confirme l'observation précédente, à savoir que les trois canaux sont fortement corrélés.","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Complétez ce script de manière à calculer la matrice Sigma, notée par la suite Sigma, de variance/covariance des variables aléatoires correspondant aux trois canaux mathrmR mathrmV et mathrmB(text  matrice de taille  3 times 3)  [Attention] Rightarrow N'oubliez pas de centrer la matrice X des données et sans utiliser les fonctions var et cov de Julia qui appliquent des prétraitements aux données.","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"(Image: )","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Le coefficient de corrélation linéaire r_Y Z in-11 entre deux canaux Y et Z s'écrit sous la forme r_Y Z=sigma_Y Z left(sigma_Y * sigma_Zright) où sigma_Y et sigma_Z désignent respectivement l'écart-type de Y et de Z et sigma_Y Z la covariance entre Y et Z. D'autre part, la proportion de contraste dans le canal Y s'écrit sous la forme c_Y=sigma_Y^2 left(sigma_R^2+sigma_V^2+sigma_B^2right) où sigma_Y^2 désigne la variance de Y  Terminez l'écriture du script exercice_1.jl en calculant les coefficients de corrélation linéaire et les proportions de contraste de cette image (optionnel : utilisez la fonction @printf pour l'affichage).  [Attention] Rightarrow Ne confondez pas écart-type et variance.","category":"page"},{"location":"sujet_tp1/#Transmission-d’une-image-couleur-par-un-seul-canal","page":"Sujet TP1","title":"Transmission d’une image couleur par un seul canal","text":"","category":"section"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Le choix d’un espace de représentation des couleurs s’est posé lorsque les chaı̂nes de télévision sont passées à la couleur, dans les années 1960. En effet, il était inutile de transmettre trois canaux R, V et B aux utilisateurs (encore nombreux) possédant des téléviseurs “noir et blanc” ne pouvant afficher qu’un seul canal. Le principal critère étant de maximiser la proportion de contraste de ce canal unique, suffisait-il de transmettre un des trois canaux R, V ou B choisi arbitrairement ? Utilisez maintenant l’image gantrycrane.png, qui est une image à dominante bleue, dans le script exercice_1.jl et déduisez-en pourquoi cette idée n’aurait pas été acceptable. La conversion d’une image couleur en une image en niveaux de gris consiste en une réduction de dimension et on cherche donc effectuer une Analyse en Composantes Principales (ACP) sur l’image afin de récupérer un maximum d’information sur la première composante principale qui sera la nouvelle image en niveaux de gris","category":"page"},{"location":"sujet_tp1/#Exercice-2-Analyse-en-Composantes-Principales","page":"Sujet TP1","title":"Exercice 2 - Analyse en Composantes Principales","text":"","category":"section"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Effectuez une copie du script exercice1.jl, de nom exercice2.jl, que vous modifierez de manière à effectuer l’ACP des données contenues dans la matrice X.","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"La matrice Sigma de variance/covariance est symétrique et réelle. Elle admet donc une base orthonormée de vecteurs propres. Calculez ses valeurs propres et vecteurs propres à l’aide de l’appel à la fonction :[W,D] = eigen(Sigma). Les valeurs propres de Sigma sont stockées sur la diagonale de la matrice D. Triez  ces valeurs par ordre décroissant, à l’aide la fonction sortperm de Julia (avec l’option rev=true pour un tri décroissant). Les vecteurs propres de Sigma, appelés aussi vecteurs principaux dans le cas de l’ACP, sont stockés sur les trois colonnes de la matrice W. La matrice W est donc orthogonale (son inverse est égale à sa transposée) et constitue la matrice de passage entre le repère RVB et celui des composantes principales. Calculez la matrice C des composantes principales des pixels comme la projection de l’image de départ I par la matrice de passage W.  [Attention] Rightarrow N’oubliez pas de trier les colonnes de W pour qu’elles coı̈ncident à nouveau avec leurs valeurs propres de Sigma triées précédemment.  Affichez les trois colonnes de la matrice C sous forme d’images avec les fonctions reshape et size de Julia. Calculez les coefficients de corrélation linéaire et les proportions de contraste dans le nouveau repère ainsi que la proportion de contraste obtenue par projection sur la première composante principale. Commentez (on pourra également tenter d’analyser le nouveau nuage de points dans l’espace des trois composantes principales).","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"(Image: )","category":"page"},{"location":"sujet_tp1/#Exercice-3-Combinaisons-linéaires-des-trois-canaux-RVB","page":"Sujet TP1","title":"Exercice 3 - Combinaisons linéaires des trois canaux RVB","text":"","category":"section"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Si le critère retenu est celui du contraste, l'ACP est le meilleur moyen pour convertir une image couleur en une image en niveaux de gris. Cependant, la matrice de passage dépend complètement de l'image considérée. Cependant, il n'était pas envisageable, dans les années 1960, d'effectuer une ACP pour chaque image d'une séquence télédiffusée. C'est pourquoi une matrice de passage commune à toutes les images couleur a été choisie.","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"En utilisant les deux images autumn.tiff et pears.png dans le script exercice_2.jl, vérifiez que les coordonnées du vecteur propre de Sigma correspondant à sa plus grande valeur propre sont toutes trois très proches de 1  sqrt3 approx 05774. Cela voudrait dire que la maximisation de la proportion de contraste, c'est-à-dire de la variance, qui caractérise la première composante principale, s'obtient en donnant le même poids aux trois canaux. Bien que cette affirmation soit erronée lorsque la proportion de contraste differe beaucoup d'un canal à l'autre (faites le test sur l'image gantrycrane.png), elle est vraie en moyenne. Donner le même poids aux trois canaux revient à transformer une image couleur en une image en niveaux de gris de la manière la plus intuitive qui soit, à savoir :","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"hspace*25cm I_nvg=frac13(R+V+B)","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Pourtant, si l'on regarde en détail la fonction Gray de Julia, qui est spécifiquement conçue pour transformer une image mathrmRVB en une image en niveaux de gris, on remarquera qu'elle effectue une autre combinaison linéaire que la simple moyenne des trois canaux (cf. help rgb2gray):","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"hspace*25cm Y=02989 R + 05870 V + 01140 B","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"qui disymétrise les canaux mathrmR mathrmV et mathrmB, contrairement à (1) . Cela vient du fait que le système visuel humain n'est pas également sensible aux différentes fréquences lumineuses. En particulier, comme sa courbe de sensibilité est maximale dans le vert, le poids du canal V dans (2) est supérieur aux poids des deux autres canaux.","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"Effectuez une copie du script exercice_2.jl, de nom exercice_3.jl, que vous modifierez de manière à afficher sur une même figure les quatre images suivantes : l'image couleur d'origine, sa première composante principale, et les deux images correspondant aux combinaisons linéaires (1) et (2). Parmi les trois images en niveaux de gris, laquelle vous semble-t-elle présenter le meilleur contraste? Testez différentes images internes de Matlab: autumn.tif, gantrycrane.png, pears.png, coloredChips.png, etc","category":"page"},{"location":"sujet_tp1/","page":"Sujet TP1","title":"Sujet TP1","text":"(Image: ) Figure 3 – De gauche à droite : la 1 ère composante principale de l’image, la moyenne des 3 canaux, la combinaison linéaire proposée par Matlab.","category":"page"},{"location":"sujet_tp2/#Modélisation-paramétrique","page":"Sujet TP2","title":"Modélisation paramétrique","text":"","category":"section"},{"location":"sujet_tp2/#Exercice-1:-estimation-par-les-moindres-carrés-ordinaires","page":"Sujet TP2","title":"Exercice 1: estimation par les moindres carrés ordinaires","text":"","category":"section"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"À partir d’un ensemble de points dont la forme rappelle celle d’une ellipse, est-il possible de trouver l’ellipse qui passe << au plus près >> de ces points ?","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Ce genre de question se pose très souvent en analyse d’images. Il s’agit d’un problème d’estimation. Dans ce TP, vous allez tester plusieurs méthodes d’estimation des paramètres d’une ellipse.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Commencez par lancer le script Donnees.jl, qui affiche une ellipse tirée aléatoirement, ainsi que n points placés aléatoirement sur cette ellipse, dont chaque coordonnée est bruitée par un bruit additif gaussien.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"L’équation cartésienne d’une conique (ellipse, parabole, hyperbole) est une équation polynomiale de degré 2 :","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*25cm  alpha x^2+beta x y+gamma y^2+delta x+epsilon y+phi=0   hspace*15cm (1)","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Les six paramètres (alpha beta gamma delta epsilon phi) ne sont pas indépendants, puisque la conique ne change pas si ces six paramètres sont multipliés par un même facteur. Cela signifie qu’une conique possède cinq << degrés de liberté >>.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Les équations (1) forment un système linéaire homogène AB = 0, où B=alpha beta gamma delta epsilon phi^top et A est une matrice de taile n times 6. Pour éviter la solution << triviale >> widehatB=0, on peut imposer une contrainte linéaire sur les paramètre, par exemple alpha + gamma = 1 (comme une ellipse vérifie beta^2 - 4alpha gamma  0, il est impossible que alpha + beta = 0). Cette contrainte ajoute une équation linéaire non homogène au système des équation (1), qui n'admet donc plus la solution triviale widehatB=0.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Complétez le script exercice_1.jl par l’écriture de la fonction MCO, qui estime X par résolution approchée du nouveau système, au sens des moindres carrés ordinaires.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Remarque : on utilisera la fonction pinv pour la pseudo-inverse.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Nous vous fournissons le script maximum_vraisemblance.jl correspondant à l’estimation des paramètres de l’ellipse par le maximum de vraisemblance (cf TP1 de Statistiques du premier semestre). Vous constatez que l’estimation est bien plus fiable par les moindres carrés ordinaires que par le maximum de vraisemblance.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Vous pouvez reformuler le problème en ne considérant que cinq paramètres en éliminant, soit le alpha, soit le gamma et vérifier que la solution est la même à un facteur multiplicatif près.","category":"page"},{"location":"sujet_tp2/#Exercice-2:-estimation-d'une-transformation-sur-des-images","page":"Sujet TP2","title":"Exercice 2: estimation d'une transformation sur des images","text":"","category":"section"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"L’objectif est de reconstruire des images préalablement modifiées par une transformation non linéaire bruitée.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm (Image: )","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Soit I une image de taille n times m. Une transformation non linéaire notée T est réalisée sur chaque niveau de gris I_ij du pixel (i j) de l’image I. L’image modifiée après transformation est notée J, dont les éléments sont définis par :","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*2cm  forall i in1 ldots n forall j in1 ldots m quad J_i j=Tleft(alpha beta I_i jright)=e^-alpha t_i j+beta  hspace*15cm (2)","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"où (alpha beta) sont des paramètres réels.","category":"page"},{"location":"sujet_tp2/#Problème-aux-moindres-carrés-ordinaires","page":"Sujet TP2","title":"Problème aux moindres carrés ordinaires","text":"","category":"section"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"On dispose d’une partie de l’image modifiée par la transformation T avec un bruit additif aléatoire et de la partie de l’image originale correspondante.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 1. Écrivez la formulation matricielle du problème aux moindres carrés ordinaires (MCO) permettant d’estimer les paramètres (alpha beta) de la fonction T définie par l’équation (2).","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 2. Résolvez le problème aux moindres carrés ordinaires à partir des données Data et DataMod issus respectivement des images originales et modifiées (vars1 = matread(\"SG1.mat\")).","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 3. À partir des paramètres estimés et de l’image entière modifiée ImMod, reconstruisez l’image originale (issue de ImSG1.mat).","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 4. Estimez l’erreur aux moindres carrés (RMSE) entre l’image reconstruite et l’image originale.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 5. Essayez avec les autres jeux de données.","category":"page"},{"location":"sujet_tp2/#Problème-aux-moindres-carrés-totaux","page":"Sujet TP2","title":"Problème aux moindres carrés totaux","text":"","category":"section"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"On propose de résoudre ce même problème en utilisant les moindres carrés totaux et la décomposition en valeurs singulières (SVD).","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 1. écrivez le problème aux moindres carrés totaux.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 2. Résolvez le problème et reconstruisez l’image originale.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"Remarque : on utilisera la fonction svd.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 3. Estimez l'erreur aux moindres carrés (RMSE) entre l’image reconstruite et l’image originale. Comparez vos résultats avec les MCO.","category":"page"},{"location":"sujet_tp2/","page":"Sujet TP2","title":"Sujet TP2","text":"hspace*15cm 4. Imaginez des applications à ce bruitage d’images.","category":"page"},{"location":"#Tps-Analyse-de-Données","page":"Accueil","title":"Tps Analyse de Données","text":"","category":"section"},{"location":"","page":"Accueil","title":"Accueil","text":"Le package AnalyseDeDonnees constitue une solution des tps d'Analyse de Données pour l’année 2020-2021 de l'École INP-ENSEEIHT.","category":"page"},{"location":"#Auteurs-:-A.B-C.D","page":"Accueil","title":"Auteurs :  A.B C.D","text":"","category":"section"},{"location":"sujet_tp3/#Classification-bayésienne","page":"Sujet TP3","title":"Classification bayésienne","text":"","category":"section"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"L’objectif est de réaliser un classifieur bayésien permettant de classer les images de trois espèces de fleurs (ne recopiez pas les images, afin de préserver votre quota). Lancez le script recup_donnees.jl, qui affiche des images de pensées, d’œillets et de chrysanthèmes. Vous constatez que ces images n’ont pas toutes la même taille.","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"(Image: )","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"hspace*35cm FIGURE 1 - De gauche à droite : pensée, œillet, chrysanthème.","category":"page"},{"location":"sujet_tp3/#Exercice-1-Calcul-de-la-couleur-moyenne-d’une-image","page":"Sujet TP3","title":"Exercice 1 - Calcul de la couleur moyenne d’une image","text":"","category":"section"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Dans un premier temps, vous allez classer les images selon la couleur moyenne de chaque espèce de fleurs. Pour cela, les trois niveaux de couleur (R V B) in 0 255^3 , en chaque pixel de chaque image, sont d’abord transformés en niveaux de couleur normalisés (r v b), qui sont définis de la manière suivante :","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"hspace*25cm (r v b) = frac1max1R+V+B(RVB) ","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Le principal intérêt des niveaux de couleur normalisés est que deux valeurs parmi (r v b) permettent de déduire la troisième, puisque r+v+b = 1, sauf dans le cas exceptionnel où (r v b) = (0 0 0). Une image est donc caractérisée par les moyennes (barr barv barb), ou plus simplement par (barrbarv),  puisque barr+barv+barb=1, c’est-à-dire par un vecteur x = (barrbarv) in mathbbR^2 que l’on  appelle sa couleur moyenne. Compte tenu des différences de couleurs moyennes entre les trois espèces de fleurs,  on postule que ce vecteur suffira à les distinguer.","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"tip: Travail à effectuer\nÉcrivez la fonction couleur_moyenne, qui calcule la couleur moyenne d’une image, c’est-à-dire x^T = (barrbarv) dans un vecteur ligne,  sans oublier de convertir les niveaux de couleur (R V B) auformat float (pour manipuler des réels) et de les normaliser.","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Le script exercice_1.jl regroupe dans trois tableaux de données X_pensees, X_oeillets et X_chrysanthemes les valeurs moyennes calculées  avec la fonction précédente pour chaque groupe d’images. Il affiche ensuite les couleurs moyennes de l’ensemble des images de fleurs sous la forme de trois nuages de points de mathbbR^2 avec trois couleurs et symboles différents.","category":"page"},{"location":"sujet_tp3/#Question","page":"Sujet TP3","title":"Question","text":"","category":"section"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Au regard de cette figure, la couleur moyenne vous semble-t-elle une caractéristique suffisamment discriminante de ces trois espèces de fleurs ?","category":"page"},{"location":"sujet_tp3/#Exercice-2-Estimation-de-la-vraisemblance-de-chaque-espèce-de-fleurs","page":"Sujet TP3","title":"Exercice 2 - Estimation de la vraisemblance de chaque espèce de fleurs","text":"","category":"section"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Les trois nuages de points précédents peuvent être modélisés par des lois normales bidimensionnelles. Il est rappelé que la densité de probabilité d’une loi normale s’écrit, en dimension d :","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"hspace*25cm p(mathbfx)=frac1(2 pi)^d2(operatornamedet Sigma)^12 exp left(-frac12(mathbfx-mu)^top Sigma^-1(mathbfx-mu)right) hspace*20cm (1)      où:  hspace*15cm  mu désigne l'espérance (la moyenne) des vecteurs mathbfx in mathbbR^d mu=Emathbfx=frac1n mathbfx^top mathbf1_n      hspace*15cm  Sigma désigne la matrice de variance/covariance : Sigma=Eleft(mathbfx-mu)(mathbfx-mu)^topright=frac1nleft(mathbfx^cright)^top mathbfx^c ","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Dans le cadre bayésien, la vraisemblance de la classe omega_i associée à chaque type de fleur, qui est caractérisée par la moyenne mu_i et la matrice de variance/covariance Sigma_i peut être modélisée par une loi normale analogue à (1):   hspace*25cm pleft(mathbfxomega_iright)=frac1(2 pi)^d  2left(operatornamedet Sigma_iright)^1  2 exp left(-frac12left(mathbfx-mu_iright)^top Sigma_i^-1left(mathbfx-mu_iright)right) quad i in13 ","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Il faut donc estimer les paramètres mu_i et Sigma_i des trois classes correspondant aux trois espèces de fleurs.","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"tip: Travail à effectuer\nÉcrivez la fonction estimation_mu_Sigma permettant d’effectuer l’estimation empirique des paramètres d’une loi normale bidimensionnelle (d = 2) à partir d’une matrice de données X.","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Le script exercice_2.jl estime les paramètres mu_i et Sigma_i des trois classes omega_i correspondant aux trois espèces de fleurs, à partir des tableaux de données X_pensees, X_oeillets et X_chrysanthemes, puis superpose la vraisemblance de chaque classe (en perspective 3D) au nuage de points à partir duquel elle a été estimée.","category":"page"},{"location":"sujet_tp3/#Exercice-3-Classification-d’images-de-fleurs","page":"Sujet TP3","title":"Exercice 3 - Classification d’images de fleurs","text":"","category":"section"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Nous souhaitons maintenant prédire à quelle espèce de fleurs une image requête, mathbfx, doit être associée. Comme nous avons utilisé des données étiquetées (chacune des images étant associée à une espèce de fleurs), il s'agit de classification supervisée. Un premier type de classification consiste à affecter à mathbfx la classe omega_i qui maximise la vraisemblance pleft(mathbfx  omega_iright)  Il s'agit alors d'un classifieur par maximum de vraisemblance.","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"tip: Travail à effectuer\nModifiez le script exercice_3.jl, de manière à :partitionner le plan mathbbR^2 en trois parties correspondant aux trois classes de fleurs,\nles colorier en trois couleurs différentes associées à celles des nuages de points,\nafficher le pourcentage d’images bien classées sur l’ensemble des trois classes.","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Par ailleurs, la règle de Bayes donne l'expression suivante de la probabilité a posteriori pleft(omega_imathbfxright) c'est-à-dire de la probabilité pour que la classe omega_i contienne mathbfx :   hspace*35cm pleft(omega_i  mathbfxright)=fracpleft(mathbfxomega_iright) pleft(omega_iright)p(mathbfx) hspace*20cm (2) ","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Il semble naturel d'affecter à x la classe omega_i qui maximise p(omega_imathbfx)  Une telle classification est dite par maximum a posteriori (MAP). Sachant que le dénominateur p(mathbfx) de (2) est indépendant de omega_i il n'est pas nécessaire de le connaítre pour trouver le maximum des p(omega_imathbfx). En revanche, il est nécessaire de connaítre la probabilité a priori pleft(omega_iright) de chaque classe omega_i faute de quoi on fait généralement l'hypothèse que les classes sont équiprobables (l'estimateur par maximum a posteriori revient alors à un estimateur par maximum de vraisemblance).","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"tip: Travail à effectuer\nÉcrivez une variante exercice_3_bis.jl du script exercice_3.jl où, en jouant sur les probabilités a priori des trois classes que vous ajouterez afin de classifier par maximum a posteriori et vous essaierez de maximiser le pourcentage d’images correctement classées.","category":"page"},{"location":"sujet_tp3/#Pour-aller-plus-loin-(facultatif-)-Amélioration-du-classifieur","page":"Sujet TP3","title":"Pour aller plus loin (facultatif ) - Amélioration du classifieur","text":"","category":"section"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Même en jouant sur les probabilités a priori, le classifieur obtenu reste décevant, surtout pour pensées et les ceillets. En effet, l'observation attentive des images de ces deux espèces, dont les couleurs moyennes sont similaires, montre qu'elles ne sont pas structurées de la même façon : les pensées sont plus sombres au centre, c'est-à-dire au niveau du pistil, par rapport aux ceillets. Cela suggère de ne pas seulement calculer la couleur moyenne des images, mais de scinder chaque image en deux parties complémentaires: le centre C (notion à préciser) et le pourtour P (complémentaire de C ).","category":"page"},{"location":"sujet_tp3/","page":"Sujet TP3","title":"Sujet TP3","text":"Écrivez un script exercice_4.jl reprenant le principe du classifieur MAP de l'exercice 3, mais utilisant trois caractéristiques au lieu de deux pour décrire une image, à savoir le couple de valeurs (barr barv) calculées sur le pourtour P et la valeur barr calculée sur le centre C.","category":"page"}]
}
