## server R file
library(shiny)
shinyServer(function(input,output){
  model<- lm(hp~mpg,data = mtcars)
  
  modelpred<-reactive({
    mpgInput<-input$sliderMPG
    predict(model,newdata=data.frame(mpg=mpgInput))
  })
  output$plot1<-renderPlot({
  mpgInput<-input$sliderMPG
  
  plot(mtcars$mpg,mtcars$hp,xlab = "Miles / Gallon (mpg)",
          ylab = "Horsepower (hp)", bty="n",pch=16,
       xlim= c(10,35), ylim = c(50,350))
  abline(model, col="red",lwd=2)
  points(mpgInput,modelpred(),col="red",pch=16,cex=2)
  })
  output$pred<-renderText({
  modelpred()
  })
})