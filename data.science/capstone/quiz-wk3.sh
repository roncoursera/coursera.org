# after ice bucket challenge louis push long wet hair eyes little
cat *.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[.;:?!()]" "\n" | tr "," " " | sed "s/ for /:/g" | sed "s/ and /:/g" | sed "s/ nor /:/g" | sed "s/ but /:/g" | sed "s/ or /:/g" | sed "s/ yet /:/g" | sed "s/ so /:/g" | sed "s/ to /:/g" | sed "s/ in /:/g"  | sed "s/ of /:/g" | sed "s/ that /:/g" | sed "s/ - /:/g" | sed "s/ from /:/g" | sed "s/ after /:/g" | sed "s/ on /:/g" |tr ":" "\n" | sed "s/ as /:/g" | sed "s/ by /:/g"| sed "s/ with /:/g" |tr ":" "\n"  > all.phrases.txt

cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[.;:?!()]" "\n" | tr "," " " | sed "s/ for /:/g" | sed "s/ and /:/g" | sed "s/ nor /:/g" | sed "s/ but /:/g" | sed "s/ or /:/g" | sed "s/ yet /:/g" | sed "s/ so /:/g" | sed "s/ to /:/g" | sed "s/ in /:/g"  | sed "s/ of /:/g" | sed "s/ that /:/g" | sed "s/ - /:/g" | sed "s/ from /:/g" | sed "s/ after /:/g" | sed "s/ on /:/g" |tr ":" "\n" | sed "s/ as /:/g" | sed "s/ by /:/g"| sed "s/ with /:/g" |tr ":" "\n"  >> all.phrases.txt

cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[.;:?!()]" "\n" | tr "," " " | sed "s/ for /:/g" | sed "s/ and /:/g" | sed "s/ nor /:/g" | sed "s/ but /:/g" | sed "s/ or /:/g" | sed "s/ yet /:/g" | sed "s/ so /:/g" | sed "s/ to /:/g" | sed "s/ in /:/g"  | sed "s/ of /:/g" | sed "s/ that /:/g" | sed "s/ - /:/g" | sed "s/ from /:/g" | sed "s/ after /:/g" | sed "s/ on /:/g" |tr ":" "\n" | sed "s/ as /:/g" | sed "s/ by /:/g"| sed "s/ with /:/g" |tr ":" "\n"  >> all.phrases.txt

cat en_US.blogs.txt | tr "[.;!?]"  "\n" | tr "[A-Z]" "[a-z]" | tr "," " " > all.sentences.txt
cat en_US.news.txt | tr "[.;!?]"  "\n" | tr "[A-Z]" "[a-z]" | tr "," " " >> all.sentences.txt
cat en_US.twitter.txt | tr "[.;!?]"  "\n" | tr "[A-Z]" "[a-z]" | tr "," " " >> all.sentences.txt

# -------------------------------------
grep "of beer"  all.sentences.txt | wc -l
grep "of pretzels"  all.sentences.txt | wc -l
grep "of soda"  all.sentences.txt | wc -l
grep "of cheese"  all.sentences.txt | wc -l
# 1376 | 10 | 111 | 430

grep "case of beer"  all.sentences.txt | wc -l
grep "case of pretzels"  all.sentences.txt | wc -l
grep "case of soda"  all.sentences.txt | wc -l
grep "case of cheese"  all.sentences.txt | wc -l
# 27 | 0 | 1 | 0

grep -w "guy\|front\|just\|bought\|pound\|bacon\|bouquet\|case" all.sentences.txt | grep "case of beer" | wc -l
grep -w "guy\|front\|just\|bought\|pound\|bacon\|bouquet\|case" all.sentences.txt | grep "case of pretzels" | wc -l
grep -w "guy\|front\|just\|bought\|pound\|bacon\|bouquet\|case" all.sentences.txt | grep "case of soda" | wc -l
grep -w "guy\|front\|just\|bought\|pound\|bacon\|bouquet\|case" all.sentences.txt | grep "case of cheese" | wc -l
# 27 | 0 | 1 | 0

#bow == 3gram  "case of beer"
#rank = "case of beer"
# -------------------------------------

