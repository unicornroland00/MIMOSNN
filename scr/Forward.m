function [ OutSNN,Snx,Sny,SA ] = Forward(Input,W_I,B,W_sn,W_O,Cara)
%% MIMO SNN forward operation 
% 2022-2-17 
L=Cara(1);  
% N=Cara(2);   Xu=Cara(3);  M=Cara(4); 
% learn=Cara(5);  alph=Cara(6);  Ntrai=Cara(7); Mtrai=Cara(8);
% N_Input=Cara(9); N_Output=Cara(10); 
N_SN=Cara(11);
SFlag=Cara(12); 
% B=[0,0.5,0.5,1,0,0;];
if SFlag==1     Xu=Cara(3);XuC=0;end
if SFlag==2     Xu=0;XuC=Cara(3);end

%% compute neurons input
SA=zeros(N_SN,L+1);
% IW=Input*W_I+B;
% Snx=0.5*(1+IW./(1+abs(IW)));
Snx=Input*W_I+B;  %neurons input
% for i=1:1:length(Snx); 
% %    if Snx(i)>1 disp('Snx>1');keyboard;end 
% %    if Snx(i)<0 disp('Snx<1');keyboard;end    %debug
% end

%% compute neurons output
Sny=zeros(1,N_SN);          %zero initialization
for SN_k=1:1:N_SN;
    Sx=1+Snx(SN_k)*(L-1)+Xu;
%     if Sx>L disp('Sx>L');keyboard;end         %debug
%     if Sx<1 disp('Sx<1');keyboard;end
    wSn=W_sn(SN_k,:);
    %compute Ci,n
    if SFlag==1,
        [ Sa ] = SaSFun(Sx,L);      %Sa function with optimization
    end
    if SFlag==2,
        [ Sa ] = SaFun(Sx,L);       %Sa function in sinx/x
    end
    SA(SN_k,:)=Sa;
    
    % compute output of SISO SNN
    [ Sy ] = SNN_forward(Sx,wSn,Sa,L);     
%      if Sy>1.5 Sy=1.5;end
    Sny(SN_k)=Sy;       %neurons output
end
OutSNN=Sny*W_O;