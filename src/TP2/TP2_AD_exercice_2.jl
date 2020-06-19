# Chargement des donnees
using MAT
vars = matread("/home/ziaad/Documents/SN_S5/TP Analyse de Donnees/TP2/SG2.mat")
extract(vars)

n,m=size(ImMod)
n1,m1=size(DataMod);

fig,axes = subplots(1,2)   # create figure and axes
ax = axes[1]     # operate on subplot 1
ax[:imshow](Data');
axis("equal")

ax = axes[2]      # operate on subplot 2
ax[:imshow](DataMod')
axis("equal")
fig[:canvas][:set_window_title]("Partie image originale ,Partie image modifiee")
fig[:canvas][:draw]()   #" update the figure to draw if you're doing this in the REPL"


# Moindres carres ordinaires MCO
A=[-Data[:] ones(size(Data,1).*size(Data,2),1)];
B=log.(DataMod[:]);

#Solution
Gamma=pinv(A)*B
