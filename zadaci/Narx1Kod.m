% modeliranje inverzne narx mreže
P = y1(:,1);
T = y1(:,2);

minulaz = min(P); maxulaz = max(P);
minizlaz = min(T); maxizlaz = max(T);

% normiranje
p = 2*(P-minulaz)./(maxulaz-minulaz)-1;
t = 2*(T-minizlaz)./(maxizlaz-minizlaz)-1;

N = 4;
vel = length(P);

% okretanje niza
for k = N+1:vel
    t1 = flipud(t(k-N:k-1));
    p1 = flipud(p(k-N:k-1));
    ulaz(:,k) = [t1;p1];
    izlaz(k) = t(k);
end

% kreiranje neuronske mreže
net = newff([-1 1; -1 1; -1 1; -1 1; -1 1; -1 1; -1 1; -1 1], [30 1], {'tansig','purelin'}, 'trainlm');

net.trainParam.epochs = 1000;
net.trainParam.goal = 2e-4;
net.trainParam.show = 300;

net = train(net, ulaz, izlaz);
izlaz = sim(net, ulaz);
izlaz = (izlaz+1)*(maxizlaz-minizlaz)./2+minizlaz;
plot(izlaz,'k'); grid on;
gensim(net, 0.1);





