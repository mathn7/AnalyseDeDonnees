#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
# TP4AD.m
#--------------------------------------------------------------------------
using MAT

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
ListeClass = [i for i=1:K]

# Classement par aux k-ppv
Partition,~ = kppv(DataA,DataT,labelA,labelT,K,ListeClass)
print("Partition est : " , Partition )
