% 3.1 
P =[ 3.9 -4.6  2.7 -3.3 -2.9   4   -4 -4.5;
    -4.1  0.5 -1.9 -1.7  0.1 1.2 -1.1    0 ];
T = [0 1 0 0 1 1 0 1;
     1 0 1 0 0 1 0 0];

% 3.2
net = newp([-5 5; -5 5], 2);
view(net);

% 3.3
net.inputWeights{1,1}.initFcn = 'rands';
net.biases{1}.initFcn         = 'rands';
net = init(net);
disp('3.3: ');
disp('IW: ');
disp(net.IW{1,1});
disp('b: ');
disp(net.b{1});

% 3.4
net.trainParam.epochs = 50;
net = train(net, P, T);
disp('Веса: ');
disp(net.IW{1,1});
disp('Смещения : ');
disp(net.b{1});

% plotpv(P, T);
% plotpc(net.IW{1}, net.b{1});
grid;


% 3.5
testpoints = 5*rand(2,5);
testclasses = net(testpoints);
plotpv([P testpoints], [T, testclasses]); 
point = findobj(gca,'type','line');
set(point,'Color','red');
hold on
plotpv(P, T);
plotpc(net.IW{1}, net.b{1});
hold off