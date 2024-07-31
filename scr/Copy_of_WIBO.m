%%  weights initialization

L=Cara(1);N=Cara(2);Xu=Cara(3);M=Cara(4);
learn=Cara(5); alph=Cara(6);   Ntrai=Cara(7);   Mtrai=Cara(8);
N_Input=Cara(9);N_Output=Cara(10); N_SN= Cara(11);SFlag= Cara(12);

W_I  =2*(rand(Cara(9),Cara(11))-0.5);    % random initialization
B   = zeros(1,Cara(11));
for j=1:1:Cara(11)
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

W_O=0.1*rand(N_SN,N_Output);    % random initialization
