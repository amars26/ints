p=0:0.5:13;
t=((1/5)*p).*(p>=0 & p<5)+1*(p>=5 & p<8)+...
    (0.25.*(p-8)+1).*(p>=8 & p<10)+...
    (((0.4-1.5)/1).*(p-10)+1.5).*(p>=10 & p<11)+...
    0.4.*(p>=11 & p<=13);

P=p;
T=t;

Pseq=con2seq(P);
Tseq=con2seq(T);

net=newelm(minmax(P),[30 1],{'tansig','purelin'},'traingdx');
net.trainParam.epochs=7000;
net.trainParam.goal=1e-4;
net.trainParam.show=100;

tic
[net,tr]=train(net,Pseq,Tseq);
toc

a=sim(net,Pseq);
b=cat(2,a{:});

time=1:length(p);
plot(time,t,'g',time,b,'r');