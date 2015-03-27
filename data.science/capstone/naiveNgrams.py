import re

# a, an, th
# need regex to catch first in sentence
def stripArticles(s):
    s=s.replace(' a ',' ')
    s=s.replace(' an ',' ')
    s=s.replace(' the ',' ')
    return s

def stripConjuctions(s):
    s=s.replace(' and ',' ')
    s=s.replace(' or ',' ')
    return s

def stripConjuctions(s):
    s=s.replace(' and ',' ')
    s=s.replace(' or ',' ')
    s=s.replace(' but ',' ')
    s=s.replace(' then ',' ')
    return s

def stripCommonPrepositions(s):
    s=s.replace(' as ',' ')
    s=s.replace(' at ',' ')
    s=s.replace(' but ',' ')
    s=s.replace(' by ',' ')
    s=s.replace(' for ',' ')
    s=s.replace(' from ',' ')
    s=s.replace(' of ',' ')
    s=s.replace(' on ',' ')
    s=s.replace(' per ',' ')
    s=s.replace(' than ',' ')
    s=s.replace(' to ',' ')
    s=s.replace(' via ',' ')
    return s

# could make more intelligent regex
def stripPunctuation(s):
    s=s.replace('~',' ')
    s=s.replace('`',' ')
    s=s.replace('!',' ')
    s=s.replace('@',' ')
    s=s.replace('#',' ')
    s=s.replace('$',' ')
    s=s.replace('%',' ')
    s=s.replace('^',' ')
    s=s.replace('&',' ')
    s=s.replace('*',' ')
    s=s.replace('(',' ')
    s=s.replace(')',' ')
    s=s.replace('-',' ')
    s=s.replace('_',' ')
    s=s.replace('+',' ')
    s=s.replace('=',' ')
    s=s.replace('{',' ')
    s=s.replace('}',' ')
    s=s.replace('[',' ')
    s=s.replace(']',' ')
    s=s.replace('|',' ')
    s=s.replace('\\',' ')
    s=s.replace(':',' ')
    s=s.replace(';',' ')
    s=s.replace('"',' ')
    s=s.replace("'",' ')
    s=s.replace('<',' ')
    s=s.replace('>',' ')
    s=s.replace(',',' ')
    s=s.replace('.',' ')
    s=s.replace('?',' ')
    s=s.replace('/',' ')
    return s

# could make more intelligent regex
def reduceWhiteSpace(s):
    for i in range(120):
        s=s.replace('  ',' ')
    return s

def reduceEmphasis(s):
    s=s.replace(' real ',' ')
    s=s.replace(' really ',' ')
    s=s.replace(' very ',' ')
    s=s.replace(' much ',' ')
    s=s.replace(' too ',' ')
    s=s.replace(' not ',' ')
    s=s.replace(' no ',' ')
    s=s.replace(' yes ',' ')
    return s

def reduceExistenceVerbs(s):
    s=s.replace(' will be ',' ')
    s=s.replace(' have been ',' ')
    s=s.replace(' am ',' ')
    s=s.replace(' are ',' ')
    s=s.replace(' be ',' ')
    s=s.replace(' being ',' ')
    s=s.replace(' is ',' ')
    s=s.replace(' was ',' ')
    s=s.replace(' were ',' ')
    return s

def normalizeVerbs(s):
    s=s.replace(' accelerated ',' accelerate ')
    s=s.replace(' accelerating ',' accelerate ')
    s=s.replace(' accomplished ',' accomplish ')
    s=s.replace(' accomplishing ',' accomplish ')
    s=s.replace(' achieved ',' achieve ')
    s=s.replace(' achieving ',' achieve ')
    s=s.replace(' acquired ',' acquire ')
    s=s.replace(' acquiring ',' acquire ')
    s=s.replace(' activated ',' activate ')
    s=s.replace(' activating ',' activate ')
    s=s.replace(' adapted ',' adapt ')
    s=s.replace(' adapting ',' adapt ')
    s=s.replace(' adjusted ',' adjust ')
    s=s.replace(' adjusting ',' adjust ')
    s=s.replace(' adjusted ',' adjust ')
    s=s.replace(' administrated ',' administer ')
    s=s.replace(' administrating ',' administer ')
    s=s.replace(' advising ',' advise ')
    s=s.replace(' having ',' have ')
    s=s.replace(' running ',' run ')
    s=s.replace(' thinking ',' think ')
    return s

