function [weight,Factor_all] = RFadaboost(train_x,train_y,K,nTree)
Factor_all = [];
    
    [mm,nn]=size(train_x);
    D1=ones(1,mm)/mm;
   
    eval([' [Factor_f' num2str(1) ']=TreeBagger(nTree,train_x,train_y);']);
    eval(['save ' 'trainTree\Factor_f' num2str(1) '.mat Factor_f' num2str(1)] )

    eval(['[T_sim_' num2str(1) ',Scores_f' num2str(1) ']=predict(Factor_f' num2str(1) ',train_x); ']);
    eval(['T_sim_' num2str(1) '= str2double(T_sim_' num2str(1) '); ']);

      error=0;
        for j=1:length(train_y)        
            if T_sim_1(j) ~= train_y(j)
                error = error+ D1(j);
            end
        end
        if error==0
            at1=1;
        else
            at1 =0.5*log((1-error)/error); 
        end
        
        for j=1:length(train_y)
           D2(j)=D1(j)*exp(-at1*train_y(j)*T_sim_1(j));
        end

        D2=D2/sum(D2);

    %第二步从第二个弱分类器开始训练
    doublefault=[0];
    weight=at1;
    eval(['save ' 'weightall\weight' num2str(1) '.mat weight'] );
    for i=2:K    
        alpha=sum(doublefault)/2;
        eval([' [Factor_f' num2str(i) ']=TreeBagger(nTree,train_x,train_y);']);
        
        eval(['[T_sim_' num2str(i) ',Scores_f' num2str(i) ']=predict(Factor_f' num2str(i) ',train_x); ']);
        eval(['T_sim_' num2str(i) '= str2double(T_sim_' num2str(i) '); ']);

        eval(['[D' num2str(i+1) ',at' num2str(i) ',DF]=Newweight(D' num2str(i) ',T_sim_' num2str(i-1)  ',T_sim_'  num2str(i) ',train_y, alpha);']);
        doublefault=[doublefault;DF];   
        eval(['weight=[weight; at' num2str(i) '];']);
    end  
    for i=2:K
    eval(['save ' 'weightall\weight' num2str(i) '.mat at' num2str(i)] )
    eval(['save ' 'trainTree\Factor_f' num2str(i) '.mat Factor_f' num2str(i)] )
   
    end
    
end
 
















    
