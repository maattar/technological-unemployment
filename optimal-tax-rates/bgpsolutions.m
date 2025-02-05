function [SWF,uuuu,hlad,iRshare,K2Y,min2meanw,labsh,y,conu,conl,conh] = bgpsolutions(arg)

tauR = arg(1,1);
tauK = arg(2,1);
tauH = arg(3,1);
wwtL = arg(4,1);

% Benchmark calibration

lmax    = 100*0.00842001841542753;
pssi    = 0.0760497257032793;
alfa    = 0.352346831115974;

% Preset values

gama = 2;
grow = 0.01141;      
rhho = 0.02;
popg = 0.005859;
delK = 0.04317;
delR = 0.1;
teta = 1-(1/0.704);
hhhh = 1-0.47;
llll = 0.47;
gA = grow;
gN = popg;

params = [tauR;tauK;tauH;lmax;pssi;alfa;gama;rhho;gA;gN;delK;delR;teta;hhhh;llll];

xx0 = [1 0.15 0.2 1.25];
options = optimoptions('fsolve','Display','off');
fun = @(xx)bgpfun(xx,params); 
xx  = fsolve(fun,xx0,options);

if xx(3)>wwtL

    weq  = xx(3);
    y    = xx(1);
    z    = xx(2);
    hlad = xx(4);

    r = (gama*gA + gN + rhho)/(1-tauK);
    rK = r;
    rR = r;

    k = (alfa*y)/(rK+delK);
    wwtH = ((1-alfa-pssi)*y)/hhhh;
    ltot = llll;
    uuuu = 0;


    if hlad >= lmax
        INTT = 0;
        xtot = 0;
    else
        INTT = (1-teta)*(lmax^(1/(1-teta)) - hlad^(1/(1-teta)));
        xtot = (((pssi*y)/((z^teta)*(1+tauR)*(rR+delR)))^(1/(1-teta)))*INTT;
    end

    
    K2Y = (k+xtot)/y;
    iK = (grow+popg+delK)*k;
    iR = (grow+popg+delR)*xtot;
    
    iRshare = iR/(iR+iK);
    min2meanw = weq/((hhhh*wwtH + ltot*weq)/(hhhh+ltot));
    TTTT = tauK*(rK*k+rR*xtot) + tauH*wwtH*hhhh + tauR*(rR+delR)*xtot;
    dtil = (TTTT)/(ltot);
    conu = NaN;
    conl = weq+dtil;
    conh = (1-tauH)*wwtH + (1-tauK)*(rK*(k/hhhh) + rR*(xtot/hhhh)) - (iK+iR)/hhhh;
    labsh = (weq*ltot + wwtH*hhhh)/y;
    SWF = (1/(1-gama))*(ltot*(conl^(1-gama)-1) +  hhhh*(conh^(1-gama)-1));

else
    
    r = (gama*gA + gN + rhho)/(1-tauK);
    rK = r;
    rR = r;
    hlad = ((1+tauR)*(rR+delR))/wwtL;

    if hlad >= lmax
        INTT = 0;
        Phhi = (hlad/(wwtL^(teta/(1-teta)))) + (INTT/((hlad*wwtL)^(teta/(1-teta)))); 
        z = ((pssi^((1-alfa)/(1-alfa-pssi)))*((alfa/(r+delK))^(alfa/(1-alfa-pssi)))*hhhh)*(Phhi^(((1-teta)/teta)*((1-alfa)/(1-alfa-pssi))));
        y = ((alfa/(rK+delK))^(alfa/(1-alfa)))*(hhhh^((1-alfa-pssi)/(1-alfa)))*(z^(pssi/(1-alfa)));
        xtot = 0;
    else
        INTT = (1-teta)*(lmax^(1/(1-teta)) - hlad^(1/(1-teta)));
        Phhi = (hlad/(wwtL^(teta/(1-teta)))) + (INTT/((hlad*wwtL)^(teta/(1-teta)))); 
        z = ((pssi^((1-alfa)/(1-alfa-pssi)))*((alfa/(r+delK))^(alfa/(1-alfa-pssi)))*hhhh)*(Phhi^(((1-teta)/teta)*((1-alfa)/(1-alfa-pssi))));
        y = ((alfa/(rK+delK))^(alfa/(1-alfa)))*(hhhh^((1-alfa-pssi)/(1-alfa)))*(z^(pssi/(1-alfa)));
        xtot = (((pssi*y)/((z^teta)*(1+tauR)*(rR+delR)))^(1/(1-teta)))*INTT;
    end

    k = (alfa*y)/(rK+delK);
    wwtH = ((1-alfa-pssi)*y)/hhhh;
    
    ltot = (((pssi*y)/((z^teta)*wwtL))^(1/(1-teta)))*hlad;
    K2Y = (k+xtot)/y;
    iK = (grow+popg+delK)*k;
    iR = (grow+popg+delR)*xtot;
    uuuu = 1-hhhh-ltot;
    iRshare = iR/(iR+iK);
    min2meanw = wwtL/((hhhh*wwtH + ltot*wwtL)/(hhhh+ltot));
    TTTT = tauK*(rK*k+rR*xtot) + tauH*wwtH*hhhh + tauR*(rR+delR)*xtot;
    btil = wwtL;
    dtil = (TTTT - uuuu*btil)/(ltot);
    conu = btil;
    conl = wwtL+dtil;
    conh = (1-tauH)*wwtH + (1-tauK)*(rK*(k/hhhh) + rR*(xtot/hhhh)) - (iK+iR)/hhhh;
    labsh = (wwtL*ltot + wwtH*hhhh)/y;
    SWF = (1/(1-gama))*(uuuu*(conu^(1-gama)-1) + ltot*(conl^(1-gama)-1) +  hhhh*(conh^(1-gama)-1));

end

if conu<=0
    conu=NaN;
    SWF=-9999;
end

if conl<=0
    conl=NaN;
    SWF=-9999;
end

if conh<=0
    conh=NaN;
    SWF=-9999;
end
