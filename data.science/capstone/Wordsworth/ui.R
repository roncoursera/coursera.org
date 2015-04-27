library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  #titlePanel("Write Like Wordsworth!"),

    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Write Like Wordsworth"),
      div("An Auto-Complete App which sources text from various literary authors."), 
      fluidRow(
        HTML("<hr/>"),
        column(12,textInput("inText", label = h5("Your Input: "), value = "Loading ...")) 
      ),
      HTML("<hr/>"),
      fluidRow(
        HTML("<hr/>"),
        column(12,textOutput("enBlogsText")) 
      ),
      fluidRow(
        HTML("<hr/>"),
        column(12,textOutput("enNewsText")) 
      ),
      fluidRow(
        HTML("<hr/>"),
        column(12,textOutput("enTwitterText")) 
      ),
      HTML("<hr/>"),
      fluidRow(
        HTML("<hr/>"),
        column(12,textOutput("dickensText")) 
      ),
      fluidRow(
        HTML("<hr/>"),
        column(12,textOutput("hardyText")) 
      )
  )
))