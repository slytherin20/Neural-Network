x=[0.4 0.2 0.1 0.3;0.9 0.8 0.2 0.6];
m=0.5;                        //constant variable
c=0.2;                       //learning rate
w=[0.9 0.7 0 0;1 0.2 0.7 0.9;0 0.1 0.4 0.3;0.3 0.6 0.8 0.7;0.6 0.3 0 0.1;1 0.2 0.3 0.4;0.6 0.7 0.8 0];
size_of_x=size(x,"r");
size_of_w=size(w,"r");
no_of_epochs=100;
n=length(w)/size_of_w;                //no. of components of weight vector
mw=[0 1 2 3 4 5 6 7 8];
figure(1);                                   //Input space
xlabel('X1');
ylabel('X2');
title('Input Space');
plot(x(1,:),x(2,:),'b.');
a=gca();
a.data_bounds=[0 0;1 1];
figure(2);                                  //Weight vector graph
xlabel('W1');
ylabel('W2');
title('Initial weight matrix');
plot(w(1,:),w(2,:),'b.',w(1,:),w(2,:),'k');
v=gca();
v.data_bounds=[-0.5 -0.5;1.5 1.5];
for k=1:no_of_epochs
    for j=1:size_of_x                  //initializing distance vector to zero
        for i=1:size_of_w
            d(j,i)=0;
        end
    end
    for p=1:size_of_x
        for j=1:size_of_w
            for i=1:n
                d(p,j)=d(p,j)+(w(j,i)-x(p,i))^2;              //Calculating Euclidean distance
            end    
        end             
        for s=1:size_of_w-1                                  //finding minimum of the distance
            if d(p,s)<d(p,s+1)
                w(s,:)=w(s,:)+c*(x(p,:)-w(s,:)); 
                dp(p,s)=1;
                dp(p,s+1)=2;
            else
                w(s+1,:)=w(s+1,:)+c*(x(p,:)-w(s+1,:));
                dp(p,s)=2;
                dp(p,s+1)=1;
            end        
        end      
    end    
    c=m*c;                                                  //learning rate is updated  
end
figure(3);                                                  //Graph for feature space
title('Self Organising Map at 100th Epoch');
 xlabel('W1');
 ylabel('W2');
 plot(w(1,:),w(2,:),'b.',w(1,:),w(2,:),'k');
 ax=gca();
ax.data_bounds=[-0.5 -0.5;1.5 1.5];
figure(4);
title('Clusters formed');                                    //Clustering graph
xlabel('X1');
ylabel('X2');
scatter(d(1,:),d(2,:));
yx=gca();
yx.data_bounds=[-2 -2;2 2];
                                                                                                                                                                               
  for g=1:size_of_x                 
        for h=1:size_of_w
            o(g,h)=0;
        end
    end
 for f=1:size_of_x
        for g=1:size_of_w
            for h=1:n
                o(f,g)=o(f,g)+(w(g,h)-x(f,h))^2;              //Calculating Euclidean distance of fixed weight
            end    
        end  
end
                                                                                                                                                                       
rows_of_d=size(d,"r");
col_of_d=size(d,"c");
figure(5);                                                            //Plotting the euclidean distance of each weight component for each input vector
title('Cluster formation');
xlabel('weight components-->');
ylabel('euclidean distance--->');
bx=gca();
bx.data_bounds=[0 0;8 2];
for i=1:rows_of_d
    for j=1:col_of_d
            if i==1
                plot(j,d(i,j),'b.');
            else
                plot(j,d(i,j),'r.');
            end     
        mtlb_hold("on");
    end 
      mtlb_hold("on");
end
