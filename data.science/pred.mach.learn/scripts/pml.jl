
using DataFrames
using Di

datadir="/projects/coursera.org/data.science/pred.mach.learn/data/"
submitdir="/projects/coursera.org/data.science/pred.mach.learn/data/"

# load data
df = readtable(datadir*"pml-training.csv");
size(df) # (19622,160)

# select features
labels=array(df[:classe]); # ({"B","A","C","D","E"})

# bunch of NA columns; Strangely NA for whole column
idx=[sum([isequal(df[j,i],NA) for j in 1:19622]) for i in 1:160];
idx=idx.==0;
df2=df[:,idx];
size(df2) # (19622,93)

# bunch of "" columns; Strangely "" for whole column
idx2=[sum(df2[:,i].=="") for i in 1:93];
idx2=idx2.==0;
df3=df2[:,idx2];
size(df3) # (19622,60)

features=array(df3[:,8:(end-1)]);

# select model
nfeatures=int(size(features)[2]^0.5) # 12
ntrees=10;
accuracy=nfoldCV_forest(labels, features, nfeatures, ntrees, 3);
println ("3 fold accuracy: $(mean(accuracy))")
