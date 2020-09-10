library(shiny)
library(tm)
library(stringi)
library(stringr)

#G2 <- readRDS("./G2.rds")
#G3 <- readRDS("./G3.rds")
G4 <- readRDS("./subG4.rds")

server <- function(input, output) {
  
#  test <- function(x, G2, G3, G4){
   test <- function(x, G4){
      
    predText <- as.character(NULL)
    predWords <- as.character(NULL)
    predRes <- as.character(NULL)
    pred <- as.character(NULL)
    quad <- as.character(NULL)
    tri <- as.character(NULL)
    bi <- as.character(NULL)
    
    clText <- tolower(removeNumbers(removePunctuation(str_trim(str_squish(x)))))
    len <- length(unlist(strsplit(clText, " ")))
    evalText <- unlist(strsplit(clText, " "))
    
    if(len >=3) {
      quad <- paste("^", evalText[len-2], evalText[len-1], evalText[len])
      quad <- sub(" ", "", quad)
      pred <- head(G4[grep(quad,G4[,2]),],1)
        predRes <- as.character(pred$ngrams[1])
        predWords <- unlist(strsplit(predRes, " "))
        predText <- paste(predWords[4])
  #   predText <- stri_extract_last_words(pred$ngrams[1])
      
    } else {
      if(len == 2){
        tri <- paste("^", evalText[len-1], evalText[len])
        tri <- sub(" ", "", tri)
        pred <- head(G4[grep(tri,G4[,2]),],1)
          predRes <- as.character(pred$ngrams[1])
          predWords <- unlist(strsplit(predRes, " "))
          predText <- predWords[3]
  #     predText <- stri_extract_last_words(pred$ngrams[1])    
        
      } else {
        if(len == 1){
          bi <- paste("^", evalText[len])
          bi <- sub(" ", "", bi)
          pred <- head(G4[grep(bi,G4[,2]),],1)
            predRes <- as.character(pred$ngrams[1])
            predWords <- unlist(strsplit(predRes, " "))
            predText <- predWords[2]
  #    predText <- stri_extract_last_words(pred$ngrams[1])    
          
        } else {
          predText <- ("Please enter atleast one word")    
        }   
      }
    }
    #   return(quad)
    
    return(predText)
  }
  
  output$Prediction <- renderText({
#   test(input$inText, G2, G3, G4)
    test(input$inText, G4)
  })
}
