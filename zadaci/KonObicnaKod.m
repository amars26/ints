P=y(:,1);
T=y(:,2);

minulaz=min(P);
maxulaz=max(P);
minizlaz=min(T);
maxizlaz=max(T);

vel=length(T);
N=4;

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

net=newff([zeros(2*N,1)-1 zeros(2*N,1)+1],[30 1],{'tansig','purelin'},'trainlm');
net.trainParam.epochs=2000;
net.trainParam.goal=1e-4;
net.trainParam.show=300;

net=train(net,ulaz,izlaz);

izlaz=sim(net,ulaz);
izlaz=(izlaz+1)*(maxulaz-minulaz)./2+minulaz;

subplot(211)
plot(y(:,1));
subplot(212)
plot(izlaz);


gensim(net,0.1);


