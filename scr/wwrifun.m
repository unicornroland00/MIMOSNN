function [W_I,B ] = wwrifun( Cara , Flag)
%wwrifun£ºrandom initialization function for expand weights
% if N_Input=2, Flag(1)=1. It's a test program;else Flag(1)>1

if Flag(1)==1
    W_I=2*(rand(Cara(9),1)-0.5);
    j=1;
    B=0;
    if W_I(1,j)>0 && W_I(2,j)>0
         b=W_I(1,j)+W_I(2,j);
         if abs(b)>0.99, W_I(:,j)=W_I(:,j)/b;end         
    end
    if W_I(1,j)>0 && W_I(2,j)<0
        B(j)=(-1)*W_I(2,j);
        b=W_I(1,j)+B(j);
         if abs(b)>0.99, W_I(:,j)=W_I(:,j)/b;B(j)=B(j)/b;end
    end
    if W_I(1,j)<0 && W_I(2,j)>0
        B(j)=(-1)*W_I(1,j);
        b=W_I(2,j)+B(j);
         if abs(b)>0.99, W_I(:,j)=W_I(:,j)/b;B(j)=B(j)/b;end
    end    
    if W_I(1,j)<0 && W_I(2,j)<0
         b=abs(W_I(1,j)+W_I(2,j));B(j)=b;
         if abs(b)>0.99, W_I(:,j)=W_I(:,j)/b;B(j)=B(j)/b;end
    end
end



if Flag(1)==2
    W_I=rand(Cara(9),1);
    B=0;    
    S=sum(W_I);   
    W_I=W_I/S;
end

if Flag(1)==3
    W_I=2*(rand(Cara(9),1)-0.5);
    B=0;    
    Ap=0;An=0;H=0;
    for i=1:1:Cara(9)
        if W_I(i,1)>0 
            Ap=Ap+W_I(i,1);            
        end
        if W_I(i,1)<0 
            An=An+W_I(i,1);            
        end
    end
    H=Ap-An+1e-5;
    if  H >1 
        W_I(:,1)=W_I(:,1)/H;
        B=-An/H;  
    end
    if H<1
        B=-An;
    end
end