function [SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taur(tauRgrid)

dimR = size(tauRgrid,1);

SWF_gr       = NaN(dimR);
u_gr         = NaN(dimR);
hlad_gr      = NaN(dimR);
iRsh_gr      = NaN(dimR);
K2Y_gr       = NaN(dimR);
mi2me_gr     = NaN(dimR);
labsh_gr     = NaN(dimR);
y_gr         = NaN(dimR);
conu_gr      = NaN(dimR);
conl_gr      = NaN(dimR);
conh_gr      = NaN(dimR);

parfor i=1:dimR

    tauR = tauRgrid(i);

    args = [tauR;0.1;0.255;0.191173019746943];

    [SWF,u,hlad,iRsh,K2Y,mi2me,labsh,y,conu,conl,conh] = bgpsolutions(args);

    SWF_gr(i)       = SWF;
    u_gr(i)         = u;
    hlad_gr(i)      = hlad;
    iRsh_gr(i)      = iRsh;
    K2Y_gr(i)       = K2Y;
    mi2me_gr(i)     = mi2me;
    labsh_gr(i)     = labsh;
    y_gr(i)         = y;
    conu_gr(i)      = conu;
    conl_gr(i)      = conl;
    conh_gr(i)      = conh;

    %clear tauR arg SWF u hlad iRsh K2Y mi2me labsh y conu conl conh

end