def reducePassiveVerbs(s):
    s=s.replace(' can ',' ')
    s=s.replace(' could ',' ')
    s=s.replace(' did ',' ')
    s=s.replace(' do ',' ')
    s=s.replace(' does ',' ')
    s=s.replace(' has ',' ')
    s=s.replace(' had ',' ')
    s=s.replace(' have ',' ')
    s=s.replace(' may ',' ')
    s=s.replace(' might ',' ')
    s=s.replace(' must ',' ')
    s=s.replace(' shall ',' ')
    s=s.replace(' should ',' ')
    s=s.replace(' will ',' ')
    s=s.replace(' would ',' ')
    return s

def reducePrepositions(s):
    s=s.replace(" i ",' ')
    s=s.replace(" he ",' ')
    s=s.replace(" she ",' ')
    s=s.replace(" it ",' ')
    s=s.replace(" its ",' ')
    s=s.replace(" him ",' ')
    s=s.replace(" his ",' ')
    s=s.replace(" her ",' ')
    s=s.replace(" hers ",' ')
    s=s.replace(" me ",' ')
    s=s.replace(" mine ",' ')
    s=s.replace(" our ",' ')
    s=s.replace(" ours ",' ')
    s=s.replace(" they ",' ')
    s=s.replace(" theres ",' ')
    s=s.replace(" theirs ",' ')
    s=s.replace(" thiers ",' ')
    s=s.replace(" their ",' ')
    s=s.replace(" thier ",' ')
    s=s.replace(" them ",' ')
    return s

def reduceContractions(s):
    s=s.replace("n't ",' not ')
    s=s.replace("'d ",' would ')
    s=s.replace("'ll ",' will ')
    s=s.replace("'m ",' am ')
    s=s.replace("'re ",' are ')
    s=s.replace("'s ",' ')
    s=s.replace("'ve ",' have ')
    return s

# to lower case
def toLowerCase(s):
    return s.lower()

# ngrams, ignores repetitions
def toWordPairs(s):
    t=s.split()
    t=list(set(t))
    l=[]
    for i in range(len(t)):
        for j in range(i+1,len(t)):
            if t[i] < t[j]:
                l.append(t[i]+":"+t[j])
            else:
                l.append(t[j]+":"+t[i])
    return l

def buildWordPairDict(d,l):
    for pair in l:
        try:
            d[pair]=d[pair]+1
        except:
            d[pair]=1
    return d

reword = re.compile('[^a-zA-Z]')
def stringToPairs(s):
    s=s.decode('ascii','ignore')
    s=toLowerCase(s)
    s=stripPunctuation(s)
    s=stripArticles(s)
    s=stripCommonPrepositions(s)
    s=stripConjuctions(s)
    s=reduceContractions(s)
    s=reducePrepositions(s)
    s=reducePassiveVerbs(s)
	s=reword.sub(' ',s)
    s=reduceWhiteSpace(s)
    s=normalizeVerbs(s)
    #return toWordPairs(s)
    return s


wpd={}
'''
s="The guy in front of me just bought a pound of bacon, a bouquet, and a case of beer"
wpd=buildWordPairDict(wpd,stringToPairs(s))
s="The guy in front of me just bought a pound of bacon, a bouquet, and a case of wine"
wpd=buildWordPairDict(wpd,stringToPairs(s))
s="You're the reason why I smile everyday. Can you follow me please? It would mean the world."
wpd=buildWordPairDict(wpd,stringToPairs(s))
s="In light of Alex Gonzalez's 413-foot homer on his previous at-bat, Lohse didn't seem to mind walking Gonzalez to load the bases. He did, however, mind walking George Kottaras on a 3-1 pich well out of the strike zone."
re.replace(r'
wpd
'''

files=["final/en_us/en_US.blogs.txt","final/en_us/en_US.news.txt","final/en_us/en_US.twitter.txt"]


i=0
j=0
for file in files:
    i = i+1
    g=open(file.replace('.txt','.clean.txt'),'w')
    with open(file) as f:
        for line in f:
            j = j+1
            if j%1000 == 0: print i, j
            lines=re.split(r'[.?!;]', line.strip())
            for l in lines:
                print >> g, stringToPairs(l)
    g.close()

