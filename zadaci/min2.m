[x,y]=meshgrid(-5:0.1:5,-5:0.1:5);
z=x.^2+y.^2;
surf(x,y,z);

[x,f,m,n,k,v]=ga(@(x) x(1).^2+x(2).^2,2);
text(x(1),x(2),f,'\leftarrow Minimalna vrijednost');
grid on;

r=min(z);
h=min(r)

