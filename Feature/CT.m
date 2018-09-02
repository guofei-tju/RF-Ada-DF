function feature=CT(protein,abc)

groups_no = 7;
protein=cell2mat(protein);
%%%%%%%%%%%%%%%%%%%% amino acid grouping  氨基酸分组 7 大类
protein=regexprep(protein,'X',''); %%%% delete unknown proteins
protein=regexprep(protein,'A|G|V','1');
protein=regexprep(protein,'C','2');
protein=regexprep(protein,'D|E','3');
protein=regexprep(protein,'I|L|F|P','4');
protein=regexprep(protein,'H|N|Q|W','5');
protein=regexprep(protein,'R|K','6');
protein=regexprep(protein,'Y|M|T|S','7');

L = length(protein);
protein_groupings_index='1234567';
protein_number_index=1:1:7;

n_ThreeContinueUnit = size(abc,1);
n_abc = zeros(n_ThreeContinueUnit,1);


for i = 1:n_ThreeContinueUnit
	t_abc_str = abc(i);
	ss = cell2mat(t_abc_str);
	idx=strfind(protein,ss);
	n_abc(i) = length(idx);
end

feature = (n_abc-min(n_abc))/max(n_abc);