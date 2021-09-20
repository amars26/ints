%NARX
%10 koraka

%1
P=y(:,1);
T=y(:,2);

%2
vel=length(P);
N=4;

%3
minulaz=min(P);
maxulaz=max(P);
minizlaz=min(T);
maxizlaz=max(T);

%4
p=2*(P-minulaz)./(maxulaz-minulaz)-1;
t=2*(T-minizlaz)./(maxizlaz-minizlaz)-1;

%5

for k=N+1:vel
    t1=flipud(t(k-N:k-1));
    p1=flipud(p(k-N:k-1));
    ulaz(:,k)=[t1;p1];
    izlaz(k)=t(k);
end

%6

net=newff([-1 1;-1 1;-1 1;-1 1;-1 1;-1 1;-1 1;-1 1],[30 1],{'tansig','purelin'},'trainlm');
net.trainParam.epochs=1000;
net.trainParam.goal=2e-4;
net.trainParam.show=300;

%7
net=train(net,ulaz,izlaz);

%8
izlaz=sim(net,ulaz);
izlaz=(izlaz+1)*(maxizlaz-minizlaz)./2+minizlaz;

%9
plot(izlaz)

%10
gensim(net,0.1);
