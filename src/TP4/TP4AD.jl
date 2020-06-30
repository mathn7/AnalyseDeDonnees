#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
# TP4AD.m
#--------------------------------------------------------------------------
using MAT
using ImageView
using Gtk.ShortNames

include("kppv.jl")
# "Chargement des images d'apprentissage et de test"
datas = matread("src/TP4/MNIST.mat");

#   database_train_images  " 60000x784  "
#   database_train_labels  " 60000x1    "
#   database_test_images   " 10000x784  "
#   database_test_labels   " 10000x1    "

DataA = datas["database_train_images"]
labelA = datas["database_train_labels"]
DataT = datas["database_test_images"]
labelT = datas["database_test_labels"]

# Choix du nombre de voisins
K = 10

# Initialisation du vecteur des classes
ListeClass = collect(1:K)

# Classement par aux k-ppv
Partition,confusion,nb_erreurs = kppv(DataA,DataT,labelA,labelT,K,ListeClass)
println("Partition est : " , Partition )

Nt_test = length(Partition)
n = 28
if Nt_test <= 50

    nb_col = 5
    nb_lig = Integer(Nt_test/nb_col)
    gui = imshow_gui((300,300), (nb_lig,nb_col))
    canvases = gui["canvas"]

    #=for i = 1:nb_lig
        for j = 1:nb_col
            im = reshape(DataT[(i-1)*nb_col + j, :], n, n)
            imshow(canvases[i,j],im) # a voir si y a une facon meilleure
            # title(['DataT ',num2str(k), ' - ', num2str(Partition(k))],'FontSize',15)
        end
    end=#
    for k = 1:Nt_test
            im = reshape(DataT[k, :], n, n);
            if k%nb_col == 0
                imshow(canvases[Int(floor(k/nb_col)),k%nb_col+1],im); # a voir si y a une facon meilleure
                println("DataT ",string(k), " - ", string(Partition[k]));
            else
                imshow(canvases[Int(floor(k/nb_col))+1,k%nb_col],im); # a voir si y a une facon meilleure
                #title(['DataT ',num2str(k), ' - ', num2str(Partition(k))],'FontSize',15)
                println("DataT ",string(k), " - ", string(Partition[k]));
            end
    end
    Gtk.showall(gui["window"]);
    print("")
end
