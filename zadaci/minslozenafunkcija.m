clc
clear 
x=0:0.1:10;

if max(x)<=5
    
    y1=sqrt(x.^3)-exp(-(sqrt(2*x)).^2);
    plot(x,y1);
    [x,f,m,n,k,v]=ga(@(x) sqrt(x(1).^3)-exp(-(sqrt(2*x(1))).^2),1);
    a=min(y1)
    
elseif max(x)>=5 && max(x)<=10
    
    y2=2*x.^2-sqrt(x-1);
    plot(x,y2);
    [x,f,m,n,k,v]=ga(@(x) 2*x(1).^2-sqrt(x(1)-1),1);
    b=min(y2)
    
    elseif max(x)>0
    
    y3=-exp(x.^2)+(x-2).^2;
    plot(x,y3);
   
    c=min(y3)
    [x,f,m,n,k,v]=ga(@(x) -exp(x(1).^2)+(x(1)-2).^2,1);
    
   end

text(x(1),f,'\leftarrow Minimum');