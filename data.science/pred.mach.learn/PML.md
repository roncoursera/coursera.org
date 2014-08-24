---
title: "Practical Machine Learning: Classification on Weight Lifting Exercise Dataset"
author: "Ronald Broberg"
date: "August 24, 2014"
output: html_document
---
### Introduction

As stated in the Coursera Data Science class "*Practical Machine Learning*," 
>"Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement – a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways. More information is available from the website here: http://groupware.les.inf.puc-rio.br/har (see the section on the Weight Lifting Exercise Dataset)."[1]

Ugulino et al (2012)[2] gathered the data used in this analysis which was made available through the Coursera website at the following URLs:

https://d396qusza40orc.cloudftrainront.net/predmachlearn/pml-training.csv (training)

https://d396qusza40orc.cloudftrainront.net/predmachlearn/pml-testing.csv (test)

### Data Exploration

The training data is 12MB in size, in comma separated (csv) format. It is arranged in 19622 rows and 160 columns. Features include user names, time stamps, exercise windows, the classification label, and 152 different device measurements. Of these device measurements, however, 67 columns are marked "NA" throughout and another 33 columns contain only "" entries. Filtering these out leaves 52 device measurements.

The data is labeled with one of 5 classes marked A-E. The classes represent different ways of performing barbell lifts.


```r
# load data
using DataFrames;
dftrain = readtable(datadir*"pml-training.csv");
size(dftrain) # (19622,160)
```
### Model Selection

Given the relatively large number of features and small number of classes, I chose to use a Random Forest Classifier from Julia's[3] DecisionTree[4] package, an implemention of the ID3 algorithm. Julia is a relatively new language designed for mathematical analysis that includes multiprocessor support as a default feature and Matlab-like syntax. I ran the model on an Amazon AWS c3.xlarge instance with the SUSE Linux 11 x86_64 operating system. This instance includes 4 virtual CPUs and 7.5GB memory.

The Random Forest Classification model was run with a branching parameter set to the integer result of the square root of the number of features. Only non-empty columns of device measurements were selected as features, excluding user names, time stamps, and exercise windows. This was chosen to generalize the model to the greatest extent possible and to help avoid over-fitting. There are 52 such features available in the given dataset.

```r
nfeatures=int(size(features)[2]^0.5);
size(nfeatures,2) # 52
```
The number of trees to use in the forest was initially set to a small number (10) to reduce run time while exploring the model results.

```r
ntrees=10;
```

### Model Validation

The RFC model was tested for accuracy by running a 3-fold Cross Validation. This splits the data set into 3 equal parts and then uses each unique pair to train the model and uses remaining set to test the model.

```r
using DecisionTree;
accuracy=nfoldCV_forest(labels, features, nfeatures, ntrees, 3);
println ("3 fold accuracy: $(mean(accuracy))");
# 3 fold accuracy: 0.982670744138634
```

### Model Results

The model was run against a set of 20 lines of test data to classify each as one of the 5 exercise classes (A-E). The test data was filtered in a manner similar to that used for the training data.  Interestingly, while the training data had columns without data (""), the testing data only had NA columns. Nevertheless, save for the '*label*' column in the training dataset and the '*problem_id*' in the test dataset, both datasets had the same columns after filtering as verified by a column-by-column comparison.

```r
sum(names(dftest3[1:(end-1)]).!=names(dftrain3[1:(end-1)])) # 0 <- no differnces
```
The model was used to predict the classification of each of the 20 test cases.

```r
tfeatures=array(dftest3[:,8:(end-1)]);
model = build_forest(labels, features, nfeatures, ntrees);
preds=apply_forest(model, tfeatures);
```

The predicted results are as follows:

ID | Classification
--- | ---
1 | "B"
2 | "A"
3 | "B"
4 | "A"
5 | "A"
6 | "E"
7 | "D"
8 | "B"
9 | "A"
10 | "A"
11 | "B"
12 | "C"
13 | "B"
14 | "A"
15 | "E"
16 | "E"
17 | "A"
18 | "B"
19 | "B"
20 | "B"

[1] Coursera, "Practical Machine Learning," retrieved 2014-08-23.

https://class.coursera.org/predmachlearn-004/human_grading/view/courses/972149/assessments/4/submissions

[2] Ugulino, W.; Cardador, D.; Vega, K.; Velloso, E.; Milidiu, R.; Fuks, H. Wearable Computing: Accelerometers' Data Classification of Body Postures and Movements. Proceedings of 21st Brazilian Symposium on Artificial Intelligence. Advances in Artificial Intelligence - SBIA 2012. In: Lecture Notes in Computer Science. , pp. 52-61. Curitiba, PR: Springer Berlin / Heidelberg, 2012. ISBN 978-3-642-34458-9. DOI: 10.1007/978-3-642-34459-6_6.
http://groupware.les.inf.puc-rio.br/har#sbia_paper_section

[3] Julia, retrieved 2014-08-23, 

http://julialang.org/

[4] DecisionTree.jl, retrieved 2014-08-23, 

https://github.com/bensadeghi/DecisionTree.jl
