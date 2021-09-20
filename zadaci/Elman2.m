p=0:0.01:5;
t=exp(-0.2*p.^2).*sin(5.*sin(3.*p));

P=p;
T=t;

Pseq=con2seq(P);
Tseq=con2seq(T);

net=newelm(minmax(P),[30 10 1],{'tansig','tansig','purelin'},...
    'traingdx');
net.trainParam.epochs=2000;
net.trainParam.goal=1e-3;
net.trainParam.show=50;

tic
[net,tr]=train(net,Pseq,Tseq);
toc

a=sim(net,Pseq);
b=cat(2,a{:});

time=1:length(p);
plot(time,t,'m',time,b,'b');