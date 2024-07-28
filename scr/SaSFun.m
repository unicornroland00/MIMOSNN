function [ Sa ] = SaSFun(snx,L)
%%Sa function with optimization

Sa=zeros(1,L+1);
F=floor(snx);
if F==0,F=1;end
C=abs(snx-F);
SC=abs(sin(pi*C));% SC=abs(sin(pi*(sx-F)));
SCdpi=SC/pi;

if C<0.01,
    Sa(F)=1;
elseif C>0.99,    
    Sa(F+1)=1;
else
    sign=1;
    for i = 1:1:L+1        
        D=snx-i;
        sign=(-1)*sign;
        Sa(i)=sign/D;
               
    end
    Sa=Sa*SCdpi;
    if Sa(F)<0  Sa=Sa*(-1);end
end

