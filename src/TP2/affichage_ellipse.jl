#=----------------------------------------
         Affichage d'une ellipse
-----------------------------------------=#

function affichage_ellipse(C,theta_0,a,b,theta_points_ellipse,motif)

    xy_points_ellipse = [a*cos.(theta_points_ellipse)  b*sin.(theta_points_ellipse)]';
    R = [cos(theta_0) -sin(theta_0) ; sin(theta_0) cos(theta_0)];
    xy_points_ellipse = R*xy_points_ellipse+C*ones(1,length(theta_points_ellipse));
    px=[xy_points_ellipse[1,:]; xy_points_ellipse[1,1]]
    py=[xy_points_ellipse[2,:]; xy_points_ellipse[2,1]]
    plot(px,py,motif,MarkerSize=30,LineWidth=2);

  end
