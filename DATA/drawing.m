clear all;
%% drawing

%% Fig3
% load('BP_S100_E1000.mat');
% [H1]=plot (TraiHist(2:1001,1),TraiHist(2:1001,6:8));

% load('MIMO_SNN_Ns-S100E10.mat');  
% [H1]=semilogy (TraiHist(1:11,1),TraiHist(1:11,2:4));

% load('SNN_Ns10S100E10.mat');  
% [H1]=semilogy (TraiHist(1:11,1),TraiHist(1:11,6:8));
% load('SNN_Ns50S100E10.mat');  
% [H1]=semilogy (TraiHist(1:11,1),TraiHist(1:11,6:8));


%  xlabel('Epoch','FontWeight','bold','fontsize',18);




%% Fig4
% load('data_ELM_S10-300.mat');
% [H1]=plot (Ehis(1:30,1),Ehis(1:30,6:8));

% load('data_SNN_Ns10S10-300E10.mat');
% [H1]=plot (TraiHist(1:30,1),TraiHist(1:30,3:5));

% load('WL_Ns10S10-300E1.mat');
% [H1]=plot (TraiHist(2:30,1),TraiHist(2:30,6:8));
% load('WL_Ns10S10-300E10.mat');
% [H1]=plot (TraiHist(2:30,1),TraiHist(2:30,6:8));%semilogy

% load('WL_Ns50S10-300E1.mat');
% [H1]=plot (TraiHist(2:30,1),TraiHist(2:30,6:8));
% load('WL_Ns50S10-300E10.mat');
% [H1]=plot (TraiHist(2:30,1),TraiHist(2:30,6:8));


% xlabel('S','FontWeight','bold','fontsize',18);

% ylabel('|RE| (%)','FontWeight','bold','fontsize',15);
% set(gca,'FontName','TimesNewRoman','FontWeight','bold','LineWidth',2.0,'color','white','fontsize',15);%'FontSize',12,
set(gca,'FontName','TimesNewRoman','LineWidth',3.0,'color','white','fontsize',15);%'FontSize',12,
set(H1(1),'LineStyle','--','LineWidth',3)%对应第一条曲线的线性y1
set(H1(2),'LineStyle','--','Marker','+','LineWidth',3)%对应第一条曲线的线性y1
set(H1(3),'LineStyle',':','Marker','.','LineWidth',3)%对应第一条曲线的线性y1

L1=legend([H1(1),H1(2),H1(3)],'Dev1','Dev2','Ave','Location','North');  %加注图例
set(L1,'Box','off','fontsize',15);


% Fig3(b)
% L1=legend([H1(1),H1(2),H1(3)],'Ns=10','Ns=20','Ns=50','Location','North');  %加注图例
% set(L1,'Box','off','fontsize',15);
