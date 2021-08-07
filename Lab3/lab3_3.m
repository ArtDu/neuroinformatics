t0 = 0;
tn = 3.5;
dt = 0.01;
n = (tn - t0) / dt + 1;

X = t0:dt:tn;
Y = sin(-2*(X.*X) + 7*X);

% 3.1
% Создаем сеть и конфигурируем под обучающее множество
net = feedforwardnet(20, 'trainoss'); % одношаговый метод секущих

net = configure(net, X, Y);

% 3.2
% Разбиваем выборку на обучающее, контрольное и тестовое подмножества
trainInd = 1 : floor(n * 0.9);
valInd = floor(n * 0.9) + 1 : n;
testInd = [];
net.divideFcn = 'divideind';
net.divideParam.trainInd = trainInd;
net.divideParam.valInd = valInd;
net.divideParam.testInd = testInd;

% 3.3
net = init(net);

% 3.4
net.trainParam.epochs = 3000;
net.trainParam.max_fail = 600;
net.trainParam.goal = 1.0e-8;

% 3.5
% Обучаем сеть
net = train(net, X, Y);

% 3.7
R = sim(net, X);

sqrt(mse(Y(trainInd) - R(trainInd)))

sqrt(mse(Y(valInd) - R(valInd)))

figure;
hold on;
plot(X, Y, '-b');
plot(X, R, '-r');
grid on;

figure;
plot(X, Y - R);
grid on;
