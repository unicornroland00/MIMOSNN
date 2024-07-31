function [W_I,W_O,W_sn,Hist]=Train(W_I,B,W_O,W_sn,Input,Output,Cara);
%%   train function for MIMO SNN

% N_Input=2;       N_Output=1;        N_SN=5;      
L=Cara(1);  N=Cara(2);   Xu=Cara(3);  M=Cara(4); 
learn=Cara(5);  alph=Cara(6);  Ntrai=Cara(7); Mtrai=Cara(8);
N_Input=Cara(9); N_Output=Cara(10); N_SN=Cara(11);SFlag=Cara(12); 
N_SN_num=Cara(13);
if SFlag==1     Xu=Cara(3);XuC=0;end
if SFlag==2     Xu=0;XuC=Cara(3);end

% flag=0;  

Hist=[0;0;0;0;0;];
    %---------------MIMO SNN forward operation ------------------------
    [ OutSNN,Snx,Sny,SA ] = Forward(Input,W_I,B,W_sn,W_O,Cara);%前向计算
    SX=1+Snx*(N-1)+Xu; 
    
    %-----W_I---%training----------------------------------------------
%     F=floor(SX);dsnydsnx=ones(1,N_SN);
%     for i=1:1:N_SN;
%         dsnydsnx(i)=W_sn(i,F(i)+1)-W_sn(i,(F(i)));
%     end
%     pW_I=W_I;pIn=[1 0 1 0;1 1 0 0];
    %-----W_I---%training----------------------------------------------
    
    %%error
    e=Output-OutSNN;    %1*N_Output   
    eS=sum(abs(e));      Ek=abs(eS*alph);         
    betal=1*learn*e;      %   betal2=learn*e(2);
    dSny=Sny;
   
    %---------------------------------------------------
for step=1:1:Ntrai;
%     if step==100,         keyboard;    end     %暂停调试
    if  eS>Ek  && eS>0.0001,     
                
            %-------------------W_O---%training------------------
%             dW_O=0.1*Sny'*betal;
% % %             if max(max(abs(dW_O)))>0.1 disp('dW_O>0.1');keyboard;end
%             W_O=W_O+dW_O; 
%             if max(max(abs(W_O)))>1 disp('W_O>1');keyboard;end
            
             %-------------------Sny---%training------------------             
            %dSny=5*[betal1*W_O(:,1)'+betal1*W_O(:,2)'];      
            dSny=betal*W_O';       
%             if max(max(abs(dSny)))>0.1 disp('dSny>0.1');keyboard;end

            Sny=Sny+dSny; 
%             if max(max(abs(Sny)))>5 disp('Sny>1');keyboard;end
            %-------------------W_I---%training------------------
%             dW_I=0.001*Input'*(dSny.*dsnydsnx);       

          %-----W_I---%training----------------------------------------------
          
           % %%-------------------error %-------------------
           OutSNN=Sny*W_O;
           e=Output-OutSNN; eS=sum(abs(e));
           betal=1*learn*e;            
           % %%-------------------error %-------------------
    else 
        % record
        Hist(1)=step-1; Hist(2)=e(1);%Hist(3)=e(2);
        break;
    end
end

% tr_times=step-1;Hist(1)=step-1; Hist(2)=e;
tr_times=0; tr_e=0; 
 %%--------------------W_sn--%training------------------
 for i=N_SN_num+1:1:N_SN;  %wide learning
     wsn=W_sn(i,:);     x=SX(i);     y=Sny(i);     saa=SA(i,:);

     %train each neuron by SISO SNN training
     [wsn,t_e,t_times]=train_SNN(x,y, wsn,saa, Cara );
%             if max(max(abs(wsn)))>2 disp('Sny>1');keyboard;end

    W_sn(i,:)=wsn;
    tr_times=tr_times+t_times; tr_e=tr_e+t_e;
 end
 %% --------------------W_sn--%training------------------
 
 %record
Hist(4)=tr_times; Hist(5)=tr_e/N_SN;
