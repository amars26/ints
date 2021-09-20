P=o1(:,1);
T=o1(:,2);

vel=length(T);  %drugacije od narx
N=4;

minulaz=min(P);
maxulaz=max(P);
minizlaz=min(T);
maxizlaz=max(T);

p=2*(P-minulaz)./(maxulaz-minulaz)-1;
t=2*(T-minizlaz)./(maxizlaz-minizlaz)-1;

ulaz=zeros(2*N,vel-N);
izlaz=zeros(1,vel-N);

for k=N:vel-1
    t=flipud(T(k-N+1:k+1));
    p=flipud(P(k-N+1:k-1));
    ulaz(:,k)=[t;p];
    izlaz(k)=P(k);
end

net=newff([zeros(2*N,1)-1 zeros(2*N,1)+1 ],[30 1],{'tansig','purelin'},'trainlm');

net.trainParam.epochs = 2000;
net.trainParam.show = 300;
net.trainParam.goal = 1e-4;

net = train(net, ulaz, izlaz);
izlaz = sim(net, ulaz);
izlaz = (izlaz+1)*(maxulaz-minulaz)./2+minulaz;

subplot(211); plot(o1(:,1)); title('Izlaz iz modela');
subplot(212); plot(izlaz); title('Nas izlaz');
gensim(net, 0.1);

