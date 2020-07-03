#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
# TP4AD.m
#--------------------------------------------------------------------------
using MAT
#using ImageView
#using Gtk.ShortNames
using Plots


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
nb_col = 5
nb_lig = Integer(min(50,Nt_test)/nb_col)
plt = Plots.plot(
    axis=nothing,
    showaxis=false,
    layout = (nb_col,nb_lig)
)
#gui = imshow_gui((300,300), (nb_lig,nb_col))
#canvases = gui["canvas"]

for k = 1:min(50,Nt_test)
    im = RGB.(reshape(DataT[k, :], n, n))
    #if k%nb_col == 0
    #    imshow(canvases[Int(floor(k/nb_col)),nb_col],im); # a voir si y a une facon meilleure
    #else
    #    imshow(canvases[Int(floor(k/nb_col))+1,k%nb_col],im); # a voir si y a une facon meilleure
    #end
    #title(['DataT ',num2str(k), ' - ', num2str(Partition(k))],'FontSize',15)
    #println("DataT ",string(k), " - ", string(Partition[k]));
    Plots.plot!(plt[k], im, ratio=1,title="DataT $k - chif="*string(Partition[k]),titlefontsize=4)
end
#Gtk.showall(gui["window"]);
#print("")
plt
