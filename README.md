# RF-Ada-DF
Codes and Datasets of paper RF-Ada-DF: An integrated predictor for identifying protein-protein interactions''


No 1. Feature extration


     We construct a sequence-based feature vector to represent each pair of protein by CT, GE, MMI and NMBAC,
     their feature numbers are 686, 300, 238 and 400 respectively.
     
     
No 2. Classifier
     
     
     Datasets: Matine.mat, Yeast.mat, Human.mat, C.elegan.mat, E.coli.mat, Hpylo.mat, Hsapi.mat, park_yeast
     and park_human. All datasets have 638-dimentional features by MMI and NMBAC.
     
     
     RF-Ad-DF: RFadaboost.m, we embed RF into AdaBoost framework, and Newweight.m calculate the training error
     and DF value to update the sample weights. The test.m bring the test set into the trained model and roc.m get 
     the classified indicators.
     
     
     Because some datasets are too large to upload,  if necessary you can connect me: fguo@tju.edu.cn.
