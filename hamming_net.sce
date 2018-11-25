clc;
clear;
e=[1 -1 -1 -1;-1 -1 -1 1];
x=[1 1 -1 -1;1 -1 -1 -1;-1 -1 -1 1;-1 -1 1 1];
w=e/2;
m=size(x,"r");
p=size(e,"r");
for i=1:m       //for the input vector
    for j=1:p      //for example vector
        net(i,j)=w(j,:)*x(i,:)'+m/2;
    end
    for j=1:p-1
        if net(i,j)>net(i,j+1)
            net1(i)=j;
        else
            net1(i)=j+1;
        end
    end                       
end

