library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  #titlePanel("Write Like Wordsworth!"),

  sidebarLayout(
    sidebarPanel(
      h4("PROJECT FEEDS"),
      fluidRow(
        HTML("<hr/>"),
        column(12,"Blogs Feeds: "),
        column(12,textOutput("enBlogsText"))
      ),
      fluidRow(
        HTML("<hr/>"),
        column(12,"News Feeds: "), 
        column(12,textOutput("enNewsText"))
      ),
      fluidRow(
        HTML("<hr/>"),
        column(12,"Twitter Feeds: "), 
        column(12,textOutput("enTwitterText"))
      ),
      HTML("<hr/>"),
      h4("FAMOUS AUTHORS"),
      fluidRow(
        HTML("<hr/>"),
        column(12,"Charles Dickens: "), 
        column(12,textOutput("dickensText"))
      ),
      fluidRow(
        HTML("<hr/>"),
        column(12,"Thomas Hardy: "), 
        column(12,textOutput("hardyText"))
      )
    ),
      
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Write Like Wordsworth"),
      div("An Auto-Complete App which sources text from various literary authors."), 
      p("Please wait for the loading complete message ..."),
      textOutput("loadText"),
      fluidRow(
        HTML("<hr/>"),
        column(12,textInput("inText", label = h5("Your Input: "), value = "of the")),
        column(12,textOutput("nextWordText")),
        column(12,radioButtons("wordsrc", "Next Word Source:",
                     c("Blogs" = "blogsopt",
                       "News" = "newsopt",
                       "Twitter" = "twitteropt",
                       "Dickens" = "dickensopt",
                       "Hardy" = "hardyopt")))
      )
    )
  )
))