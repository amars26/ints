P =[y(:, 1)];
T =[y(:, 2)];
plot(P, T);

vel = length(P);
minulaz = min(P);
maxulaz = max(P);
minizlaz = min(T);
maxizlaz = max(T);

p = 2*(P-minulaz)./(maxulaz-minulaz)-1;
t = 2*(T-minizlaz)./(maxizlaz-minizlaz)-1;
N = 2; %broj ulaza

for k = N+1:vel
 t1 = flipud(t(k-N:k-1)); %okrece niz
 p1 = flipud(p(k-N:k-1));
 ulaz(:, k) = [t1; p1];
 izlaz(k) = t(k);
 
 end
ulaz 
izlaz
net = newff([-1 1; -1 1; -1 1; -1 1], [15 1], {'tansig', 'purelin'},'trainlm');
fprintf('pocetak treniranja');
net.trainParam.show = 300;
net.trainParam.epochs = 2000;
net.trainParam.goal = 2e-4;
net.trainParam.time = Inf;
net.performFcn = 'sse';
tic
net = train(net, ulaz, izlaz);
toc
izlaz = sim(net, ulaz);
izlaz = (izlaz+1)*(maxizlaz-minizlaz)./2+minizlaz; %vraca iz normiranja
plot(izlaz, 'g');
title('Podaci dobiveni sa treniranom mrezom');
xlabel('uzorci');
ylabel('amplituda'); 
gensim(net, 0.1)
