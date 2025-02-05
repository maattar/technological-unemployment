clc
clear
close all

tauR_bm = 0;
tauK_bm = 0.1;
tauH_bm = 0.255;
minw_bm = 0.191173019746943; % wwtL

args_bm = [tauR_bm;tauK_bm;tauH_bm;minw_bm];

[SWF_bm,u_bm,hlad_bm,iRsh_bm,K2Y_bm,mi2me_bm,labsh_bm,y_bm,conu_bm,conl_bm,conh_bm] = bgpsolutions(args_bm);

Benchmark_Values = [SWF_bm;u_bm;hlad_bm;iRsh_bm;K2Y_bm;mi2me_bm;labsh_bm;y_bm;conu_bm;conl_bm;conh_bm];

Vars = {'Social Welfare';'Unemployment Rate';'\hat{\lambda}';'Robotic Inv. Sh.';'Capital-Output Ratio';'Min-to-Mean Wage';'Labor Share';'Output';'Cons. u';'Cons. l';'Cons. h'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                                 %%%%%
%%%%%                      MINIMUM WAGE EXPERIMENT                    %%%%%
%%%%%                                                                 %%%%%
%%%%%                   1 percent larger minimum wage                 %%%%%
%%%%%                                                                 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

args_ex = [tauR_bm;tauK_bm;tauH_bm;(1.01)*minw_bm];

[SWF_ex,u_ex,hlad_ex,iRsh_ex,K2Y_ex,mi2me_ex,labsh_ex,y_ex,conu_ex,conl_ex,conh_ex] = bgpsolutions(args_ex);

Experiment_Values = [SWF_ex;u_ex;hlad_ex;iRsh_ex;K2Y_ex;mi2me_ex;labsh_ex;y_ex;conu_ex;conl_ex;conh_ex];

T_minw = table(Vars,Benchmark_Values,Experiment_Values);

save T_minw

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                                 %%%%%
%%%%%                        ROBOT TAX EXPERIMENT                     %%%%%
%%%%%                                                                 %%%%%
%%%%%               1 percentage points larger robot tax              %%%%%
%%%%%                                                                 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc

clear args_ex Experiment_Values

args_ex = [(tauR_bm+0.01);tauK_bm;tauH_bm;minw_bm];

[SWF_ex,u_ex,hlad_ex,iRsh_ex,K2Y_ex,mi2me_ex,labsh_ex,y_ex,conu_ex,conl_ex,conh_ex] = bgpsolutions(args_ex);

Experiment_Values = [SWF_ex;u_ex;hlad_ex;iRsh_ex;K2Y_ex;mi2me_ex;labsh_ex;y_ex;conu_ex;conl_ex;conh_ex];

T_tauR = table(Vars,Benchmark_Values,Experiment_Values);

save T_tauR

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                                 %%%%%
%%%%%                 CAPITAL INCOME TAX EXPERIMENT                   %%%%%
%%%%%                                                                 %%%%%
%%%%%          1 percentage points larger capital income tax          %%%%%
%%%%%                                                                 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc

clear args_ex Experiment_Values

args_ex = [tauR_bm;(tauK_bm+0.01);tauH_bm;minw_bm];

[SWF_ex,u_ex,hlad_ex,iRsh_ex,K2Y_ex,mi2me_ex,labsh_ex,y_ex,conu_ex,conl_ex,conh_ex] = bgpsolutions(args_ex);

Experiment_Values = [SWF_ex;u_ex;hlad_ex;iRsh_ex;K2Y_ex;mi2me_ex;labsh_ex;y_ex;conu_ex;conl_ex;conh_ex];

T_tauK = table(Vars,Benchmark_Values,Experiment_Values);

save T_tauK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                                 %%%%%
%%%%%                   LABOR INCOME TAX EXPERIMENT                   %%%%%
%%%%%                                                                 %%%%%
%%%%%           1 percentage points larger labor income tax           %%%%%
%%%%%                                                                 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc

clear args_ex Experiment_Values

args_ex = [tauR_bm;tauK_bm;(tauH_bm+0.01);minw_bm];

[SWF_ex,u_ex,hlad_ex,iRsh_ex,K2Y_ex,mi2me_ex,labsh_ex,y_ex,conu_ex,conl_ex,conh_ex] = bgpsolutions(args_ex);

Experiment_Values = [SWF_ex;u_ex;hlad_ex;iRsh_ex;K2Y_ex;mi2me_ex;labsh_ex;y_ex;conu_ex;conl_ex;conh_ex];

T_tauH = table(Vars,Benchmark_Values,Experiment_Values);

save T_tauH

