using MAT
using Plots
using Markdown
include("kppv.jl")

"""
**TP4 - Reconnaissance de chiffres**

Reconnaissance de chiffres manuscrits par k plus proches voisins

"""

# Chargement des images d'apprentissage et de test
dataset = matread("src/TP4/MNIST.mat");

#   database_train_images  " 60000x784  "
#   database_train_labels  " 60000x1    "
#   database_test_images   " 10000x784  "
#   database_test_labels   " 10000x1    "

DataA = dataset["database_train_images"]
labelA = dataset["database_train_labels"]
DataT = dataset["database_test_images"]
labelT = dataset["database_test_labels"]

# Choix du nombre de voisins
K = 10

# Initialisation du vecteur des classes
ListeClass = collect(1:K)

Nt_test = 100
# Classement par aux k-ppv
Partition,confusion,nb_erreurs = kppv(true,DataA,DataT,labelA,labelT,K,ListeClass,Nt_test)

println("Partition est : " , Partition )
n = 28
plt = Plots.plot(
    axis = nothing,
    showaxis=false,
    layout = (5,10) 
)

for k = 1:min(50,Nt_test)
    im = RGB.(reshape(DataT[k, :], n, n))
    Plots.plot!(plt[k], im, ratio=1,title="DataT $k - chif="*string(Partition[k]),titlefontsize=4)
end
display(plt)