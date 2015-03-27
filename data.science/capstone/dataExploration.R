library(ggplot2)

#    Some words are more frequent than others - what are the distributions of word frequencies? 
#    What are the frequencies of 2-grams and 3-grams in the dataset? 
#    How many unique words do you need in a frequency sorted dictionary to cover 50% of all word instances in the language? 90%? 
#    How do you evaluate how many of the words come from foreign languages? 
#    Can you think of a way to increase the coverage -- identifying words that may not be in the corpora or using a smaller number of words in the    dictionary to cover the same number of phrases?


# -----------------------------------------------------------------------------
# Multiple plot function
# -----------------------------------------------------------------------------
# http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_%28ggplot2%29/
# -----------------------------------------------------------------------------
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
# -----------------------------------------------------------------------------



x=c("de_DE","blogs",371440,12653019,85459666)
y=c("de_DE","news",244743,13219287,95591959)
x=rbind(x,y)
x=rbind(x,c("de_DE","twitter",947774,11803491,75578341))
x=rbind(x,c("en_US","blogs",899288,37334131,210160014))
x=rbind(x,c("en_US","news",1010242,34372530,205811889))
x=rbind(x,c("en_US","twitter",2360148,30373583,167105338)) 
x=rbind(x,c("fi_FI","blogs",439785,12731005,108503595)) 
x=rbind(x,c("fi_FI","news",485758,10445964,94234350))
x=rbind(x,c("fi_FI","twitter",285214,3152758,25331142)) 
x=rbind(x,c("ru_RU","blogs",337100,9405378,116855835)) 
x=rbind(x,c("ru_RU","news",196360,9115829,118996424))
x=rbind(x,c("ru_RU","twitter",881414,9223841,105182346))
colnames(x)=c("lang","src","lines","words","chars")
rownames(x)=c("","","","","","","","","","","","" )
df = data.frame(x)

Data Tables		
#
# lang    src       lines     words      chars      
# "de_DE" "blogs"   "371440"  "12653019" "85459666" 
# "de_DE" "news"    "244743"  "13219287" "95591959" 
# "de_DE" "twitter" "947774"  "11803491" "75578341" 
# "en_US" "blogs"   "899288"  "37334131" "210160014"
# "en_US" "news"    "1010242" "34372530" "205811889"
# "en_US" "twitter" "2360148" "30373583" "167105338"
# "fi_FI" "blogs"   "439785"  "12731005" "108503595"
# "fi_FI" "news"    "485758"  "10445964" "94234350" 
# "fi_FI" "twitter" "285214"  "3152758"  "25331142" 
# "ru_RU" "blogs"   "337100"  "9405378"  "116855835"
# "ru_RU" "news"    "196360"  "9115829"  "118996424"
# "ru_RU" "twitter" "881414"  "9223841"  "105182346"
#
		
Histograms
ggplot(df, aes(factor(lang), lines, fill = src)) + 
  geom_bar(stat="identity", position = "dodge") + 
  scale_fill_brewer(palette = "Set1")


txt <- read.table(
  header=TRUE, text='lang src lines words chars
"de_DE" "blogs" 371440 12653019 85459666 
"de_DE" "news" 244743 13219287 95591959 
"de_DE" "twitter" 947774 11803491 75578341 
"en_US" "blogs" 899288 37334131 210160014
"en_US" "news" 1010242 34372530 205811889
"en_US" "twitter" 2360148 30373583 167105338
"fi_FI" "blogs" 439785 12731005 108503595
"fi_FI" "news" 485758 10445964 94234350 
"fi_FI" "twitter" 285214 3152758 25331142 
"ru_RU" "blogs" 337100 9405378 116855835
"ru_RU" "news" 196360 9115829 118996424
"ru_RU" "twitter" 881414 9223841 105182346')

p1 <- ggplot(txt, aes(factor(lang), lines, fill = src)) + 
  geom_bar(stat="identity", position = "dodge") + 
  scale_fill_brewer(palette = "Set1")

p2 <- ggplot(txt, aes(factor(lang), words, fill = src)) + 
  geom_bar(stat="identity", position = "dodge") + 
  scale_fill_brewer(palette = "Set1")

multiplot(p1,p2,rows=2)
 
# Zipf law
# https://class.coursera.org/dsscapstone-003/forum/thread?thread_id=129
freq.de = read.table("final/de_DE/freq.count",header=F)
colnames(freq.de)=c("count","word")
sum(freq.de[,1]) # 40077682
freq.de$nchar = nchar(as.vector(freq.de$word))
zipf.de <- freq.de[freq.de$nchar<15,]
zipf.de$src<-rep("de_DE",dim(zipf.de)[1])
zipf.de$rank<-1:dim(zipf.de)[1]
zipf.de <- zipf.de[zipf.de$rank<5000,]

freq.fi = read.table("final/fi_FI/freq.count",header=F)
colnames(freq.fi)=c("count","word")
sum(freq.fi[,1]) # 31008198
freq.fi$nchar = nchar(as.vector(freq.fi$word))
zipf.fi <- freq.fi[freq.fi$nchar<15,]
zipf.fi$src<-rep("fi_FI",dim(zipf.fi)[1])
zipf.fi$rank<-1:dim(zipf.fi)[1]
zipf.fi <- zipf.fi[zipf.fi$rank<5000,]

freq.ru = read.table("final/ru_RU/freq.count",header=F)
colnames(freq.ru)=c("count","word")
sum(freq.ru[,1]) # xxxxx
freq.ru$nchar = nchar(as.vector(freq.ru$word))
zipf.ru <- freq.ru[freq.ru$nchar<15,]
zipf.ru$src<-rep("ru_RU",dim(zipf.ru)[1])
zipf.ru$rank<-1:dim(zipf.ru)[1]
zipf.ru <- zipf.ru[zipf.ru$rank<5000,]

freq.en = read.table("final/en_US/freq.count",header=F)
colnames(freq.en)=c("count","word")
sum(freq.en[,1]) # 103053942
freq.en$nchar = nchar(as.vector(freq.en$word))
zipf.en <- freq.en[freq.en$nchar<15,]
zipf.en$src<-rep("en_US",dim(zipf.en)[1])
zipf.en$rank<-1:dim(zipf.en)[1]
zipf.en <- zipf.en[zipf.en$rank<5000,]

zipf= rbind(zipf.de, zipf.fi, zipf.en)

# subset

#p <- ggplot(zipf, aes(y=log10(count), x=log10(rank), size=factor(nchar))) 
# p <- p + geom_point(color="tomato", alpha=0.8)
p <- ggplot(zipf, aes(y=log10(count), x=log10(rank),color=factor(src))) 
p <- p + geom_point()
p <- p + ggtitle("Word Frequency follows Zipf's Law")
p

