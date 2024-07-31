function [ Sa ] = SaFun(snx,L)
%%Sa function in sinx/x

Sa=zeros(1,L+1);
F=floor(snx);
if F==0,F=1;end
C=abs(snx-F);
if C<0.01,
    Sa(F)=1;
elseif C>0.99,    
    Sa(F+1)=1;
else
    for i = 1:1:L+1
        D=snx-i;
        Sa(i)=sin(pi*D)/D;           
    end
    Sa=Sa/pi;
end

