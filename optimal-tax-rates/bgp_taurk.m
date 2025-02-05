function [SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taurk(tauRgrid,tauKgrid)

dimR = size(tauRgrid,1);
dimK = size(tauKgrid,1);

SWF_gr       = NaN(dimR,dimK);
u_gr         = NaN(dimR,dimK);
hlad_gr      = NaN(dimR,dimK);
iRsh_gr      = NaN(dimR,dimK);
K2Y_gr       = NaN(dimR,dimK);
mi2me_gr     = NaN(dimR,dimK);
labsh_gr     = NaN(dimR,dimK);
y_gr         = NaN(dimR,dimK);
conu_gr      = NaN(dimR,dimK);
conl_gr      = NaN(dimR,dimK);
conh_gr      = NaN(dimR,dimK);

for i=1:dimR
    for j=1:dimK

    tauR = tauRgrid(i);
    tauK = tauKgrid(j);

    args = [tauR;tauK;0.255;0.191173019746943];

    [SWF,u,hlad,iRsh,K2Y,mi2me,labsh,y,conu,conl,conh] = bgpsolutions(args);

    SWF_gr(i,j)       = SWF;
    u_gr(i,j)         = u;
    hlad_gr(i,j)      = hlad;
    iRsh_gr(i,j)      = iRsh;
    K2Y_gr(i,j)       = K2Y;
    mi2me_gr(i,j)     = mi2me;
    labsh_gr(i,j)     = labsh;
    y_gr(i,j)         = y;
    conu_gr(i,j)      = conu;
    conl_gr(i,j)      = conl;
    conh_gr(i,j)      = conh;

    clear tauR tauK arg SWF u hlad iRsh K2Y mi2me labsh y conu conl conh

    end
end



