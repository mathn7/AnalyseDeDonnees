#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
# TP4AD.m
#--------------------------------------------------------------------------
using MAT
using ImageView
using Gtk.ShortNames
include("float_to_RGB.jl")

include("kppv.jl")

vars = matread("MNIST.mat")

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
Partition,~ = kppv(DataA,DataT,labelA,labelT,K,ListeClass)
print("Partition est : " , Partition )

Nt_test = length(Partition)
n = 28
if Nt_test <= 50

    nb_col = 5
    nb_lig = Integer(Nt_test/nb_col)
    gui = imshow_gui((2*n, 2*n), (nb_lig,nb_col))
    canvases = gui["canvas"]

    for i = 1:nb_lig
        for j = 1:nb_col
            im = reshape(DataT[(i-1)*nb_col + j, :], n, n)
            imshow(canvases[i,j],im) # a voir si y a une facon meilleure
            # title(['DataT ',num2str(k), ' - ', num2str(Partition(k))],'FontSize',15)
        end
    end
end
