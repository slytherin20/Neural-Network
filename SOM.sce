x=[1 1 0 0;0 0 0 1;1 0 0 0;0 0 1 1];
m=0.5;                        //constant variable
c=0.6;                       //learning rate
w=[0.2 0.6 0.5 0.9;0.8 0.4 0.7 0.3];
size_of_x=size(x,"r");
size_of_w=size(w,"r");
no_of_epochs=100;
n=length(w)/size_of_w;                     //no. of components of weight vector
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
            else
                w(s+1,:)=w(s+1,:)+c*(x(p,:)-w(s+1,:));
            end        
        end      
    end    
    c=m*c;                                                    //learning rate is updated
      
end
