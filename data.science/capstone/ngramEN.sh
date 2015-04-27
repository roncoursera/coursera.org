cat en_US.blogs.txt | tr -cd '\11\12\15\40-\176' | tr '\r' ' '| tr '\n' ' ' | tr "[\'\`\´]" "\’" | sed "s/’’//g" | tr "[\"\…\»\«\„\“\”]" ":-:" | sed 's/:-://g' | tr "[\.\;\!\?]" "\n"| tr "[A-Z]" "[a-z]" | tr "[:punct:]" " " | tr "[:digit:]" " " | tr "," " " | sed 's/\s\+/ /g' | dos2unix > en_US.blogs.sentences.txt  

cat en_US.blogs.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n;) print a[i],a[i+1]}' | sort > ngrams2.sort  
uniq -c ngrams2.sort |sort -bnr  | grep -v gutenberg> en_US.blogs.ngrams2.freq; rm ngrams2.sort  
grep -v '^      1' en_US.blogs.ngrams2.freq > en_US.blogs.ngrams2.freq.trunc
grep -v '^      2' en_US.blogs.ngrams2.freq.trunc > en_US.blogs.ngrams2.freq.trunc2
  
cat en_US.blogs.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-1;) print a[i],a[i+1],a[i+2]}' | sort > ngrams3.sort  
uniq -c ngrams3.sort |sort -bnr  | grep -v gutenberg> en_US.blogs.ngrams3.freq; rm ngrams3.sort  
grep -v '^      1' en_US.blogs.ngrams3.freq > en_US.blogs.ngrams3.freq.trunc
grep -v '^      2' en_US.blogs.ngrams3.freq.trunc > en_US.blogs.ngrams3.freq.trunc2
  
cat en_US.blogs.sentences.txt  | awk '{n=split($0,a); for (i=0; ++i < n-2;) print a[i],a[i+1],a[i+2],a[i+3]}' | sort > ngrams4.sort  
uniq -c ngrams4.sort |sort -bnr  | grep -v gutenberg> en_US.blogs.ngrams4.freq; rm ngrams4.sort  
grep -v '^      1' en_US.blogs.ngrams4.freq > en_US.blogs.ngrams4.freq.trunc
grep -v '^      2' en_US.blogs.ngrams4.freq.trunc > en_US.blogs.ngrams4.freq.trunc2
  
cat en_US.blogs.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-3;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4]}' | sort > ngrams5.sort  
uniq -c ngrams5.sort |sort -bnr  | grep -v gutenberg> en_US.blogs.ngrams5.freq; rm ngrams5.sort 
grep -v '^      1' en_US.blogs.ngrams5.freq > en_US.blogs.ngrams5.freq.trunc
grep -v '^      2' en_US.blogs.ngrams5.freq.trunc > en_US.blogs.ngrams5.freq.trunc2

cat en_US.blogs.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-4;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4],a[i+5]}' | sort > ngrams6.sort  
uniq -c ngrams6.sort |sort -bnr  | grep -v gutenberg> en_US.blogs.ngrams5.freq; rm ngrams6.sort 
grep -v '^      1' en_US.blogs.ngrams6.freq > en_US.blogs.ngrams6.freq.trunc
grep -v '^      2' en_US.blogs.ngrams6.freq.trunc > en_US.blogs.ngrams6.freq.trunc2

cat en_US.blogs.ngrams2.freq.trunc2 en_US.blogs.ngrams3.freq.trunc2 en_US.blogs.ngrams4.freq.trunc2 en_US.blogs.ngrams5.freq.trunc2 en_US.blogs.ngrams6.freq.trunc2  | sort -rn > en_US.blogs.ngrams
cat en_US.blogs.ngrams | cut -b9- > en_US.blogs.ngrams.nocnt

# -----------------------

cat en_US.news.txt | tr -cd '\11\12\15\40-\176' | tr '\r' ' '| tr '\n' ' ' | tr "[\'\`\´]" "\’" | sed "s/’’//g" | tr "[\"\…\»\«\„\“\”]" ":-:" | sed 's/:-://g' | tr "[\.\;\!\?]" "\n"| tr "[A-Z]" "[a-z]" | tr "[:punct:]" " " | tr "[:digit:]" " " | tr "," " " | sed 's/\s\+/ /g' | dos2unix > en_US.news.sentences.txt  
 
cat en_US.news.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n;) print a[i],a[i+1]}' | sort > ngrams2.sort  
uniq -c ngrams2.sort |sort -bnr  | grep -v gutenberg> en_US.news.ngrams2.freq; rm ngrams2.sort  
grep -v '^      1' en_US.news.ngrams2.freq > en_US.news.ngrams2.freq.trunc
grep -v '^      2' en_US.news.ngrams2.freq.trunc > en_US.news.ngrams2.freq.trunc2
  
cat en_US.news.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-1;) print a[i],a[i+1],a[i+2]}' | sort > ngrams3.sort  
uniq -c ngrams3.sort |sort -bnr  | grep -v gutenberg> en_US.news.ngrams3.freq; rm ngrams3.sort  
grep -v '^      1' en_US.news.ngrams3.freq > en_US.news.ngrams3.freq.trunc
grep -v '^      2' en_US.news.ngrams3.freq.trunc > en_US.news.ngrams3.freq.trunc2
  
