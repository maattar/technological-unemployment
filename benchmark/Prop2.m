% lmaxsc = lmax/100 where lmaxsc in (0,1)

clc
clear
close all

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

figure(1)
subplot(1,2,1)
fplot(@(x) ((wwtL*lmax)/(((gama*gA+gN+rhho)/(1-x)) + delR ))-1,'LineWidth',2)
xlim([0 1])
ylim([0 1])
xline(0,'LineStyle','--')
yline(0,'LineStyle','--')
box off
hold on
xx = linspace(-1, 1, 100);
yy = ((wwtL*lmax)./(((gama*gA+gN+rhho)./(1-xx)) + delR ))-1;
fill([xx, fliplr(xx)], [yy, ones(size(xx))], 'cyan', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
hold off
title('benchmark minimum wage')
ylabel('Robot tax $\tau_R$','Interpreter','latex')
xlabel('Capital income tax $\tau_K$','Interpreter','latex')
text(0.2,0.5,'No automation','FontSize',12,'FontWeight','bold','Color','blue')
subplot(1,2,2)
fplot(@(x) ((1.25*wwtL*lmax)/(((gama*gA+gN+rhho)/(1-x)) + delR ))-1,'LineWidth',2)
xlim([0 1])
ylim([0 1])
xline(0,'LineStyle','--')
yline(0,'LineStyle','--')
box off
hold on
xx = linspace(-1, 1, 100);
yy = ((1.25*wwtL*lmax)./(((gama*gA+gN+rhho)./(1-xx)) + delR ))-1;
fill([xx, fliplr(xx)], [yy, ones(size(xx))], 'cyan', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
hold off
title('25% higher minimum wage')
ylabel('Robot tax $\tau_R$','Interpreter','latex')
xlabel('Capital income tax $\tau_K$','Interpreter','latex')
text(0.2,0.5,'No automation','FontSize',12,'FontWeight','bold','Color','blue')


