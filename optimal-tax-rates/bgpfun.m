function F = bgpfun(xx,params)

% y             x(1)
% z             x(2)
% wequilibrium  x(3)
% lambdahat     x(4)

tauR = params(1);
tauK = params(2);
tauH = params(3);
lmax = params(4);
pssi = params(5);
alfa = params(6);
gama = params(7);
rhho = params(8);
gA   = params(9);
gN   = params(10);
delK = params(11);
delR = params(12);
teta = params(13);
hhhh = params(14);
llll = params(15);

r = (gama*gA + gN + rhho)/(1-tauK);

F = [ xx(1) - ((alfa/(r+delK))^alfa)*(hhhh^(1-alfa-pssi))*(xx(2)^pssi)
      (pssi*xx(1))/(xx(2)^(teta)) - xx(3)*((llll/xx(4))^(1-teta))
      xx(4) - (((1+tauR)*(r+delR))/xx(3))
      xx(2)^teta - (((pssi*xx(1))/(xx(2)^(teta)))^(teta/(1-teta)))*((xx(4)/(xx(3)^(teta/(1-teta))))+(((1-teta)*(lmax^(1/(1-teta))-xx(4)^(1/(1-teta))))/(((1+tauR)*(r+delR))^(teta/(1-teta)))))               ];
end