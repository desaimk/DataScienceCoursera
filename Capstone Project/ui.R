library(shiny)
ui <- fluidPage(
  
  titlePanel("A Very Simple Text Prediction App"),
  h5("Notes:"),
  h6("1. This app will propose the next word to a partial sentence entry  It requires some time to complete processing so, be patient."),
  h6("2. While processing your entry the proposed next words will appear in grey, once completed they will turn black."), 
  h6("3. It should be noted that DUE TO SIZE/MEMORY RESTRICTIONS on ShinyApp.io, a VERY small corpus was used to support this app, limiting function."),
  
  sidebarLayout(
    sidebarPanel(
      textInput("inText","Enter a partial sentence:")
    ),
    
    mainPanel(
      h3("Predicted next word(s):"),
      textOutput("Prediction")
    )
  )
)