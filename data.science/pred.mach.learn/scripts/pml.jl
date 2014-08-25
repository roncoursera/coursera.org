
using DataFrames
using DecisionTree

datadir="/projects/coursera.org/data.science/pred.mach.learn/data/"
submitdir="/projects/coursera.org/data.science/pred.mach.learn/data/"

# load data
dftrain = readtable(datadir*"pml-training.csv");
size(dftrain) # (19622,160)

# select features
labels=array(dftrain[:classe]); 
#  Set(labels) # ({"B","A","C","D","E"})

# filter out NA columns; Strangely NA for whole column
idx=[sum([isequal(dftrain[j,i],NA) for j in 1:size(dftrain,1)]) for i in 1:size(dftrain,2)];
idx=idx.==0;
dftrain2=dftrain[:,idx];
size(dftrain2) # (19622,93)

# filter out "" columns; Strangely "" for whole column
idx2=[sum(dftrain2[:,i].=="") for i in 1:size(dftrain2,2)];
idx2=idx2.==0;
dftrain3=dftrain2[:,idx2];
size(dftrain3) # (19622,60)

# skip non-numeric features
features=array(dftrain3[:,8:(end-1)]);

# select model
nfeatures=int(size(features)[2]^0.5) # 7
ntrees=10;
accuracy=nfoldCV_forest(labels, features, nfeatures, ntrees, 3);
println ("3 fold accuracy: $(mean(accuracy))")
# 3 fold accuracy: 0.982670744138634

model = build_forest(labels, features, nfeatures, ntrees);
predictions=apply_forest(model, features);
confusion_matrix(labels, predictions)

# ntrees=100;

# test data
dftest = readtable(datadir*"pml-testing.csv");
idx=[sum([isequal(dftest[j,i],NA) for j in 1:size(dftest,1)]) for i in 1:size(dftest,2)];
idx=idx.==0;
dftest2=dftest[:,idx];
size(dftest2) # (20,93)

# filter out "" columns; Strangely "" for whole column
idx2=[sum(dftest2[:,i].=="") for i in 1:size(dftest2,2)];
idx2=idx2.==0;
dftest3=dftest2[:,idx2];
size(dftest3) # (20,60)

# test column name similarity
# last column in test data is "problem id"
# last column in training data is "classe"
# otherwise should be the same
sum(names(dftest3[1:(end-1)]).!=names(dftrain3[1:(end-1)])) # 0 <- no differnces

# skip non-numeric features
tfeatures=array(dftest3[:,8:(end-1)]);
preds=apply_forest(model, tfeatures);

#=
20-element Array{Any,1}:
 "B"
 "A"
 "B"
 "A"
 "A"
 "E"
 "D"
 "B"
 "A"
 "A"
 "B"
 "C"
 "B"
 "A"
 "E"
 "E"
 "A"
 "B"
 "B"
 "B"
=#

# =======================================
# output from the learning run n=10
# =======================================
#=
Fold 1
Classes:  {"A","B","C","D","E"}
Matrix:   [1821 9 0 0 0
 14 1252 13 5 0
 0 21 1116 6 1
 1 3 24 1043 2
 0 1 9 6 1193]
Accuracy: 0.9824159021406728
Kappa:    0.9777799600943328

Fold 2
Classes:  {"A","B","C","D","E"}
Matrix:   [1847 8 1 0 0
 4 1241 14 1 0
 3 17 1136 7 0
 3 5 23 999 0
 3 12 3 8 1205]
Accuracy: 0.982874617737003
Kappa:    0.9783323301347331

Fold 3
Classes:  {"A","B","C","D","E"}
Matrix:   [1886 5 0 3 0
 16 1225 11 0 0
 0 20 1092 3 0
 0 3 37 1070 2
 0 5 2 6 1154]
Accuracy: 0.9827217125382263
Kappa:    0.9781151915253892

Mean Accuracy: 0.982670744138634
=#

# =======================================
# Confusion Matrix
# =======================================
#=
Classes:  {"A","B","C","D","E"}
Matrix:   5x5 Array{Int64,2}:
 5580     0     0     0     0
    2  3795     0     0     0
    0     4  3418     0     0
    0     0     6  3210     0
    0     0     1     3  3603
Accuracy: 0.9991845887269392
Kappa:    0.9989686241058846
=#