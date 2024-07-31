%% BenchmarkFcns: 
% [1] M.A. Ardeh, BenchmarkFcns from https://github.com/mazhar-ansari-ardeh/BenchmarkFcns, 2016).

% addpath('.\benchmarks');%add path

FlagObjFun=Flag(5);

switch(FlagObjFun)       
    case 1
       x=x*10-0;scores = ackleyfcn(x);
    case 2
       x=x*10-5;scores = ackleyn2fcn(x);
    case 3
       x=x*10-5;scores = ackleyn3fcn(x);
    case 4
       x=x*10-5;scores = ackleyn4fcn(x);
    case 5
       x=x*10-5;scores = adjimanfcn(x);
    case 6
       x=x*10-5;scores = alpinen1fcn(x);
    case 7
       x=x*10-5;scores = alpinen2fcn(x);
    case 8
       x=x*10-5;scores = bartelsconnfcn(x);
    case 9
       x=x*10-5;scores = bealefcn(x);
    case 10
       x=x*10-5;scores = birdfcn(x);
    case 11
       x=x*10-5;scores = bohachevskyn1fcn(x);
    case 12
       x=x*10-5;scores = bohachevskyn2fcn(x);
    case 13
       x=x*10-5;scores = boothfcn(x);
    case 14
       x=x*10-5;scores = brentfcn(x);
    case 15
       x=x*10-5;scores = brownfcn(x);
    case 16
       x=x*10-5;scores = bukinn6fcn(x);
    case 17
       x=x*10-5;scores = crossintrayfcn(x);
    case 18
       x=x*10-5;scores = deckkersaartsfcn(x);
    case 19
       x=x*10-5;scores = dropwavefcn(x);
    case 20
       x=x*10-5;scores = easomfcn(x);
    case 21
       x=x*10-5;scores = eggcratefcn(x);
    case 22
       x=x*10-5;scores = eggholderfcn(x);
    case 23
       x=x*10-5;scores = exponentialfcn(x);
    case 24
       x=x*10-5;scores = goldsteinpricefcn(x);
    case 25
       x=x*10-5;scores = griewankfcn(x);
    case 26
       x=x*10-5;scores = happycatfcn(x, alpha);
    case 27
       x=x*10-5;scores = himmelblaufcn(x);
    case 28
       x=x*10-5;scores = holdertablefcn(x);
    case 29
       x=x*10-5;scores = keanefcn(x);
    case 30
       x=x*10-5;scores = leonfcn(x);
    case 31
       x=x*10-5;scores = levin13fcn(x);
    case 32
       x=x*10-5;scores = matyasfcn(x);
    case 33
       x=x*10-5;scores = mccormickfcn(x);
    case 34
       x=x*10-5;scores = periodicfcn(x);
    case 35
       x=x*10-5;scores = pichenyfcn(x);
    case 36
       x=x*10-5;scores = powellsumfcn(x);
    case 37
       x=x*10-5;scores = qingfcn(x);
    case 38
       x=x*10-5;scores = quarticfcn(x);
    case 39
       x=x*10-5;f = rastriginfcn(x);
    case 40
       x=x*10-5;scores = ridgefcn(x, d, alpha);
    case 41
       x=x*10-5;scores = rosenbrockfcn(x);
    case 42
       x=x*10-5;scores = salomonfcn(x);
    case 43
       x=x*10-5;scores = schaffern1fcn(x);
    case 44
       x=x*10-5;scores = schaffern2fcn(x);
    case 45
       x=x*10-5;scores = schaffern3fcn(x);
    case 46
       x=x*10-5;scores = schaffern4fcn(x);
    case 47
       x=x*10-5;scores = schwefel220fcn(x);
    case 48
       x=x*10-5;scores = schwefel221fcn(x);
    case 49
       x=x*10-5;scores = schwefel222fcn(x);
    case 50
       x=x*10-5;scores = schwefel223fcn(x);
    case 51
       x=x*10-5;scores = schwefelfcn(x);
    case 52
       x=x*10-5;scores = shubert3fcn(x);
    case 53
       x=x*10-5;scores = shubert4fcn(x);
    case 54
       x=x*10-5;scores = shubertfcn(x);
    case 55
       x=x*10-5;f = spherefcn(x);
    case 56
       x=x*10-5;scores = styblinskitankfcn(x);
    case 57
       x=x*10-5;scores = sumsquaresfcn(x);
    case 58
       x=x*10-5;scores = threehumpcamelfcn(x);
    case 59
       x=x*10-5;scores = xinsheyangn1fcn(x);
    case 60
       x=x*10-5;scores = xinsheyangn2fcn(x);
    case 61
       x=x*10-5;scores = xinsheyangn3fcn(x, beta, m);
    case 62
       x=x*10-5;scores = xinsheyangn4fcn(x);
    case 63
       x=x*10-5;scores = zakharovfcn(x);
    otherwise fprintf('Invalid grade\n' );
end