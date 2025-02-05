clc
clear
close all

tauRgrid = 0:0.01:0.5;
tauRgrid = tauRgrid';
tauKgrid = 0:0.01:0.5;
tauKgrid = tauKgrid';

[SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taurk(tauRgrid,tauKgrid);

[maxVal, linearIdx] = max(SWF_gr(:));  % Find the maximum value and its linear index
[i1, i2] = ind2sub(size(SWF_gr), linearIdx);  % Convert linear index to subscripts

tauRopt=tauRgrid(i1);
tauKopt=tauKgrid(i2);

display(tauRopt)
display(tauKopt)

[maxVal_y, linearIdx_y] = max(y_gr(:));  % Find the maximum value and its linear index
[i1_y, i2_y, i3_y] = ind2sub(size(y_gr), linearIdx_y);  % Convert linear index to subscripts

tauRopt_y=tauRgrid(i1_y);
tauKopt_y=tauKgrid(i2_y);

display(tauRopt_y)
display(tauKopt_y)
