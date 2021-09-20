x=-50:1:50;
z=5*sin(2*x);
plot(z);
[x,f,m,n,k,v]=ga(@(x) 5*sin(2*x(1)),1);
text(x,f,'\leftarrow Minimalna vrijednost');
axis([-6 110 -6 6])
grid on;
r=min(z);
h=min(r)