grep "the most" all.sentences.txt | wc -l
grep "the best" all.sentences.txt | wc -l
grep "the universe" all.sentences.txt | wc -l
grep "the world" all.sentences.txt | wc -l
# 32829 | 39868 | 1903 | 36335

grep "mean the most" all.sentences.txt | wc -l
grep "mean the best" all.sentences.txt | wc -l
grep "mean the universe" all.sentences.txt | wc -l
grep "mean the world" all.sentences.txt | wc -l
# 25 | 4 | 3 | 305

# remove mean since in target search string
grep -w "reason\|smile\|everyday\|follow\|please" all.sentences.txt | grep "mean the most" | wc -l
grep -w "reason\|smile\|everyday\|follow\|please" all.sentences.txt | grep "mean the best" | wc -l
grep -w "reason\|smile\|everyday\|follow\|please" all.sentences.txt | grep "mean the universe" | wc -l
grep -w "reason\|smile\|everyday\|follow\|please" all.sentences.txt | grep "mean the world" | wc -l
# 1 | 0 | 0 | 87

#bow = 3gram
#2o3 = 3gram
#rank => 3gram

# -------------------------------------

grep "the smelliest" all.sentences.txt | wc -l
grep "the saddest" all.sentences.txt | wc -l
grep "the bluest" all.sentences.txt | wc -l
grep "the happiest" all.sentences.txt | wc -l
# 5 | 185 | 29 | 481

grep "me the smelliest" all.sentences.txt | wc -l
grep "me the saddest" all.sentences.txt | wc -l
grep "me the bluest" all.sentences.txt | wc -l
grep "me the happiest" all.sentences.txt | wc -l
# 0 | 0 | 0 | 45

grep -w "sunshine\|follow\|make" all.sentences.txt | grep "me the smelliest" | wc -l
grep -w "sunshine\|follow\|make" all.sentences.txt | grep "me the saddest" | wc -l
grep -w "sunshine\|follow\|make" all.sentences.txt | grep "me the bluest" | wc -l
grep -w "sunshine\|follow\|make" all.sentences.txt | grep "me the happiest" | wc -l
# 0 | 0 | 0 | 31

#bow = 3gram "me the happiest"
#2o3 = "me the happiest"
#rank = "me the happiest"

# -------------------------------------

grep "the referees" all.sentences.txt | wc -l
grep "the defense" all.sentences.txt | wc -l
grep "the players" all.sentences.txt | wc -l
grep "the crowd" all.sentences.txt | wc -l
# 65 | 1676 | 2193 | 3920

grep "but the referees" all.sentences.txt | wc -l
grep "but the defense" all.sentences.txt | wc -l
grep "but the players" all.sentences.txt | wc -l
grep "but the crowd" all.sentences.txt | wc -l
# 0 | 18| 22 | 43

grep -w "early\|observations\|bills\|game\|offense\|struggling" all.sentences.txt | grep "but the referees" | wc -l
grep -w "early\|observations\|bills\|game\|offense\|struggling" all.sentences.txt | grep "but the defense" | wc -l
grep -w "early\|observations\|bills\|game\|offense\|struggling" all.sentences.txt | grep "but the players" | wc -l
grep -w "early\|observations\|bills\|game\|offense\|struggling" all.sentences.txt | grep "but the crowd" | wc -l
# 0 | 1 | 3 | 2
 
grep -w "offense\|struggling" all.sentences.txt | grep "but the referees" | wc -l
grep -w "offense\|struggling" all.sentences.txt | grep "but the defense" | wc -l
grep -w "offense\|struggling" all.sentences.txt | grep "but the players" | wc -l
grep -w "offense\|struggling" all.sentences.txt | grep "but the crowd" | wc -l
# 0 | 1 | 1 | 0
 
grep -w "offense\|struggling" all.sentences.txt | grep "the referees" | wc -l
grep -w "offense\|struggling" all.sentences.txt | grep "the defense" | wc -l
grep -w "offense\|struggling" all.sentences.txt | grep "the players" | wc -l
grep -w "offense\|struggling" all.sentences.txt | grep "the crowd" | wc -l
# 0 } 83 | 10 | 7

