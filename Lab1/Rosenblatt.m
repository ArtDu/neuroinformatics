% 1.3
function net = Rosenblatt(net, P, T, iters, learnRate)
	for j = 1:iters
        for i = 1:6
        	p = P(:,i);
			t = T(:,i);
        	a = sim(net, p);
        	e = t - a;       
            if (mae(e))
            	net.IW{1,1} = net.IW{1,1} + p' * e * learnRate;
            	net.b{1} = net.b{1} + 1 * e * learnRate;
            end
        end
        disp(['Итерация: ', num2str(j)]);
    	disp('Ошибка: ');
        disp(mae(T - net(P)));
    	disp('Веса: ');
        disp(net.IW{1,1});
    	disp('Смещения: ');
        disp(net.b{1});
	end
end