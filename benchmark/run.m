clc
clear
close all

lb = [0;0;0;0];

ub = [1;1;0.5;0.5];  



% options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
% [params,fval,exitflag] = fmincon(@objfun,params0,[],[],[],[],lb,ub,[],options);

Reps = 5000;

X = NaN(6,Reps);

for i=1:Reps

    params0 = [rand;0.15*rand;0.1;0.3];
    options = optimoptions('simulannealbnd','Display','none');
    [params,fval,exitflag] = simulannealbnd(@objfun,params0,lb,ub,options);

    X(1:4,i) = params;
    X(5,i)   = fval;
    X(6,i)   = exitflag;

    disp(i)

    clear params fval exitflag params0

end


XT = X';

XTsorted = sortrows(XT,5);

params = XTsorted(1,1:4);
params = params';

moments
