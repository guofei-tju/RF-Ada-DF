clear all
clc

load('data.mat')
nfolds =5; nruns=1;
crossval_idx = crossvalind('Kfold',data_y,nfolds);
Result=[];
K=10;
nTree=10;
for fold = 1:nfolds  
 test_idx  = find(crossval_idx==fold);
 test_x=data_x(test_idx,:);
 test_y=data_y(test_idx,:);
 train_idx  = find(crossval_idx~=fold);
 train_x=data_x(train_idx,:);
 train_y=data_y(train_idx,:);  
for i=1:length(train_y) 
   if train_y(i)==2
       train_y(i)=-1;
   else
        train_y(i)=1;
   end
 end
 for i=1:length(test_y)
 if test_y(i)==2
      test_y(i)=-1;
   else
        test_y(i)=1;
    end    
end

[weight,Factor_f] = RFadaboost(train_x,train_y,K,nTree);
[label,score] = test(weight,Factor_f,test_x,K,nTree);

[Y1,X1,THRE,AUC,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(test_y, score(:,2),'1');
[Y1,X1,TPR,AUPR] = perfcurve(test_y,(score(:,2)),1,'xCrit','reca','yCrit','prec');
[ACC,SN,SP,PRECISION,over_NPV,F1,MCC] = roc(label,test_y);    
Result = [Result;[fold,ACC, AUC, AUPR, F1, MCC, SP, SN, PRECISION]];
end
