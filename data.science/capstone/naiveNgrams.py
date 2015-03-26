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

'''