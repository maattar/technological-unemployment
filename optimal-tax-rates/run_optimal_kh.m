clc
clear
close all

tauKgrid = 0.0:0.001:0.7;
tauKgrid = tauKgrid';
tauHgrid = 0.0:0.001:0.7;
tauHgrid = tauHgrid';

[SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taukh(tauKgrid,tauHgrid);

[maxVal, linearIdx] = max(SWF_gr(:));  % Find the maximum value and its linear index
[i1, i2] = ind2sub(size(SWF_gr), linearIdx);  % Convert linear index to subscripts

tauKopt=tauKgrid(i1);
tauHopt=tauHgrid(i2);

display(tauKopt)
display(tauHopt)

[maxVal_y, linearIdx_y] = max(y_gr(:));  % Find the maximum value and its linear index
[i1_y, i2_y] = ind2sub(size(y_gr), linearIdx_y);  % Convert linear index to subscripts

tauKopt_y=tauKgrid(i1_y);
tauHopt_y=tauHgrid(i2_y);

display(tauKopt_y)
display(tauHopt_y)

[TAUK,TAUH] = meshgrid(tauKgrid,tauHgrid);

i1_l=202;
i2_l=310;

tauKopt_l=tauKgrid(i1_l);
tauHopt_l=tauHgrid(i2_l);

figure(1)
sc = meshc(TAUK,TAUH,SWF_gr');
sc(2).EdgeColor = 'k';
zlim([-3 0])
hold on
plot3([tauKopt tauKopt], [tauHopt tauHopt], [-3 0], 'r-', 'LineWidth', 2)
plot3([tauKopt_l tauKopt_l], [tauHopt_l tauHopt_l], [-3 0], 'b-', 'LineWidth', 2)
hold off
camproj('perspective')
xlabel('Capital income tax $\tau_K$','Interpreter','Latex')
ylabel('Labor income tax $\tau_H$','Interpreter','Latex')
zlabel('Social welfare','Interpreter','Latex')
%exportgraphics(gcf, 'kh_SWF.eps', 'ContentType', 'image', 'Resolution', 1200);

figure(2)
sc = meshc(TAUK,TAUH,u_gr');
sc(2).EdgeColor = 'k';
zlim([0 0.3])
hold on
plot3([tauKopt tauKopt], [tauHopt tauHopt], [0 0.3], 'r-', 'LineWidth', 2)
plot3([tauKopt_l tauKopt_l], [tauHopt_l tauHopt_l], [0 0.3], 'b-', 'LineWidth', 2)
hold off
camproj('perspective')
xlabel('Capital income tax $\tau_K$','Interpreter','Latex')
ylabel('Labor income tax $\tau_H$','Interpreter','Latex')
zlabel('Unemployment rate','Interpreter','Latex')
%exportgraphics(gcf, 'kh_u.eps', 'ContentType', 'image', 'Resolution', 1200);