cat en_US.news.sentences.txt  | awk '{n=split($0,a); for (i=0; ++i < n-2;) print a[i],a[i+1],a[i+2],a[i+3]}' | sort > ngrams4.sort  
uniq -c ngrams4.sort |sort -bnr  | grep -v gutenberg> en_US.news.ngrams4.freq; rm ngrams4.sort  
grep -v '^      1' en_US.news.ngrams4.freq > en_US.news.ngrams4.freq.trunc
grep -v '^      2' en_US.news.ngrams4.freq.trunc > en_US.news.ngrams4.freq.trunc2
  
cat en_US.news.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-3;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4]}' | sort > ngrams5.sort  
uniq -c ngrams5.sort |sort -bnr  | grep -v gutenberg> en_US.news.ngrams5.freq; rm ngrams5.sort 
grep -v '^      1' en_US.news.ngrams5.freq > en_US.news.ngrams5.freq.trunc
grep -v '^      2' en_US.news.ngrams5.freq.trunc > en_US.news.ngrams5.freq.trunc2

cat en_US.news.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-4;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4],a[i+5]}' | sort > ngrams6.sort  
uniq -c ngrams6.sort |sort -bnr  | grep -v gutenberg> en_US.news.ngrams6.freq; rm ngrams6.sort 
grep -v '^      1' en_US.news.ngrams6.freq > en_US.news.ngrams6.freq.trunc
grep -v '^      2' en_US.news.ngrams6.freq.trunc > en_US.news.ngrams6.freq.trunc2

cat en_US.news.ngrams2.freq.trunc2 en_US.news.ngrams3.freq.trunc2 en_US.news.ngrams4.freq.trunc2 en_US.news.ngrams5.freq.trunc2 en_US.news.ngrams6.freq.trunc2  | sort -rn > en_US.news.ngrams
cat en_US.news.ngrams | cut -b9- > en_US.news.ngrams.nocnt


# -----------------------

cat en_US.twitter.txt | tr -cd '\11\12\15\40-\176' | tr '\r' ' '| tr '\n' ' ' | tr "[\'\`\´]" "\’" | sed "s/’’//g" | tr "[\"\…\»\«\„\“\”]" ":-:" | sed 's/:-://g' | tr "[\.\;\!\?]" "\n"| tr "[A-Z]" "[a-z]" | tr "[:punct:]" " " | tr "[:digit:]" " " | tr "," " " | sed 's/\s\+/ /g' | dos2unix > en_US.twitter.sentences.txt  
 
cat en_US.twitter.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n;) print a[i],a[i+1]}' | sort > ngrams2.sort  
uniq -c ngrams2.sort |sort -bnr  | grep -v gutenberg> en_US.twitter.ngrams2.freq; rm ngrams2.sort  
grep -v '^      1' en_US.twitter.ngrams2.freq > en_US.twitter.ngrams2.freq.trunc
grep -v '^      2' en_US.twitter.ngrams2.freq.trunc > en_US.twitter.ngrams2.freq.trunc2
  
cat en_US.twitter.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-1;) print a[i],a[i+1],a[i+2]}' | sort > ngrams3.sort  
uniq -c ngrams3.sort |sort -bnr  | grep -v gutenberg> en_US.twitter.ngrams3.freq; rm ngrams3.sort  
grep -v '^      1' en_US.twitter.ngrams3.freq > en_US.twitter.ngrams3.freq.trunc
grep -v '^      2' en_US.twitter.ngrams3.freq.trunc > en_US.twitter.ngrams3.freq.trunc2
  
cat en_US.twitter.sentences.txt  | awk '{n=split($0,a); for (i=0; ++i < n-2;) print a[i],a[i+1],a[i+2],a[i+3]}' | sort > ngrams4.sort  
uniq -c ngrams4.sort |sort -bnr  | grep -v gutenberg> en_US.twitter.ngrams4.freq; rm ngrams4.sort  
grep -v '^      1' en_US.twitter.ngrams4.freq > en_US.twitter.ngrams4.freq.trunc
grep -v '^      2' en_US.twitter.ngrams4.freq.trunc > en_US.twitter.ngrams4.freq.trunc2
  
cat en_US.twitter.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-3;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4]}' | sort > ngrams5.sort  
uniq -c ngrams5.sort |sort -bnr  | grep -v gutenberg> en_US.twitter.ngrams5.freq; rm ngrams5.sort 
grep -v '^      1' en_US.twitter.ngrams5.freq > en_US.twitter.ngrams5.freq.trunc
grep -v '^      2' en_US.twitter.ngrams5.freq.trunc > en_US.twitter.ngrams5.freq.trunc2

cat en_US.twitter.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-4;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4],a[i+5]}' | sort > ngrams6.sort  
uniq -c ngrams6.sort |sort -bnr  | grep -v gutenberg> en_US.twitter.ngrams6.freq; rm ngrams6.sort 
grep -v '^      1' en_US.twitter.ngrams6.freq > en_US.twitter.ngrams6.freq.trunc
grep -v '^      2' en_US.twitter.ngrams6.freq.trunc > en_US.twitter.ngrams6.freq.trunc2

