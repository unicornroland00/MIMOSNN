function [W_I,B ] = wwrifun( )
%wwrifun£ºrandom initialization function for expand weights

W_I=rand(2,1);
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