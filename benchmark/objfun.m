function Q = objfun(params)

% lmaxsc = lmax/100 where lmaxsc in (0,1)

lmax = 100*params(1);
wwtL = params(2);
pssi = params(3);
alfa = params(4);

gama = 2;
grow = 0.01141;      
rhho = 0.02;
popg = 0.005859;
delK = 0.04317;
delR = 0.1;
tauK = 0.1;         % Acemoglu et al BPEA
tauR = 0.0;         % Acemoglu et al BPEA
tauH = 0.255;       % Acemoglu et al BPEA
teta = 1-(1/0.704); % Lee and Shin
hhhh = 1-0.47;      % Frey and Osborne 

gA = grow;
gN = popg;

r = (gama*gA + gN + rhho)/(1-tauK);

rK = r;
rR = r;

hlad = ((1+tauR)*(rR+delR))/wwtL;

INTT = (1-teta)*(lmax^(1/(1-teta)) - hlad^(1/(1-teta)));

Phhi = (hlad/(wwtL^(teta/(1-teta)))) + (INTT/((hlad*wwtL)^(teta/(1-teta)))); 

z = ((pssi^((1-alfa)/(1-alfa-pssi)))*((alfa/(r+delK))^(alfa/(1-alfa-pssi)))*hhhh)*(Phhi^(((1-teta)/teta)*((1-alfa)/(1-alfa-pssi))));

y = ((alfa/(rK+delK))^(alfa/(1-alfa)))*(hhhh^((1-alfa-pssi)/(1-alfa)))*(z^(pssi/(1-alfa)));

k = (alfa*y)/(rK+delK);

wwtH = ((1-alfa-pssi)*y)/hhhh;

xtot = (((pssi*y)/((z^teta)*(1+tauR)*(rR+delR)))^(1/(1-teta)))*INTT;

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

labsh = (wwtL*ltot + wwtH*hhhh)/y;

modmom = [iRshare;K2Y;uuuu;min2meanw;labsh];
datmom = [0.011;3.498;0.044;0.25677;0.594];

dev = (modmom - datmom)./datmom;

if (uuuu>0) && (uuuu<1) && (ltot>0) && (ltot<1) && (INTT>0) && (Phhi>0) && (wwtH>wwtL)
    Q = dev'*dev;
else
    Q = Inf;
end





