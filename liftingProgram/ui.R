#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Major lifts, 1RM values"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      radioButtons("program",
                   "Program", 
                   choices = c("Verkhoshansky", "5/3/1 BBB"),
                   selected = "Verkhoshansky", 
                   inline = TRUE),
      numericInput("bench", 
                   "Bench",
                   210),
      numericInput("ohp", 
                   "Overhead Press",
                   145),
      numericInput("squat", 
                   "Squat",
                   265),
      numericInput("deadlift", 
                   "Deadlift",
                   310), 
      # Button
      downloadButton("downloadData", "Download program")
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
        tableOutput("table")
      )
  )
))
