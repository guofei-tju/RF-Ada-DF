function [D2,at,DF]=Newweight(D1,T_sim_1,T_sim_2,train_y, alpha)

    error=0;
    n00=0;
    for j=1:length(train_y)        
        if T_sim_1(j) ~= train_y(j)
            error = error+ D1(j);
        end
    end
    DF=0;
    for j=1:length(train_y)         
        if T_sim_1(j) ~= train_y(j) && T_sim_2(j) ~= train_y(j)              
            n00= n00 +1;
            DF=n00/length(train_y);
            
        end
    end    
    
    b =(1-alpha) * error + alpha * DF;
    if b==0
        at=1;
    else 
        at =0.5*log((1-b)/b);
    end
          
    
    
    for j=1:length(train_y)
       D2(j)=D1(j)*exp(-at*train_y(j)*T_sim_1(j));
    end
    
    D2=D2/sum(D2);
    
end
