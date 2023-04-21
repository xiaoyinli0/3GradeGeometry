library(shiny)
library(ggplot2)

# Define server logic 
shinyServer(function(input, output, session) {

  
  randomVals<-eventReactive(input$go, {
    sample(2:10,2)
      })
 
  rectplot<-function(a,b){
    ggplot() + 
    geom_rect(aes(xmin = 0, xmax =  a, ymin = 0, ymax = b), 
              fill = "blue", alpha = 0.4, color = "black") + 
    xlim(0, max(a,b)) + ylim(0, max(a,b)) +
    theme_void()  + 
    annotate(geom="text",x=a/2, y=b/10, label=paste(a,"cm",sep=' '),size=7)  + 
    annotate(geom="text",x=a-1, y=b/2, label=paste(b,"cm",sep=' '),size=7) 
   }
  
    
   output$distPlot <- renderPlot(rectplot(a= randomVals()[1],b=randomVals()[2]), res=96)

  
  observeEvent(input$click, {
    output$text = renderText({
      req(input$click)
      isolate( print(paste("The perimeter is", (randomVals()[1]+randomVals()[2])*2, 
                  "cm.","The area is", randomVals()[1]*randomVals()[2], "cm squared.", sep=" ")))
    })
  })
  
})