#bow != 3gram 
#2o3 = "but the crowd"
#rank = "the crowd"

# -------------------------------------

grep "the movies" all.sentences.txt | wc -l
grep "the beach" all.sentences.txt | wc -l
grep "the mall" all.sentences.txt | wc -l
grep "the grocery" all.sentences.txt | wc -l
# 1183 | 3707 | 1613 | 948 
# 7234 "the movie"

grep "at the movies" all.sentences.txt | wc -l
grep "at the beach" all.sentences.txt | wc -l
grep "at the mall" all.sentences.txt | wc -l
grep "at the grocery" all.sentences.txt | wc -l
# 172 | 604 | 416 | 260
# 333 "at the movie"

grep -w "go\|romance\|date" all.sentences.txt | grep "at the movies" | wc -l
grep -w "go\|romance\|date" all.sentences.txt | grep "at the beach" | wc -l
grep -w "go\|romance\|date" all.sentences.txt | grep "at the mall" | wc -l
grep -w "go\|romance\|date" all.sentences.txt | grep "at the grocery" | wc -l
# 5 | 17 | 11 | 11 (with 'go')
# 9 "at the movie"

grep -w "romance\|date" all.sentences.txt | grep "at the movies" | wc -l
grep -w "romance\|date" all.sentences.txt | grep "at the beach" | wc -l
grep -w "romance\|date" all.sentences.txt | grep "at the mall" | wc -l
grep -w "romance\|date" all.sentences.txt | grep "at the grocery" | wc -l
# 2 | 1 | 0 | 1 (without 'go')
# 5 "at the movie"

#bow == 3gram (in 1st case)
#bow != 3gram (in 2nd case)
#2o3 = "at the beach"
#rank = "at the beach"

# -------------------------------------

grep "my horse" all.sentences.txt | wc -l
grep "my motorcycle" all.sentences.txt | wc -l
grep "my way" all.sentences.txt | wc -l
grep "my phone" all.sentences.txt | wc -l
# 145 | 22 | 4763 | 4591

grep "on my horse" all.sentences.txt | wc -l
grep "on my motorcycle" all.sentences.txt | wc -l
grep "on my way" all.sentences.txt | wc -l
grep "on my phone" all.sentences.txt | wc -l
# 9 | 6 | 2381 | 767

grep -w "pretty\|granny\|old\|bagpipes\|garage\|dust\|off" all.sentences.txt | grep "on my horse" | wc -l
grep -w "pretty\|granny\|old\|bagpipes\|garage\|dust\|off" all.sentences.txt | grep "on my motorcycle" | wc -l
grep -w "pretty\|granny\|old\|bagpipes\|garage\|dust\|off" all.sentences.txt | grep "on my way" | wc -l
grep -w "pretty\|granny\|old\|bagpipes\|garage\|dust\|off" all.sentences.txt | grep "on my phone" | wc -l
# 1 | 0 | 43 | 21 (without 'well' 'sure')

#bow == 3gram
#2of3 = "on my way"
#rank = "on my way" (on second result)

# -------------------------------------

grep "some years" all.sentences.txt | wc -l
grep "some thing" all.sentences.txt | wc -l
grep "some time" all.sentences.txt | wc -l
grep "some weeks" all.sentences.txt | wc -l
# 324 | 2021 | 4264 | 79

grep "quite some years" all.sentences.txt | wc -l
grep "quite some thing" all.sentences.txt | wc -l
grep "quite some time" all.sentences.txt | wc -l
grep "quite some weeks" all.sentences.txt | wc -l
# 2 | 1 | 376 | 0

grep -w "tomorrow\|love\|film\|seen" all.sentences.txt | grep "quite some years" | wc -l
grep -w "tomorrow\|love\|film\|seen" all.sentences.txt | grep "quite some thing" | wc -l
grep -w "tomorrow\|love\|film\|seen" all.sentences.txt | grep "quite some time" | wc -l
grep -w "tomorrow\|love\|film\|seen" all.sentences.txt | grep "quite some weeks" | wc -l
# 0 | 0 | 16 | 0 (restricted)

