%%  neurons initialization

%WsnFlag=   /0/   1   2   3       4       5       6       7   8     9
%WSN        /0/   log tan tanh    ELU    ReLU     step    1   0     rand
% WsnFlag=0;
WsnFlag=Flag(3);
L=Cara(1); 
N_SN=Cara(11);
WSN =zeros(1,L+1);

%%logsig
if WsnFlag==1
    for i=1:1:L+1
        x=i-1-0.5*L;
        WSN(i)=1/(1+exp(-x) );
    end
end
%%tansig
if WsnFlag==2
    for i=1:1:L+1
        x=i-1-0.5*L;
        WSN(i)=2./(1+exp(-x) )-1;
    end
end
%%tanh
if WsnFlag==3
    for i=1:1:L+1
        x=i-1-0.5*L;
        WSN(i)=(exp(x)-exp(-x) )/(exp(x)+exp(-x));
    end
end

%%ELU
if WsnFlag==4
    for i=1:1:L+1
        x=i-1-0.5*L;
        if x<0,
            WSN(i)=exp(x)-1;
        else
            WSN(i)=x;  
        end
    end
end

%%ReLU
if WsnFlag==5
    for i=1:1:L+1
        x=i-1-0.5*L;
        if x<0,
            WSN(i)=0;
        else
            WSN(i)=x;  
        end
    end
end
%%step
if WsnFlag==6
    for i=1:1:L+1
        x=i-1-0.5*L;
        if x<0,        WSN(i)=0;end
        if x>0,        WSN(i)=1; end 
        if x==0,        WSN(i)=0.5; end
    end
end

for j=1:1:N_SN
    W_sn (j,:)=WSN ;
end

if WsnFlag==9
    W_sn =rand(N_SN,L+1) ;
end
if WsnFlag==8
    W_sn =zeros(N_SN,L+1) ;
end
if WsnFlag==7
    W_sn =ones(N_SN,L+1) ;
end

%

L=Cara(1);
