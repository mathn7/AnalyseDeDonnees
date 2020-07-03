@doc doc"""
# TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins

# Syntaxe
```julia
[Partition,confusion,nb_erreurs] = kppv(DataA,DataT,labelA,labelT,K,ListeClass)
```
# Entrées :
   * **DataA**   : (Array{Float64,2}) données d'apprentissage
   * **DataT**   : (Array{Float64,2}) données de test
   * **labelA**  : (Array{Float64,2}) labels d'apprentissage
   * **labelT**  : (Array{Float64,2}) labels de test
   * **K**       : (Int64) nombre de voisins à prendre en compte
   * **ListeClass** : (Array{Intt64,2}) l'ensemble des classes
# Sorties:
   * **Partition**    : (Array{Intt64,2})  les classes des Nt_test premiers éléments de DataT
   * **confusion**    : (Array{Float64,2})  la matrice de confusion
   * **nb_erreurs**   : (Int64) nombre d'erreurs effectuées lors de la classification
"""
function kppv(DataA,DataT,labelA,labelT,K,ListeClass)

    Na= size(DataA)[1]
    Nt =size(DataT)[1]

    Nt_test =50; # À changer, pouvant aller de 1 jusqu'à Nt

    # Initialisation de la matrice de confusion pour comparer les resultats
    # obtenus avec l'etiquetage deja present dans 'labelT' pour les images tests
    nb_classes = length(ListeClass)
    confusion = zeros(nb_classes,nb_classes);

    # Initialisation du vecteur d etiquetage des images tests
    Partition = zeros(Int,Nt_test,1)

    # Initialisation du nombre d erreur de reconnaissance
    nb_erreurs = 0

    print("Classification des images test dans " ,string(nb_classes),"  classes ")
    println(" par la methode des ", string(K), " plus proches voisins:")

    # Boucle sur les vecteurs test de l ensemble de levaluation
    for i = 1:Nt_test

        println("image test n: ",string(i))

        # Calcul des distances entre les vecteurs de test
        # et les vecteurs d apprentissage [voisins]
        distance = sum((DataA - ones(Na,1)*DataT[i,:]').^2,dims=2);
        distance=distance[:];
        # On ne garde que les indices des K + proches voisins

        ind_kppv=sortperm(distance)
        ind_kppv=ind_kppv[1:K]

        # Comptage du nombre de voisins appartenant a chaque classe

        classes_kppv =labelA[ind_kppv]
        nech = zeros(nb_classes,1)
        for j = 1:nb_classes
            for k =1:length(classes_kppv)
                if classes_kppv[k] == ListeClass[j]
                    nech[j]=nech[j]+1
                end
            end
        end
        nech=nech[:]
        # Recherche de la classe contenant le maximum de voisins

        ind_max_kppv=findall(nech .== maximum(nech));

        # Si l image test a le plus grand nombre de voisins dans plusieurs
        # classes differentes, alors on lui assigne celle du voisin le + proche
        # sinon on lui assigne l unique classe contenant le plus de voisins

        if length(ind_max_kppv)>1
            classe_test = labelA[ind_kppv[1]]
        else
            classe_test = ListeClass[ind_max_kppv[1]]
        end

        # Assignation de letiquette correspondant à la classe trouvee au point
        # correspondant a la i-eme image test dans le vecteur 'Partition'
        Partition[i] = classe_test

        # Mise a jour de la matrice de confusion
        confusion[Int(labelT[i]+1), Int(classe_test+1)] = confusion[Int(labelT[i]+1), Int(classe_test+1)] + 1;

        # Mise a jour du nombre d'erreur
        if classe_test != labelT[i]
            nb_erreurs = nb_erreurs + 1;
        end

    end
    return Partition , confusion, nb_erreurs
end
