%   Train in MIMO SNN
%   MIMO SNN: Multi-Input-Multi-Output Sampling Neural Network
%
%   MIMOSNN V2.0
% 
%    Copyright 2024 Gang Cai and Lingyan Wu
% 
%    Licensed under the Apache License, Version 2.0 (the "License");
%    you may not use this file except in compliance with the License.
%    You may obtain a copy of the License at
% 
%        http://www.apache.org/licenses/LICENSE-2.0
%    
%    Unless required by applicable law or agreed to in writing, software
%    distributed under the License is distributed on an "AS IS" BASIS,
%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%    See the License for the specific language governing permissions and
%    limitations under the License.
% 
%   Link:https://github.com/unicornroland00/MIMOSNN
%
%   This code was implemented based on the following paper:
% [1] G. Cai, L.Y. Wu, Sampling Neural Network: A Novel Neural Network Based on Sampling Theorem, 2021 6th International Symposium on Computer and Information Processing Technology (ISCIPT), (2021) 717-720. http://dx.doi.org/10.1109/ISCIPT53667.2021.00151.
% [2] G. Cai, L.Y. Wu, Cycle sampling neural network algorithms and applications, The Journal of Supercomputing, (2023). http://dx.doi.org/10.1007/s11227-022-05019-9.
% [3] L. Wu, G. Cai, SNNTool: A software tool for sampling neural networks algorithms implementation, SoftwareX, 24 (2023).https://doi.org/10.1016/j.softx.2023.101574


close all;
clear all;
clc;

addpath('.\scr');           %add source path
load '.\tutorials\Init2x2y.mat';        %load dataset

%% initialization
TraiHist=[];                %results recorder

%%%%%%     WIB,WO,WSN,Sa,V/C(Xu),FlagObjFun
Flag=     [1 ,  1, 0,  1 ,  1   ,    1    ];
% WsnFlag=   /0/   1   2   3       4       5       6       7   8
% WSN        /0/   log tan tanh    ELU    ReLU     step    1   0

% parameters
Cara=[20,   %S                 Cara(1)
    10,     %Sk                Cara(2)
    0,      %XuC               Cara(3)
    1,      %M in sinx         Cara(4)
    0.01,   %learn rate        Cara(5)
    0.01,   %alph: lower limit of error                    Cara(6)
    100,    %Ntrai: upper limit of training times          Cara(7)
    100,    %Mtrai: upper limit of training times          Cara(8)
    2,      %N_Input:input number               Cara(9)
    2,      %N_Output:output number             Cara(10)
    100,     %N_SN:neurons number                Cara(11)
    1       %SFlag=1;            % %SFlag=   2       1     Cara(12)
                                % %SaFun=   SaFun   SaSFun 
    0       %N_SN: pre N_SN                     Cara(13)
    ];   
N_SN_num=Cara(11);Sk=Cara(2);
WIBO; %weights initialization
Wsn;  %neurons weights initialization
dataMax=10000; % number of dataset 
epochMax=10;

pic2x;          %results analysis, and drawing
TraiHist=[TraiHist;[0 0 TDev TTE PDev PTE]];%results record

%% training
    tic;% timer start
    for epoch=1:1:epochMax  %epoch
%         tic;  % timer start
        %training 
        for k=1:1:dataMax
            %data from other benchmark fucntions in benFunS
%             x1=rand(); x2=rand(); x=[x1 x2];
%             Input=x; benFunS; Output=scores;  % 

            %data from dataset
            Input=Traindata(k,1:2);        Output=Traindata(k,3:4);
            % train
            [W_I,W_O,W_sn,Hist]=Train(W_I,B,W_O,W_sn,Input,Output,Cara);
        end
        T=toc;          %timer record
        pic2x;          %results analysis, and drawing
        
        TraiHist=[TraiHist;[epoch T TDev TTE PDev PTE]];%results record
        
        %desplay
        disp(['MIMO SNN: epoch=' ,int2str(epoch), ';  ',int2str(10000*PDev) ]);         
        % save the mat file
%        str=[ int2str(epoch),'data.mat'];
    end             %end epoch
    
    %% save the mat file
%     str='data.mat';
%     save(str);
    
    figure(1);surf(OUT1);       %fitted ackleyn, network output 1
    figure(2);surf(OUT2);       %fitted adjiman, network output 2
    
    % system('shutdown -s');    %shut down the computer
        