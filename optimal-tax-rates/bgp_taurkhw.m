function [SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taurkhw(tauRgrid,tauKgrid,tauHgrid,wLgrid)

dimR = size(tauRgrid,1);
dimK = size(tauKgrid,1);
dimH = size(tauHgrid,1);
dimW = size(wLgrid,1);

SWF_gr       = NaN(dimR,dimK,dimH,dimW);
u_gr         = NaN(dimR,dimK,dimH,dimW);
hlad_gr      = NaN(dimR,dimK,dimH,dimW);
iRsh_gr      = NaN(dimR,dimK,dimH,dimW);
K2Y_gr       = NaN(dimR,dimK,dimH,dimW);
mi2me_gr     = NaN(dimR,dimK,dimH,dimW);
labsh_gr     = NaN(dimR,dimK,dimH,dimW);
y_gr         = NaN(dimR,dimK,dimH,dimW);
conu_gr      = NaN(dimR,dimK,dimH,dimW);
conl_gr      = NaN(dimR,dimK,dimH,dimW);
conh_gr      = NaN(dimR,dimK,dimH,dimW);

parfor ii=1:dimR
    for jj=1:dimK
        for kk=1:dimH
            for ww=1:dimW
            tauR = tauRgrid(ii);
            tauK = tauKgrid(jj);
            tauH = tauHgrid(kk);
            wwtL = wLgrid(ww);

            args = [tauR;tauK;tauH;wwtL];

            [SWF,u,hlad,iRsh,K2Y,mi2me,labsh,y,conu,conl,conh] = bgpsolutions(args);

            SWF_gr(ii,jj,kk,ww)       = SWF;
            u_gr(ii,jj,kk,ww)         = u;
            hlad_gr(ii,jj,kk,ww)      = hlad;
            iRsh_gr(ii,jj,kk,ww)      = iRsh;
            K2Y_gr(ii,jj,kk,ww)       = K2Y;
            mi2me_gr(ii,jj,kk,ww)     = mi2me;
            labsh_gr(ii,jj,kk,ww)     = labsh;
            y_gr(ii,jj,kk,ww)         = y;
            conu_gr(ii,jj,kk,ww)      = conu;
            conl_gr(ii,jj,kk,ww)      = conl;
            conh_gr(ii,jj,kk,ww)      = conh;

            %clear tauR tauK tauH wwtL arg SWF u hlad iRsh K2Y mi2me labsh y conu conl conh

            disp(ii)
            disp(jj)
            disp(kk)
            disp(ww)
            end
        end
    end
end





