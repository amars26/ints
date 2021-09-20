t=0:0.1:3;
funkcija=(3/2)*cos(t);
plot(t,funkcija);

x=randi([0 30]);

f_x=funkcija(x);

uslov=1;
zastavica=true;

if zastavica==true
    
    ni=0.01;
    z=randi([-1 1]);
    delta=ni*z;
    xPrim=int8(delta+x);
    
    f_xPrim=funkcija(xPrim);
    
    d=f_xPrim-f_x;
    T=0.1
    p=1/(1+exp(-d/T));
    
    z_novo=randi([0 1]);
    
    if z_novo<p
       x=xPrim;
    end
    
    T=0.1-0.01;
    
    if uslov==1000
        zastavica=false;
    end
    
    uslov=uslov+1;
    
end

kor1=double(x)/1000;
kor2=3/2;
text(kor1,kor2,f,'\leftarrow Maximum');