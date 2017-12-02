## Shiny UI file
library(shiny)
shinyUI(fluidPage(
  titlePanel("Shiny Assignment - Predict HP from MPG"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG","Enter MPG of the car",10,35,value=20),
      submitButton("Submit"),
      p("Please use slider to select MPG and press Submit button")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted HP is :"),
      textOutput("pred"),
      p("This App helps you predict the Horsepower (HP) based on the Miles Per Gallon (MPG) provided."),
      p("The mtcars data available in R is used to build a model between hp ~ mpg. This model is used to predict HP")
    )
  )
))