cat en_US.twitter.ngrams2.freq.trunc2 en_US.twitter.ngrams3.freq.trunc2 en_US.twitter.ngrams4.freq.trunc2 en_US.twitter.ngrams5.freq.trunc2   en_US.twitter.ngrams6.freq.trunc2  | sort -rn > en_US.twitter.ngrams
cat en_US.twitter.ngrams | cut -b9- > en_US.twitter.ngrams.nocnt




# -------------------
cat en_US.twitter.sentences.txt en_US.twitter.sentences.txt en_US.twitter.sentences.txt > en_US.all.sentences.txt 

cat en_US.all.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n;) print a[i],a[i+1]}' | sort > ngrams2.sort  
uniq -c ngrams2.sort |sort -bnr  | grep -v gutenberg> en_US.all.ngrams2.freq; rm ngrams2.sort  
grep -v '^      1' en_US.all.ngrams2.freq > en_US.all.ngrams2.freq.trunc
grep -v '^      2' en_US.all.ngrams2.freq.trunc > en_US.all.ngrams2.freq.trunc2
  
cat en_US.all.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-1;) print a[i],a[i+1],a[i+2]}' | sort > ngrams3.sort  
uniq -c ngrams3.sort |sort -bnr  | grep -v gutenberg> en_US.all.ngrams3.freq; rm ngrams3.sort  
grep -v '^      1' en_US.all.ngrams3.freq > en_US.all.ngrams3.freq.trunc
grep -v '^      2' en_US.all.ngrams3.freq.trunc > en_US.all.ngrams3.freq.trunc2
  
cat en_US.all.sentences.txt  | awk '{n=split($0,a); for (i=0; ++i < n-2;) print a[i],a[i+1],a[i+2],a[i+3]}' | sort > ngrams4.sort  
uniq -c ngrams4.sort |sort -bnr  | grep -v gutenberg> en_US.all.ngrams4.freq; rm ngrams4.sort  
grep -v '^      1' en_US.all.ngrams4.freq > en_US.all.ngrams4.freq.trunc
grep -v '^      2' en_US.all.ngrams4.freq.trunc > en_US.all.ngrams4.freq.trunc2
  
cat en_US.all.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-3;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4]}' | sort > ngrams5.sort  
uniq -c ngrams5.sort |sort -bnr  | grep -v gutenberg> en_US.all.ngrams5.freq; rm ngrams5.sort 
grep -v '^      1' en_US.all.ngrams5.freq > en_US.all.ngrams5.freq.trunc
grep -v '^      2' en_US.all.ngrams5.freq.trunc > en_US.all.ngrams5.freq.trunc2

cat en_US.all.sentences.txt   | awk '{n=split($0,a); for (i=0; ++i < n-4;) print a[i],a[i+1],a[i+2],a[i+3],a[i+4],a[i+5]}' | sort > ngrams6.sort  
uniq -c ngrams6.sort |sort -bnr  | grep -v gutenberg> en_US.all.ngrams6.freq; rm ngrams6.sort 
grep -v '^      1' en_US.all.ngrams6.freq > en_US.all.ngrams6.freq.trunc
grep -v '^      2' en_US.all.ngrams6.freq.trunc > en_US.all.ngrams6.freq.trunc2

cat en_US.all.ngrams2.freq.trunc2 en_US.all.ngrams3.freq.trunc2 en_US.all.ngrams4.freq.trunc2 en_US.all.ngrams5.freq.trunc2   en_US.all.ngrams6.freq.trunc2  | sort -rn > en_US.all.ngrams
cat en_US.all.ngrams | cut -b9- > en_US.all.ngrams.nocnt


# -------------------
#create a list of uniq words in ngrams
#run that list against common.dic to find unwords
#remove unwords from ngrams

for i in `cat en_US.blogs.ngrams.nocnt`; do
	echo ${i}
done  > x
for i in `cat en_US.news.ngrams.nocnt`; do
	echo ${i}
done >> x
for i in `cat en_US.twitter.ngrams.nocnt`; do
	echo ${i}
done  >> x
sort -u x > y

comm -23 y ../common.dic.ascii > unwords.txt
comm -12 y ../common.dic.ascii > words.txt

grep -Fwvf unwords.txt en_US.blogs.ngrams.nocnt > x
mv x en_US.blogs.ngrams.nocnt

grep -Fwvf unwords.txt en_US.news.ngrams.nocnt > x
mv x en_US.news.ngrams.nocnt

grep -Fwvf unwords.txt en_US.twitter.ngrams.nocnt > x
mv x en_US.twitter.ngrams.nocnt

grep -Fwvf unwords.txt en_US.twitter.ngrams.nocnt > x
mv x en_US.twitter.ngrams.nocnt

n=0
for i in `cat words.txt`; do
	n=$(( n = n + 1 ))
	echo $n $i
done > hashword.txt




