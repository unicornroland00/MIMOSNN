# MIMOSNN 
MIMOSNN is an efficient utility designed for researchers and developers, providing tool for building, training, and using Multi-Input-Multi-Output Sampling Neural Network and Wide Learning. MIMO SNN is a new neural network algorithm with high accuracy, fast convergence, low computational burden, and reliability. The tool not only provides a simple and user-friendly programming interface, but also has parameters array to flexibly control the structure and parameters of neural networks. 

# How to install
This toolkit runs on MATLAB R2020a or newer in Microsoft Windows.
To install and use this tool, it is just required to add the project folders to MATLAB's works folder. 

# How to use MIMOSNN 
The MIMOSNN source code is written entirely in Matlab. 

there are two entry main files：
MIMO_SNN_Main is the main code of MIMO SNN. 
WL_Main is the main code of Wide Learning. 

WIBO is the initialization file about the input weights, output weights, and bias, that is W^((1)), W^((2)),  B^((1)) and B^((2)). 
The initialization file about the wide expand weights is wwrifun. 
The Wsn file is the initialization file about the weights of the SISO SNN neurons, W^SN. 
The Forward function realizes the forward operation of the network in Eq. (5). 
The SNN_forward function realizes the forward operation of the SISO SNN neurons in Eq. (2). 
The computer of C_"i,n"  is in the SaFun file. 
Train file is the training process about the network in Eq. (8). 
Train _SNN file is the training process about the SISO SNN neurons in Eq. (9). 

# Notes 
(1) The prepare the training dataset for MIMO SNN is Init2x2y.mat. User can use own dataset by changing the default file and options.

(2) For SISO SNN, Input and output  data preprocessing requires normalization and normalization of the data. Among them, the output data are normalized, but it must be stated here that for the SNNS algorithm, there is no restriction on the output, so it does not necessarily need to be normalized, and the normalization is only used here to better maintain the unity of the overall program. For the input data, according to the characteristics of SNNs, it is necessary to normalize and map all the data to [1,N], the reason why it is necessary to start from 1 is because Matlab's array index starts from 1, in order to better match and facilitate the program, so all the inputs are set to be greater than 1. The range of the data is set to N, in order to correspond better with the weights, and at this time, the weights are located in the sampling point is exactly an integer point The data range is set to N to better correspond to the weights, which are sampled at integer points.

(3) In the calculation of C_"i,n" , a normalization process was used for a better programming implementation. Normalization is also used in weight initialization in WIBO.m. 

(4) Networks can also apply to other systems or objects, benFunS give the Benchmarks from "Benchmarkfcns" .


# Support 
Website: https://github.com/unicornroland00/MIMOSNN  (Recommended options).
Or send an email to GangCai@gnnu.edu.cn (Gang Cai) to report issues and bugs. 
Any bug reports, code contributions, suggestions, feedback and insights are immensely appreciated and will support this project.

# Copyright 
    Copyright 2024 Gang Cai and Lingyan Wu
 
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
 
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
 
   Link: https://github.com/unicornroland00/MIMOSNN

   This code was implemented based on the following paper, 
   
 [1] G. Cai, L.Y. Wu, Sampling Neural Network: A Novel Neural Network Based on Sampling Theorem, 2021 6th International Symposium on Computer and Information Processing Technology (ISCIPT), (2021) 717-720. http://dx.doi.org/10.1109/ISCIPT53667.2021.00151.
 
 [2] Cai, G., Wu, L. Cycle sampling neural network algorithms and applications. J Supercomput 79, 9889–9914 (2023). https://doi.org/10.1007/s11227-022-05019-9
 
 [3] L. Wu, G. Cai, SNNTool: A software tool for sampling neural networks algorithms implementation, SoftwareX, 24 (2023).https://doi.org/10.1016/j.softx.2023.101574
 
   Please cite paper by those who have referenced the code. Thanks!
