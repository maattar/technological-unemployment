clc
clear
close all

tauRgrid = 0:0.0001:0.5;
tauRgrid = tauRgrid';

[SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taur(tauRgrid);

[maxVal, linearIdx] = max(SWF_gr(:));  % Find the maximum value and its linear index
[i1] = ind2sub(size(SWF_gr), linearIdx);  % Convert linear index to subscripts

tauRopt=tauRgrid(i1);

display(tauRopt)

[maxVal_y, linearIdx_y] = max(y_gr(:));  % Find the maximum value and its linear index
[i1_y] = ind2sub(size(y_gr), linearIdx_y);  % Convert linear index to subscripts

tauRopt_y=tauRgrid(i1_y);

display(tauRopt_y)

figure(1)
subplot(2,1,1)
plot(tauRgrid(:,1),SWF_gr(:,1),'LineWidth',2)
xline(0.0447000000000000,'LineWidth',1.5,'LineStyle',':')
xline(0.148700000000000,'LineWidth',1.5,'LineStyle',':')
xlim([0 1.25])
ylim([-0.75 -0.45])
title('Social welfare')
subplot(2,1,2)
plot(tauRgrid(:,1),u_gr(:,1),'LineWidth',2)
xline(0.0447000000000000,'LineWidth',1.5,'LineStyle',':')
xline(0.148700000000000,'LineWidth',1.5,'LineStyle',':')
title('Unemployment rate')
ylim([0 0.1])
xlim([0 1.25])
xlabel('Robot tax $\tau_R$','Interpreter','Latex')