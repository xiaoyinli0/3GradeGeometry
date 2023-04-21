library(shiny)

# Define UI for application 
ui <- fluidPage(
  title = "Practice math", 
  withMathJax(),
  h3("3rd grade Perimeter"),
  uiOutput('problem'),
  hr(),
  h4("Find the perimeter and area of the rectangle"),
  actionButton("go", "Start"),

  plotOutput("distPlot",width = 400),
  h4("Enter your answer"),
  textInput('answer1', label = 'What the perimeter of the rectangle is', width = '50%'),
  textInput('answer2', label = 'What the area of the rectangle is', width = '50%'),
  actionButton("click", "Check my answer"),
  textOutput("text")

)

shinyUI(ui)