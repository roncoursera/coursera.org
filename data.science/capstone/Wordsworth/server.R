library(shiny)
library(stringr)

enBlogs.ngrams <- read.table("http://rhinohide.org/data/coursera.org/data.science/capstone/final/en_US/en_US.blogs.ngrams.nocnt.500000",header=FALSE,sep=",", stringsAsFactors=FALSE)
enNews.ngrams <- read.table("http://rhinohide.org/data/coursera.org/data.science/capstone/final/en_US/en_US.news.ngrams.nocnt.500000",header=FALSE,sep=",", stringsAsFactors=FALSE)
enTwitter.ngrams <- read.table("http://rhinohide.org/data/coursera.org/data.science/capstone/final/en_US/en_US.twitter.ngrams.nocnt.500000",header=FALSE,sep=",", stringsAsFactors=FALSE)

hardy.ngrams <- read.table("http://rhinohide.org/data/uccs.edu/project/shiny/data/hardy.ngrams.nocnt",header=FALSE,sep=",", stringsAsFactors=FALSE)
dickens.ngrams <- read.table("http://rhinohide.org/data/uccs.edu/project/shiny/data/dickens.ngrams.nocnt",header=FALSE,sep=",", stringsAsFactors=FALSE)


parseText <- function(text){
  text <- tolower(text)
  text <- gsub("'"," ",text) # remove ticks
  text <- gsub("`"," ",text) # remove ticks
  text <- gsub("\\("," ",text) # remove parens
  text <- gsub("\\)"," ",text) # remove parens
  text <- gsub("\\{"," ",text) # remove parens
  text <- gsub("\\}"," ",text) # remove parens
  text <- gsub("\\["," ",text) # remove parens
  text <- gsub("\\]"," ",text) # remove parens
  text <- gsub("<"," ",text) # remove parens
  text <- gsub(">"," ",text) # remove parens
  text <- gsub("\\|"," ",text) # remove parens
  text <- gsub("\\\\"," ",text) # remove parens
  text <- gsub("/"," ",text) # remove parens
  text <- gsub(","," ",text) # remove parens
  text <- gsub("\\."," ",text) # remove parens
  text <- gsub("\\?"," ",text) # remove parens
  text <- gsub("~"," ",text) # remove parens
  text <- gsub("!"," ",text) # remove parens
  text <- gsub("@"," ",text) # remove parens
  text <- gsub("#"," ",text) # remove parens
  text <- gsub("$"," ",text) # remove parens
  text <- gsub("%"," ",text) # remove parens
  text <- gsub("^"," ",text) # remove parens
  text <- gsub("&"," ",text) # remove parens
  text <- gsub("\\*"," ",text) # remove parens
  text <- gsub('"'," ",text) # remove parens
  text <- gsub('-'," ",text) # remove parens
  text <- gsub('_'," ",text) # remove parens
  text <- gsub('\\+'," ",text) # remove parens
  text <- gsub('='," ",text) # remove parens
  text <- gsub(';'," ",text) # remove parens
  text <- gsub("  "," ",text) # remove parens
  text <- gsub("  "," ",text) # remove parens
  text <- gsub("  "," ",text) # remove parens
  text <- gsub("  "," ",text) # remove parens
  text <- gsub("  "," ",text) # remove parens
  text <- gsub("  "," ",text) # remove parens
  text <- gsub("^ ","",text) # replace leading space
  text <- gsub(" $","",text) # replace trailing space
  text <- gsub('[[:digit:]]+', '', text)
  return(text)
}

getNextGram <- function(this.ngrams,text,m){
  rstart="^"  
  mm <- length(strsplit(text," ")[[1]])
  if (m > mm) {m = mm}
  if (m > 0) {
    rstart=paste("^",word(text,start=-m,end=-1)," ",sep="")
  }
  mtext=this.ngrams[grepl(rstart,this.ngrams[,1]),1]
  mtext=mtext[1]  
  if (is.na(mtext) & m>0) {
    mtext=getNextGram(this.ngrams,text,m-1)
  }
  return(mtext)
}

# Define server logic required to draw a histogram
shinyServer(
  
  function(input, output) {
  
    getNextWord <- reactive({
      if (input$wordsrc=="blogsopt") {
        nw = word(getNextGram(enBlogs.ngrams,parseText(input$inText),6),start=-1,end=-1)
      }else if (input$wordsrc=="newsopt") {
        nw =word(getNextGram(enNews.ngrams,parseText(input$inText),6),start=-1,end=-1)
      }else if (input$wordsrc=="twitteropt") {
        nw =word(getNextGram(enTwitter.ngrams,parseText(input$inText),6),start=-1,end=-1)
      }else if (input$wordsrc=="dickensopt") {
        nw = word(getNextGram(dickens.ngrams,parseText(input$inText),6),start=-1,end=-1)
      }else if (input$wordsrc=="hardyopt") {
        nw = word(getNextGram(hardy.ngrams,parseText(input$inText),6),start=-1,end=-1)
      }else{
        nw = "puppies"
      }
      return(paste("Next Word:", nw))
    })
    
    output$loadText <- renderText({ 
      "... loading complete"
    })
    
    output$enBlogsText <- renderText({ 
      getNextGram(enBlogs.ngrams,parseText(input$inText),6)
    })
    
    output$enNewsText <- renderText({ 
      getNextGram(enNews.ngrams,parseText(input$inText),6)
    })
    
    output$enTwitterText <- renderText({ 
      getNextGram(enTwitter.ngrams,parseText(input$inText),6)
    })
    
    output$dickensText <- renderText({ 
      getNextGram(dickens.ngrams,parseText(input$inText),6)
    })
    
    output$hardyText <- renderText({ 
      getNextGram(hardy.ngrams,parseText(input$inText),6)
    })

    output$nextWordText <- renderText({getNextWord()})
    
    
})