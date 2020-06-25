#=----------------------------------------
         Affichage d'une ellipse
-----------------------------------------=#


function affichage_ellipse(C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau,theta_points_ellipse)

    xy_points_ellipse = transpose([a.*cos.(collect(theta_points_ellipse))  b.*sin.(collect(theta_points_ellipse))]);
    R = [cos.(theta_0) -sin.(theta_0) ; sin.(theta_0) cos.(theta_0)];
    xy_points_ellipse = R*xy_points_ellipse+C*ones(1,length(theta_points_ellipse));
    px=[xy_points_ellipse[1,:]; xy_points_ellipse[1,1]]
    py=[xy_points_ellipse[2,:]; xy_points_ellipse[2,1]]
    plot(px,py,MarkerSize=30,LineWidth=2);
    #plot([1,2], [3,4])


end
