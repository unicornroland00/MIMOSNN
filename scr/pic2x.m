%% Results analysis, and drawing

for i=1:1:100
    for j=1:1:100
        k=100*(i-1)+j;            

        % test error 
        PIn= Predata(k,1:2);POut=Predata(k,3:4);
        [ POutSNN,Snx,Sny,SA ] = Forward(PIn,W_I,B,W_sn,W_O,Cara);  
        Predata(k,5:6)=POut-POutSNN;

        % test output 
        OUT1(i,j)=POutSNN(1);
        OUT2(i,j)=POutSNN(2);

        % train error 
        Trin=Traindata(k,1:2);TrOut=Traindata(k,3:4); 
        [ TrOutSNN,Snx,Sny,SA ] = Forward(Trin,W_I,B,W_sn,W_O,Cara); 
        Traindata(k,5:6)=TrOut-TrOutSNN;
    end
end

%% Results analysis
PDev=std(Predata(:,5:6),0);     %the standard deviation of test error
PTE=mean(mean(abs(Predata(:,5:6))));%the average of test error
TDev=std(Traindata(:,5:6),0);   %the standard deviation of train error
TTE=mean(mean(abs(Traindata(:,5:6))));%the average of train error


%% drawing pictures
%     figure(1);surf(OUT1);    
%     figure(2);surf(OUT2);  

% addpath('.\DATA');           %add source path
% drawing;                     %drawing