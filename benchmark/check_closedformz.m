% lmaxsc = lmax/100 where lmaxsc in (0,1)

clc
clear

params = [0.00842001841542753;0.191173019746943;0.0760497257032793;0.352346831115974];

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

zcf = (pssi^((1-alfa)/(1-alfa-pssi)))*(alfa^(alfa/(1-alfa-pssi)))*((r+delK)^(-alfa/(1-alfa-pssi)))*hhhh*(((1+tauR)*(r+delR)*(wwtL^(1/teta)))^(-(1-alfa)/(1-alfa-pssi)))*(((1-teta)*((lmax*wwtL)^(1/(1-teta))) + teta*(((1+tauR)*(r+delR))^(1/(1-teta))))^(((1-teta)*(1-alfa))/(teta*(1-alfa-pssi))));

z

zcf

z/zcf

