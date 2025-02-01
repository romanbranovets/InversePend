ProjectPend.Kpa=7.3;

ProjectPend.motor_nominal_voltage=24;
ProjectPend.R = 10;
ProjectPend.L = 350e-6;
ProjectPend.J_motor = 500e-9;
ProjectPend.km = 16e-3;
ProjectPend.kw = 62.8;
ProjectPend.vis_friction_coef_motor = 0.0025;

ProjectPend.i_gear = 100;
ProjectPend.J_gear = 2.4e-6;
ProjectPend.vis_friction_coef_gear = 0.003;

ProjectPend.vis_friction_coef_rp = 0.002;
ProjectPend.i_rp = 20e3;
ProjectPend.J_pinion = 1e-6;

ProjectPend.Rs = 0.001;

ProjectPend.M = 0.2;
ProjectPend.m = 0.1;
ProjectPend.l = 0.5; %расстояние до центра масс
ProjectPend.I = (ProjectPend.m * ProjectPend.l^2)/3
ProjectPend.g = 9.8;

% Уравнения Лагранжа
% T1 = M*(x')^2/2
% T2 = m*vc^2/2 + I*(ф')^2/2
% vc = (x'^2 + 2*lxф*cosф + l^2*ф')
% T =T1+T2 = (M+m)(x')^2/2 + mlx'ф'cosф +ml^2/2*ф^2 + I*(ф')^2
% Преобразуем:
% (M+m)x" + mlф"cosф - ml(ф')^2sinф = u | u = F -сила, действующая на маятник
% (I + ml^2)*ф" + mlx"*cosф = - mgl*sinф

%Линеризация:
% sinф = ф
% cosф = 1
% ml(ф')^2sinф = 0
%
% (M+m)x" + mlф" = u
% (I + ml^2)*ф" + mlx" = - mgl*ф
%
% x"  = -ml/(M+m)*ф" + u/(M+m)
% ф"  = - mgl/(I + ml^2)*ф  -ml/(I + ml^2)*x"
%
% ф" = - mgl*ф - ml/(I + ml^2)*(-ml/(M+m)*ф" + u/(M+m))
% ф" (1 - ml/(I + ml^2)*(ml/(M+m)))= ф" * (I*(M+m)+M*m*l^2)/((M+m)*(I + ml^2)))


ProjectPend.p = ProjectPend.I*(ProjectPend.M+ProjectPend.m)+ProjectPend.M*ProjectPend.m*ProjectPend.l^2; 

% ф" = -mgl(M+m)/p*ф  - ml/p*u
% x" = (m^2*g*l^2)/p*ф + (I+m*l^2)/p 
% x1 = x
% x2 = x'
% x3 = ф
% x4 = ф'

ProjectPend.A = [0      1              0           0;...
     0      0          (ProjectPend.m^2*ProjectPend.g*ProjectPend.l^2)/ProjectPend.p   0;...
     0      0              0           1;...
     0      0          -ProjectPend.m*ProjectPend.g*ProjectPend.l*(ProjectPend.M+ProjectPend.m)/ProjectPend.p  0]
ProjectPend.B = [     0;
     (ProjectPend.I+ProjectPend.m*ProjectPend.l^2)/ProjectPend.p;
          0;
       -ProjectPend.m*ProjectPend.l/ProjectPend.p]


%      0 1 0 0 ;...
%      0 0 C33 0 ;...
%      0 0 1 0 ;...
%      0 0 0 1 ;...
%      0 0 C63 0]
% D = [0 ;...
%      0 ;...
%      D3 ;...
%      0 ;...
%      0 ;...
%      D6 ]

ProjectPend.Init_St = [ 0 0 deg2rad(5) 0] %Начальные состояния 