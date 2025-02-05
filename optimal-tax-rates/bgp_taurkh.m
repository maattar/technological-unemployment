function [SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taurkh(tauRgrid,tauKgrid,tauHgrid)

dimR = size(tauRgrid,1);
dimK = size(tauKgrid,1);
dimH = size(tauHgrid,1);

SWF_gr       = NaN(dimR,dimK,dimH);
u_gr         = NaN(dimR,dimK,dimH);
hlad_gr      = NaN(dimR,dimK,dimH);
iRsh_gr      = NaN(dimR,dimK,dimH);
K2Y_gr       = NaN(dimR,dimK,dimH);
mi2me_gr     = NaN(dimR,dimK,dimH);
labsh_gr     = NaN(dimR,dimK,dimH);
y_gr         = NaN(dimR,dimK,dimH);
conu_gr      = NaN(dimR,dimK,dimH);
conl_gr      = NaN(dimR,dimK,dimH);
conh_gr      = NaN(dimR,dimK,dimH);

parfor ii=1:dimR
    for jj=1:dimK
        for kk=1:dimH
            tauR = tauRgrid(ii);
            tauK = tauKgrid(jj);
            tauH = tauHgrid(kk);

            args = [tauR;tauK;tauH;0.191173019746943];

            [SWF,u,hlad,iRsh,K2Y,mi2me,labsh,y,conu,conl,conh] = bgpsolutions(args);

            SWF_gr(ii,jj,kk)       = SWF;
            u_gr(ii,jj,kk)         = u;
            hlad_gr(ii,jj,kk)      = hlad;
            iRsh_gr(ii,jj,kk)      = iRsh;
            K2Y_gr(ii,jj,kk)       = K2Y;
            mi2me_gr(ii,jj,kk)     = mi2me;
            labsh_gr(ii,jj,kk)     = labsh;
            y_gr(ii,jj,kk)         = y;
            conu_gr(ii,jj,kk)      = conu;
            conl_gr(ii,jj,kk)      = conl;
            conh_gr(ii,jj,kk)      = conh;

            disp(ii)
            disp(jj)
            disp(kk)

            %clear tauR tauK tauH arg SWF u hlad iRsh K2Y mi2me labsh y conu conl conh
        end
    end
end





