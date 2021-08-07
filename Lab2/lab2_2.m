%2.1 Построение обучающего множества
%Шаг
h = 0.01;

%Задаем координаты
X = 0:h:3.5;
Y = sin((X.*X) - 15*X + 3) - sin(X);

%Последовательность входных образцов
Pn = con2seq(Y);


%2.2 Построение сети
delays = [1 2 3];
net = newlin([-1 1], 1, delays, maxlinlr(cell2mat(Pn),'bias'));

%2.3
%Инициализация
net.inputweights{1,1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net = init(net);

%2.4 Задание параметров обучения
Pi = con2seq(Y(1:3));
P = Pn(4:end);
T = Pn(4:end);

net.trainParam.epochs = 600;
net.trainParam.goal = 0.000001;
%Обучение
net = adapt(net, P, T, Pi);
net = train(net, P, T);

% 2.6
E = cell2mat(Pn) - cell2mat(sim(net, Pn));

figure
plot(X, E, 'r');

figure
referenceLine = plot(X, Y, 'r');
hold on;

predictionLine = plot(X, cell2mat(sim(net, Pn)), 'b');

legend([referenceLine,predictionLine],'Target', 'Predicted');
hold off;

%2.7
X = 0:h:13.5;
Y = sin((X.*X) - 15*X + 3) - sin(X);
Pn = con2seq(Y);

E = cell2mat(Pn) - cell2mat(sim(net, Pn));

figure
plot(X, E, 'r');

figure
referenceLine = plot(X, Y, 'r');
hold on;

predictionLine = plot(X, cell2mat(sim(net, Pn)), 'b');

legend([referenceLine,predictionLine],'Target', 'Predicted');
hold off;
