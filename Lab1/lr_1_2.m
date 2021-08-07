% 2.1
P = [-3.9  4.5  0.8  2.5   0 3.9 0;
     -0.1 -1.6 -2.8 -2.5 1.9 4.5 0];
T = [0 1 0 0 0 1 1];

net = newp([-5 5; -5 5], [0 1]); % построили сеть

% 2.2
net.inputWeights{1,1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net = init(net);
disp('2.2: ');
disp('IW: ');
disp(net.IW{1,1});
disp('b: ');
disp(net.b{1});

% 2.3
plotpv(P, T), grid
% plotpc(net.IW{1,1}, net.b{1});
% hold on;

net.trainParam.epochs = 50;
net = train(net, P, T);

plotpc(net.IW{1,1},net.b{1});
y = net(P);
disp("MAE:")
mae(T - y)
% hold off;


