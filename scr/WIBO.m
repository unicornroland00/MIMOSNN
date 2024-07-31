%%  weights initialization
% if N_Input=2, Flag(1)=1. It's a test program;else Flag(1)>1

% L=Cara(1);N=Cara(2);Xu=Cara(3);M=Cara(4);
% learn=Cara(5); alph=Cara(6);   Ntrai=Cara(7);   Mtrai=Cara(8);
% N_Input=Cara(9);N_Output=Cara(10); N_SN= Cara(11);SFlag= Cara(12);

% W_I  =2*(rand(Cara(9),Cara(11))-0.5);    % random initialization
B   = zeros(1,Cara(11));
W_O=0.1*rand(Cara(11),Cara(10));    % random initialization
if Flag(1)==1
    W_I  =2*(rand(Cara(9),Cara(11))-0.5);    % random initialization
%     B   = zeros(1,Cara(11));
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
end

if Flag(1)==2
    W_I  =rand(Cara(9),Cara(11));    % random initialization
%     B   = zeros(1,Cara(11));
    for j=1:1:Cara(11)
        S=sum(W_I(:,j));
        W_I(:,j)=W_I(:,j)/S;
    end
end

if Flag(1)==3
    W_I  =2*(rand(Cara(9),Cara(11))-0.5);    % random initialization
%     B   = zeros(1,Cara(11));
    
    for j=1:1:Cara(11)
        Ap=0;An=0;H=0;b=0;
        for i=1:1:Cara(9)
            if W_I(i,j)>0 
                Ap=Ap+W_I(i,j);            
            end
            if W_I(i,j)<0 
                An=An+W_I(i,j);            
            end    
        end
        H=(Ap-An+1e-5);
        if H >1 
            W_I(:,j)=W_I(:,j)/H;
            B(j)=-An/H;  
        end
        if H<1
            B(j)=-An;
        end
    end
end


