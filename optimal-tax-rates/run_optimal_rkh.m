clc
clear
close all

tauRgrid = 0.0:0.005:0.8;
tauRgrid = tauRgrid';
tauKgrid = 0.0:0.005:0.8;
tauKgrid = tauKgrid';
tauHgrid = 0.0:0.005:0.8;
tauHgrid = tauHgrid';

[SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taurkh(tauRgrid,tauKgrid,tauHgrid);

[maxVal, linearIdx] = max(SWF_gr(:));  % Find the maximum value and its linear index
[i1, i2, i3] = ind2sub(size(SWF_gr), linearIdx);  % Convert linear index to subscripts

tauRopt=tauRgrid(i1);
tauKopt=tauKgrid(i2);
tauHopt=tauHgrid(i3);

display(tauRopt)
display(tauKopt)
display(tauHopt)

[maxVal_y, linearIdx_y] = max(y_gr(:));  % Find the maximum value and its linear index
[i1_y, i2_y, i3_y] = ind2sub(size(y_gr), linearIdx_y);  % Convert linear index to subscripts

tauRopt_y=tauRgrid(i1_y);
tauKopt_y=tauKgrid(i2_y);
tauHopt_y=tauHgrid(i3_y);

display(tauRopt_y)
display(tauKopt_y)
display(tauHopt_y)

VVV=SWF_gr(:,:,i3);
uuu=u_gr(:,:,i3);

[TAUR,TAUK]=meshgrid(tauRgrid,tauKgrid);

figure(1)
sc = meshc(TAUR,TAUK,VVV');
sc(2).EdgeColor = 'k';
zlim([-1.2 -0.15])
hold on
plot3([tauRopt tauRopt], [tauKopt tauKopt], [-1.2 -0.15], 'r-', 'LineWidth', 2)
hold off
camproj('perspective')
ylabel('Capital income tax $\tau_K$','Interpreter','Latex')
xlabel('Robot tax $\tau_R$','Interpreter','Latex')
zlabel('Social welfare','Interpreter','Latex')
%exportgraphics(gcf, 'rkh_SWF.eps', 'ContentType', 'image', 'Resolution', 1200);

figure(2)
sc = meshc(TAUR,TAUK,uuu');
sc(2).EdgeColor = 'k';
zlim([0 0.2])
hold on
plot3([tauRopt tauRopt], [tauKopt tauKopt], [0 0.2], 'r-', 'LineWidth', 2)
hold off
camproj('perspective')
ylabel('Capital income tax $\tau_K$','Interpreter','Latex')
xlabel('Robot tax $\tau_R$','Interpreter','Latex')
zlabel('Unemployment rate','Interpreter','Latex')
%exportgraphics(gcf, 'rkh_u.eps', 'ContentType', 'image', 'Resolution', 1200);
