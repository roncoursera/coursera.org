
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(png)

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    oil=(input$oil.proved+input$oil.undiscovered)*input$oil.consumed*3.07/7.3 # gT CO2
    gas=(input$gas.proved+input$gas.undiscovered)*input$gas.consumed*2.35*0.9 # gT CO2
    coal=(input$coal.proved+input$coal.undiscovered)*input$coal.consumed*(3.96/2.25)/1000 # gt CO2
    gtco2=(oil+gas+coal)*(1-input$ocean.absorption) # gigatonnes
    ppmv=gtco2/8 + 390# ppmv
    #plot(input$ecs, gtco2, xlim=c(0,10), ylim=c(0,16000), 
    #
    
    plot(input$ecs, ppmv, xlim=c(0,10), ylim=c(300,2400), 
         ylab="Existing + Additional CO2 PPMV", 
         xlab="Equilibrium Climate Sensitivity")
    
  })
  
  output$plot2 <- renderPlot({
    oil=(input$oil.proved+input$oil.undiscovered)*input$oil.consumed*3.07/7.3 # gT CO2
    gas=(input$gas.proved+input$gas.undiscovered)*input$gas.consumed*2.35*0.9 # gT CO2
    coal=(input$coal.proved+input$coal.undiscovered)*input$coal.consumed*(3.96/2.25)/1000 # gt CO2
    gtco2=(oil+gas+coal)*(1-input$ocean.absorption) # gigatonnes
    ppmv=gtco2/8 + 390# ppmv
    dT=input$ecs/3.7 * 5.35 * log(ppmv/300)
    #ima <- readPNG("/projects/coursera.org/dav.data.prod/app/www/heat-bg.png")
    ima <- readPNG("www/heat-bg.png")
    plot(1:2, type='n', main="Global Temperature Response To CO2 From Pre-Industrial",
         xlim=c(0,10), ylim=c(300,2400),
         ylab="Existing + Additional CO2 PPMV", 
         xlab="Equilibrium Climate Sensitivity")
    lim <- par()
    rasterImage(ima, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
    abline(h=ppmv,col="blue",lty=2)
    abline(v=input$ecs,col="blue",lty=2)
    points(x=input$ecs,y=ppmv,col="blue",pch=20)
    text(x=0,y=2200,pos=4,
         paste("With", round(ppmv-300,2),"ppm CO2 emission and a senstivity of",round(input$ecs,2),
               ",\nthe modeled temperature rise is",  round(dT, digits=2), "degrees Celsius", sep=" "))
    
  })

})
