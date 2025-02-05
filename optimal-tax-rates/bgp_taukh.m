function [SWF_gr,u_gr,hlad_gr,iRsh_gr,K2Y_gr,mi2me_gr,labsh_gr,y_gr,conu_gr,conl_gr,conh_gr] = bgp_taukh(tauKgrid,tauHgrid)

dimK = size(tauKgrid,1);
dimH = size(tauHgrid,1);

SWF_gr       = NaN(dimK,dimH);
u_gr         = NaN(dimK,dimH);
hlad_gr      = NaN(dimK,dimH);
iRsh_gr      = NaN(dimK,dimH);
K2Y_gr       = NaN(dimK,dimH);
mi2me_gr     = NaN(dimK,dimH);
labsh_gr     = NaN(dimK,dimH);
y_gr         = NaN(dimK,dimH);
conu_gr      = NaN(dimK,dimH);
conl_gr      = NaN(dimK,dimH);
conh_gr      = NaN(dimK,dimH);

    parfor jj=1:dimK
        for kk=1:dimH
            
            tauK = tauKgrid(jj);
            tauH = tauHgrid(kk);

            args = [0;tauK;tauH;0.191173019746943];

            [SWF,u,hlad,iRsh,K2Y,mi2me,labsh,y,conu,conl,conh] = bgpsolutions(args);

            SWF_gr(jj,kk)       = SWF;
            u_gr(jj,kk)         = u;
            hlad_gr(jj,kk)      = hlad;
            iRsh_gr(jj,kk)      = iRsh;
            K2Y_gr(jj,kk)       = K2Y;
            mi2me_gr(jj,kk)     = mi2me;
            labsh_gr(jj,kk)     = labsh;
            y_gr(jj,kk)         = y;
            conu_gr(jj,kk)      = conu;
            conl_gr(jj,kk)      = conl;
            conh_gr(jj,kk)      = conh;

            disp(jj)
            disp(kk)

            %clear tauK tauH arg SWF u hlad iRsh K2Y mi2me labsh y conu conl conh
        end
    end





