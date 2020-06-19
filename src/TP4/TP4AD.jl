#--------------------------------------------------------------------------
# ENSEEIHT - 1SN - Analyse de donnees
# TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
# TP4AD.m
#--------------------------------------------------------------------------
using MNIST

# "Chargement des images d'apprentissage et de test"
#load MNIST

#   database_train_images  " 60000x784  "
#   database_train_labels  " 60000x1    "
#   database_test_images   " 10000x784  "
#   database_test_labels   " 10000x1    "

DataA,labelA = traindata()
DataT,labelT = testdata()

DataA=transpose(DataA)
labelA=transpose(labelA)
DataT=transpose(DataT)
labelT=transpose(labelT)

# Choix du nombre de voisins
K = 10

# Initialisation du vecteur des classes
ListeClass = [i for i=1:K]

# Classement par aux k-ppv
Partition = kppv(DataA,DataT,labelA,K,ListeClass)
print("Partition est : " , Partition )