'''
cat en_US.blogs.txt | tr " " "\n" | grep ".*ing$" | grep -v "[^a-zA-Z]" > verbs.ing.txt
cat en_US.news.txt | tr " " "\n" | grep ".*ing$" | grep -v "[^a-zA-Z]" >> verbs.ing.txt
cat en_US.twitter.txt | tr " " "\n" | grep ".*ing$" | grep -v "[^a-zA-Z]" >> verbs.ing.txt
\UnxUtils\bin\sort.exe -fu verbs.ing.txt > x 
mv x verbs.ing.txt


cat en_US.blogs.txt | tr " " "\n" | grep ".*ed$" | grep -v "[^a-zA-Z]" > verbs.ed.txt
cat en_US.news.txt | tr " " "\n" | grep ".*ed$" | grep -v "[^a-zA-Z]" >> verbs.ed.txt
cat en_US.twitter.txt | tr " " "\n" | grep ".*ed$" | grep -v "[^a-zA-Z]" >> verbs.ed.txt
\UnxUtils\bin\sort.exe -fu verbs.ed.txt > x
mv x verbs.ed.txt

# Quiz 3.1 (A)
#  guy\|front\|just\|bought\|pound\|bacon\|bouquet|case
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "guy\|front\|just\|bought\|pound\|bacon\|bouquet|case" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "guy\|front\|just\|bought\|pound\|bacon\|bouquet|case" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "guy\|front\|just\|bought\|pound\|bacon\|bouquet|case" | tr " " "\n" >> y
move y quiz3a.txt
grep beer quiz3a.txt | wc -l 
grep pretzels quiz3a.txt | wc -l 
grep soda quiz3a.txt | wc -l 
grep cheese quiz3a.txt | wc -l
# 3257 | 41 | 195 | 1531

# Quiz 3.2 (B)
# reason smile everyday follow please mean 
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "reason\|smile\|everyday\|follow\|please\|mean" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "reason\|smile\|everyday\|follow\|please\|mean" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "reason\|smile\|everyday\|follow\|please\|mean" | tr " " "\n" >> y
move y quiz3b.txt
grep most quiz3b.txt | wc -l 
grep best quiz3b.txt | wc -l 
grep universe quiz3b.txt | wc -l 
grep world quiz3b.txt | wc -l 
# 4698 | 2378 | 226 | 3156

# Quiz 3.3 (C)
#  sunshine follow make   
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "sunshine\|follow\|make" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "sunshine\|follow\|make" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "sunshine\|follow\|make" | tr " " "\n" >> y
move y quiz3c.txt
grep smelliest quiz3c.txt | wc -l 
grep saddest quiz3c.txt | wc -l 
grep bluest quiz3c.txt | wc -l 
grep happiest quiz3c.txt | wc -l 
# 0 | 11 | 2 | 79

# Quiz 3.4 (D)
# early observations bills game offense struggling 
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "early\|observations\|bills\|game\|offense\|struggling" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "early\|observations\|bills\|game\|offense\|struggling" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "early\|observations\|bills\|game\|offense\|struggling" | tr " " "\n" >> y
move y quiz3d.txt
grep referees quiz3d.txt | wc -l 
grep defense quiz3d.txt | wc -l 
grep players quiz3d.txt | wc -l 
grep crowd quiz3d.txt | wc -l 
# 21 | 1086 | 0 | 391 (with 'still')
# 28 | 1104 | 633 | 399 (without 'still')

# Quiz 3.5 (E)
# go romantic date
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "romantic\|date" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "romantic\|date" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "romantic\|date" | tr " " "\n" >> y
move y quiz3e.txt
grep movies quiz3e.txt | wc -l 
grep beach quiz3e.txt | wc -l 
grep mall quiz3e.txt | wc -l 
grep grocery quiz3e.txt | wc -l 
# 691 | 709 | 2119 | 211 (with 'go')
# 69 | 21 | 54 | 0 (without 'go')



# Quiz 3.6 (F)
# well\|pretty\|sure\|granny\|old\|bagpipes\|garage\|dust\|off
# pretty\|granny\|old\|bagpipes\|garage\|dust\|off
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "pretty\|granny\|old\|bagpipes\|garage\|dust\|off" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "pretty\|granny\|old\|bagpipes\|garage\|dust\|off" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "pretty\|granny\|old\|bagpipes\|garage\|dust\|off" | tr " " "\n" >> y
move y quiz3f.txt
grep horse quiz3f.txt | wc -l 
grep motorcycle quiz3f.txt | wc -l 
grep way quiz3f.txt | wc -l 
grep phone quiz3f.txt | wc -l 
# 531 | 0 | 0 | 1948 (with 'well' 'sure')
# 801 | 73 | 17293 | 2540 (without 'well' 'sure')

# Quiz 3.7 (G)
# ohhhhh|#pointbreak|tomorrow|love|film|seen|in|quite|some
# tomorrow|love|film|seen
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "tomorrow\|love\|film\|seen" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "tomorrow\|love\|film\|seen" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "tomorrow\|love\|film\|seen" | tr " " "\n" >> y
move y quiz3g.txt
grep years quiz3g.txt | wc -l
grep thing quiz3g.txt | wc -l 
grep time quiz3g.txt | wc -l 
grep weeks quiz3g.txt | wc -l 
# 24898 | 128302 | 136922 | 13331 (almost everything)
# 0 | 7917 | 7391 | 430 (restrictted)


# Quiz 3.8 (H)
# after ice bucket challenge louis push long wet hair eyes little
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "after\|ice\|bucket\|challenge\|louis\|push\|long\|wet\|hair\|eyes\|little" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "after\|ice\|bucket\|challenge\|louis\|push\|long\|wet\|hair\|eyes\|little" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "after\\|ice\\|bucket\\|challenge\\|louis\\|push\\|long\\|wet\\|hair\\||eyes\\||little" | tr " " "\n" >> y
move y quiz3h.txt
grep ears quiz3h.txt | wc -l 
grep eyes quiz3h.txt | wc -l 
grep toes quiz3h.txt | wc -l 
grep fingers quiz3h.txt | wc -l 
# 15449 | 8999 | 798 | 688

# Quiz 3.9 (I)
# grateful\|good\|times\|keep\|faith\|during
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "grateful\|good\|times\|keep\|faith\|during" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "grateful\|good\|times\|keep\|faith\|during" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "grateful\|good\|times\|keep\|faith\|during" | tr " " "\n" >> y
move y quiz3i.txt
grep sad quiz3i.txt | wc -l 
grep worse quiz3i.txt | wc -l 
grep hard quiz3i.txt | wc -l 
grep bad quiz3i.txt | wc -l 
# 1913 | 826 | 7056 | 6797

# Quiz 3.10 (J)
# cutest\|thing\|ever\|seen
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " " | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "cutest\|thing\|ever\|seen" | tr " " "\n" > y
cat en_US.news.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "cutest\|thing\|ever\|seen" | tr " " "\n" >> y
cat en_US.twitter.txt | tr "[A-Z]" "[a-z]" | tr "[,;:'-]" " "  | tr "." "\n" | tr "?" "\n" | tr "!" "\n" | grep -w "cutest\|thing\|ever\|seen" | tr " " "\n" >> y
move y quiz3j.txt
grep asleep quiz3j.txt | wc -l 
grep callous quiz3j.txt | wc -l 
grep insensitive quiz3j.txt | wc -l 
grep insane quiz3j.txt | wc -l 
# 206 | 17 | 14 | 197

'''

