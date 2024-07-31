function  [W_sn,tr_e,tr_times]=train_SNN(snx,y, W_sn,Sa, Cara );
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
% L=length(wxn);

L=Cara(1);N=Cara(2);Xu=Cara(3);M=Cara(4);
learn=Cara(5);         alph=Cara(6);   Ntrai=Cara(7);   Mtrai=Cara(8);

tr_times=0; tr_e=0;
%在采样节点上，直接赋值。
F=floor(snx);
C=abs(snx-F);
if C<0.01
    W_sn(F)=y;
elseif C>0.99    
    W_sn(F+1)=y;
else
    dW_sn =zeros(1,L+1) ;
    eTrailflag=0;
    while eTrailflag<Mtrai,
        
         %正向计算，得到误差        
        [out] = SNN_forward(snx,W_sn,Sa,L);  
        e=y-out;
        betel=1*e*learn;
        if eTrailflag==0,
            Ek=abs(e*alph);            
        end
        
        %反向计算，调整权值
        if abs(e)>Ek  && abs(e)>0.0001,%
            for k=1:1:L+1
                dW_sn(k)=betel*Sa(k);
                if dW_sn(k)>0.1,dW_sn(k)=0.1;end
                if dW_sn(k)<-0.1,dW_sn(k)=-0.1;end
                W_sn(k)=W_sn(k)+dW_sn(k);
                if W_sn(k)>1,W_sn(k)=1;end
                if W_sn(k)<-1,W_sn(k)=-1;end
            end
            eTrailflag=eTrailflag+1;
        else
            tr_times=eTrailflag;
            tr_e=e;
            eTrailflag=Mtrai;
        end     
    end
    
    
end