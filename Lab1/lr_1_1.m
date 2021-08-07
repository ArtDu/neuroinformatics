% Вариант 11
% Дубинин А. О.
% группа М80-407Б-17
%1.1
P = [-3.9  4.5  0.8  2.5   0 3.9;
     -0.1 -1.6 -2.8 -2.5 1.9 4.5];
T = [0 1 0 0 0 1];

%1.2
net = newp([-5 5; -5 5], [0 1]); % построили сеть
display(net); % информация о сети в консоль
view(net); % сеть на экран

%1.3.1
% инициализировали сеть случайными значениями
net.inputWeights{1,1}.initFcn = 'rands'; % весовые коэффициенты
net.biases{1}.initFcn = 'rands'; % смещения
net = init(net);
disp('1.3.1: ');
disp('IW: ');
disp(net.IW{1,1});
disp('b : ');
disp(net.b{1});

% plotpv(P, T); % рисуем точки
% line1 = plotpc(net.IW{1}, net.b{1}); % рисуем прямую
% set(line1, 'Color', 'r');
% grid; % рисуем сетку
% hold on;

%1.3.2
% Выполняем 2 итерации алгоритма Розенблатта
net = Rosenblatt(net, P, T, 2, 0.3);

%1.3.3
% % line2 = plotpc(net.IW{1}, net.b{1}); % рисуем прямую
% % set(line2, 'Color', 'r');

%1.4.1
net = init(net);
disp('1.4.1: ');
disp('IW: ');
disp(net.IW{1,1});
disp('b: ');
disp(net.b{1});

%1.4.2
% Выполним 50 итераций с помощью функции train
net.trainParam.epochs = 50;
net = train(net, P, T);

disp('После 50 итераций:')
disp('Веса : ');
disp(net.IW{1,1});
disp('Смещения: ');
disp(net.b{1});

%1.4.3
% создаем набор тестовых точек
testpoints = 5 * rand(2,3);
testclasses = net(testpoints);

% рисуем их
plotpv(testpoints, testclasses);
point = findobj(gca,'type','line');
set(point,'Color','red');
hold on
plotpv(P, T)
plotpc(net.IW{1},net.b{1});
grid on
hold off



