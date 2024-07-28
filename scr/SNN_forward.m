function [ sny] = SNN_forward(snx,wn,Sa,L)
%SNN forward caculatin
%   2022-2-20

F=floor(snx);
if F==0,F=1;end
C=abs(snx-F);
% Sa=wn;
if C<0.01,
    sny=wn(F);
elseif C>0.99,    
    sny=wn(F+1);
else
    wa=0;
    for i = 1:1:L+1
%         D=snx-i;
%         Sa(i)=sin(pi*D)/D;
        wa=wa + Sa(i)*wn(i);     
    end
%     Sa=Sa/pi;
    sny=wa; % *wy  * Gibbs;
%     if sny>1,sny=1;end
end

