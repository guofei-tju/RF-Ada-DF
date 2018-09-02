function [label,score] = test(weight,Factor_f,test_x,K,nTree)
score = zeros(length(test_x),2);
label = zeros(length(test_x),1);
path1 = '.\trainTree';
path_tree = [];
for i=1:K
    fasta_file_name = [path1 '\Factor_f' num2str(i) '.mat'];
    path_tree = [path_tree;cellstr(fasta_file_name)];
end
for i=1:K
     load(path_tree{i,1});
     eval(['[T_sim_1,Scores_f]=predict(Factor_f' num2str(i) ',test_x);']);
     score = score + weight(i) .* Scores_f; 
 end 
    s=sum(score,2);
    score=score/s(1,1);
 for j=1:length(test_x)
    if score(j,1)>=score(j,2)
        label(j,1)=-1;
   else
        label(j,1)=1;
    end
 end
end
