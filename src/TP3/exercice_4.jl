%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de donnees
% TP3 - Classification bayesienne
% exercice_4.m
%--------------------------------------------------------------------------

clear
close all
clc

% Chargement des donnees
load donnees

azimuth = -72;
elevation = 42;

%% Calcul des vecteurs de moyenne des images de fleurs

% Couleur moyenne de chaque image de pensee
X_pensees = single(zeros(nb_images_pensees,3));
for i = 1:nb_images_pensees
	im = eval(['pe' num2str(i)]);
	X_pensees(i,:) = moyenne_ex4(im);
end

% Couleur moyenne de chaque image d'oeillet
X_oeillets = single(zeros(nb_images_oeillets,3));
for i = 1:nb_images_oeillets
	im = eval(['oe' num2str(i)]);
	X_oeillets(i,:) = moyenne_ex4(im);
end

% Couleur moyenne de chaque image de chrysantheme
X_chrysanthemes = single(zeros(nb_images_chrysanthemes,3));
for i = 1:nb_images_chrysanthemes
	im = eval(['ch' num2str(i)]);
	X_chrysanthemes(i,:) = moyenne_ex4(im);
end

%% Affichage des couleurs moyennes des images de fleurs

% Vecteur r et v pour les axes
pas = 0.0025;
r = 0.35:pas:0.60;
v = 0.2:pas:0.45;

nb_r = length(r);
nb_v = length(v);

figure('Name','Couleurs moyennes des images',...
       'Position',[0.1*L,0.1*H,0.5*L,0.8*H])
   
    hold on
    plot3(X_pensees(:,1),X_pensees(:,2),X_pensees(:,3),'r*','MarkerSize',10,'LineWidth',2)
    plot3(X_oeillets(:,1),X_oeillets(:,2),X_oeillets(:,3),'go','MarkerSize',10,'LineWidth',2)
    plot3(X_chrysanthemes(:,1),X_chrysanthemes(:,2),X_chrysanthemes(:,3),'b+','MarkerSize',10,'LineWidth',2)
    
    grid on
    axis equal ij
    axis([r(1) r(end) v(1) v(end)])
    hx = xlabel('$\bar{r}_p$','FontSize',20);
    set(hx,'Interpreter','Latex')
    hy = ylabel('$\bar{v}_p$','FontSize',20);
    set(hy,'Interpreter','Latex')
    hz = zlabel('$\bar{r}_c$','FontSize',20);
    set(hz,'Interpreter','Latex')
    view(azimuth,elevation)
    legend('Pensees','Oeillets','Chrysantemes','Location','Best')
    title('Couleurs moyennes des images','FontSize',20)

