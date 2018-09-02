function feature=GE(protein,Partition_n)

groups_no = 6;
protein=cell2mat(protein);
%%%%%%%%%%%%%%%%%%%% amino acid grouping  氨基酸分组 6 大类
protein=regexprep(protein,'X|B|Z|J|O|U',''); %%%% delete unknown proteins
protein=regexprep(protein,'A|V|L|I|M|C','1');
protein=regexprep(protein,'F|W|Y|H','2');
protein=regexprep(protein,'S|T|N|Q','3');
protein=regexprep(protein,'K|R','4');
protein=regexprep(protein,'D|E','5');
protein=regexprep(protein,'G|P','6');

L_seq = length(protein);

VS_char = {'123','456';'124','356';...,
			'125','346';'126','345';...,
			'134','256';'135','246';...,
			'136','245';'145','236';...,
			'146','235';'156','234';};
	
%transform to 10 char sequences

binary_seq = [];

for i=1:10
	VS_1 = VS_char(i,1);
	vs1 = cell2mat(VS_1);
	bb = [];
	for j=1:L_seq;
		ab_str = protein(j);
		idx=strfind(vs1,ab_str);
		EXCIT_ab_char = length(idx);
		if EXCIT_ab_char>0
			bb = [bb '1'];
		else
			bb = [bb '0'];
		end
	end
	binary_seq = [binary_seq;bb];

end

%Partition
list_ll = [];
for l = 1:Partition_n
	l_part = l*floor(L_seq/Partition_n);
	list_ll = [list_ll,l_part];
end


feature = [];

for i=1:10
	rac_seq = [];
	rac_seq = binary_seq(i,:);
	for j=1:Partition_n
		ll = floor(L_seq/Partition_n);
		ss = rac_seq(1:list_ll(j));
		idx_0 = [];idx_1 = [];idx_01 = [];idx_10 = [];
		idx_0=strfind(ss,'0');
		frequence_0 = length(idx_0)/length(ss);
		
		idx_1=strfind(ss,'1');
		frequence_1 = length(idx_1)/length(ss);
		
		idx_01=strfind(ss,'01');
	
		idx_10=strfind(ss,'10');
		frequence_0_1 = (length(idx_10) + length(idx_01))/(length(ss)-1);
		
		
		feature = [feature, frequence_0, frequence_1, frequence_0_1];
		


	end




end
