'''
# after ice bucket challenge louis push long wet hair eyes little
cat en_US.blogs.txt | tr "[A-Z]" "[a-z]" | tr "[.;:?!()]" "\n" | tr "," " " | sed "s/ for /:/g" | sed "s/ and /:/g" | sed "s/ nor /:/g" | sed "s/ but /:/g" | sed "s/ or /:/g" | sed "s/ yet /:/g" | sed "s/ so /:/g" | sed "s/ to /:/g" | sed "s/ in /:/g"  | sed "s/ of /:/g" | sed "s/ that /:/g" | sed "s/ - /:/g" | sed "s/ from /:/g" | sed "s/ after /:/g" | sed "s/ on /:/g" |tr ":" "\n" | sed "s/ as /:/g" | sed "s/ by /:/g"| sed "s/ with /:/g" |tr ":" "\n"  > all.phrases.txt
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

bow == 3gram  "case of beer"
rank = "case of beer"
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

bow = 3gram
2o3 = 3gram
rank => 3gram

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

bow = 3gram "me the happiest"
2o3 = "me the happiest"
rank = "me the happiest"

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
bow != 3gram 
2o3 = "but the crowd"
rank = "the crowd"

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

bow == 3gram (in 1st case)
bow != 3gram (in 2nd case)
2o3 = "at the beach"
rank = "at the beach"

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

bow == 3gram
2of3 = "on my way"
rank = "on my way" (on second result)

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

bow == 3gram "quite some time" (not restricted)
bow != 3gram "quite some time" (restricted)
2o3 == "quite some time" (both)
rank == "quite some time" (both)

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

bow == 3gram
2o3 => "his little fingers"
rank => "his little fingers"

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

bow = 3gram
2o3 = 3gram
rank = "during the bad"

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


'''












'''