#bow == 3gram "quite some time" (not restricted)
#bow != 3gram "quite some time" (restricted)
#2o3 == "quite some time" (both)
#rank == "quite some time" (both)

# -------------------------------------

grep "little ears" all.sentences.txt | wc -l
grep "little eyes" all.sentences.txt | wc -l
grep "little toes" all.sentences.txt | wc -l
grep "little fingers" all.sentences.txt | wc -l
# 13 | 26 | 6 | 34

grep "his little ears" all.sentences.txt | wc -l
grep "his little eyes" all.sentences.txt | wc -l
grep "his little toes" all.sentences.txt | wc -l
grep "his little fingers" all.sentences.txt | wc -l
# 1 | 3 | 0 | 4

#after\|ice\|bucket\|challenge\|louis\|push\|long\|wet\|hair\|eyes\|little
grep -w "after\|ice\|bucket\|challenge\|louis\|push\|long\|wet\|hair" all.sentences.txt | grep "his little ears" | wc -l
grep -w "after\|ice\|bucket\|challenge\|louis\|push\|long\|wet\|hair" all.sentences.txt | grep "his little eyes" | wc -l
grep -w "after\|ice\|bucket\|challenge\|louis\|push\|long\|wet\|hair" all.sentences.txt | grep "his little toes" | wc -l
grep -w "after\|ice\|bucket\|challenge\|louis\|push\|long\|wet\|hair" all.sentences.txt | grep "his little fingers" | wc -l
# 0 | 0 | 0 | 1

#bow == 3gram
#2o3 => "his little fingers"
#rank => "his little fingers"

# -------------------------------------

grep "the sad" all.sentences.txt | wc -l
grep "the worse" all.sentences.txt | wc -l
grep "the hard" all.sentences.txt | wc -l
grep "the bad" all.sentences.txt | wc -l
# 1091 | 400 | 4176 | 2817

grep "during the sad" all.sentences.txt | wc -l
grep "during the worse" all.sentences.txt | wc -l
grep "during the hard" all.sentences.txt | wc -l
grep "during the bad" all.sentences.txt | wc -l
# 0 | 0 | 4 | 6

grep -w "grateful\|good\|times\|keep\|faith" all.sentences.txt | grep "during the sad" | wc -l
grep -w "grateful\|good\|times\|keep\|faith" all.sentences.txt | grep "during the worse" | wc -l
grep -w "grateful\|good\|times\|keep\|faith" all.sentences.txt | grep "during the hard" | wc -l
grep -w "grateful\|good\|times\|keep\|faith" all.sentences.txt | grep "during the bad" | wc -l
# 0 | 0 | 1| 3 

#bow = 3gram
#2o3 = 3gram
#rank = "during the bad"

# -------------------------------------

grep "be asleep" all.sentences.txt | wc -l
grep "be callous" all.sentences.txt | wc -l
grep "be insensitive" all.sentences.txt | wc -l
grep "be insane" all.sentences.txt | wc -l
# 112 | 3 | 6 | 106

grep "must be asleep" all.sentences.txt | wc -l
grep "must be callous" all.sentences.txt | wc -l
grep "must be insensitive" all.sentences.txt | wc -l
grep "must be insane" all.sentences.txt | wc -l
# 2| 0 | 0 | 8

grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "must be asleep" | wc -l
grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "must be callous" | wc -l
grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "must be insensitive" | wc -l
grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "must be insane" | wc -l
# 0 | 0 | 0 | 0

grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "be asleep" | wc -l
grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "be callous" | wc -l
grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "be insensitive" | wc -l
grep -w "cutest\|thing\|ever\|seen" all.sentences.txt | grep "be insane" | wc -l
# 1 | 0 | 0 | 3

# -----------------------------------------------------------------------------
# data explorer; word frequency
# -----------------------------------------------------------------------------
cat *_*.txt | tr "[:upper:]" "[:lower:]" | tr "[:punct:]" " " | tr "[:digit:]" " " | sed "s/[^[:print:]]/ /g" | tr -s " " "\n" > x
\UnxUtils\bin\sort.exe x > y
uniq -c y > z
\UnxUtils\bin\sort.exe -bnr z > freq.count


