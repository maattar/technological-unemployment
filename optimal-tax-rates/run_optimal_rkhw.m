clc
clear
close all

tic

tauRgrid = 0.79975:0.00025:0.8;
tauRgrid = tauRgrid';
tauKgrid = 0.55:0.00025:0.75;
tauKgrid = tauKgrid';
tauHgrid = 0.1:0.00025:0.2;
tauHgrid = tauHgrid';
wLgrid   = 0:0.00025:0.00025;
wLgrid   = wLgrid';

[SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taurkhw(tauRgrid,tauKgrid,tauHgrid,wLgrid);

[maxVal, linearIdx] = max(SWF_gr(:));  % Find the maximum value and its linear index
[i1, i2, i3, i4] = ind2sub(size(SWF_gr), linearIdx);  % Convert linear index to subscripts

tauRopt = tauRgrid(i1);
tauKopt = tauKgrid(i2);
tauHopt = tauHgrid(i3);
wLopt   = wLgrid(i4); 

display(tauRopt)
display(tauKopt)
display(tauHopt)
display(wLopt)

[maxVal_y, linearIdx_y] = max(y_gr(:));  % Find the maximum value and its linear index
[i1_y, i2_y, i3_y, i4_y] = ind2sub(size(y_gr), linearIdx_y);  % Convert linear index to subscripts

tauRopt_y = tauRgrid(i1_y);
tauKopt_y = tauKgrid(i2_y);
tauHopt_y = tauHgrid(i3_y);
wLopt_y   = wLgrid(i4_y); 

display(tauRopt_y)
display(tauKopt_y)
display(tauHopt_y)
display(wLopt_y)

toc
