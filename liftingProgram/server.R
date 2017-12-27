#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(openxlsx)

source("build_plans.R")

shinyServer(function(input, output) {
   
  lifting_program <- reactive({
    switch(input$program,
           "Verkhoshansky" = 
             build_verk("bench", input$bench) %>%
              bind_rows(build_verk("ohp", input$ohp)) %>%
              bind_rows(build_verk("deadlift", input$deadlift)) %>%
              bind_rows(build_verk("squat", input$squat)),
           "5/3/1 BBB" = 
             build_531("bench", input$bench) %>%
              bind_rows(build_531("ohp", input$ohp)) %>%
              bind_rows(build_531("deadlift", input$deadlift)) %>%
              bind_rows(build_531("squat", input$squat)))
  })
  
  # Table of selected dataset ----
  output$table <- renderTable({
    lifting_program()
  })
  
  output$downloadData <- downloadHandler(
    
    # This function returns a string which tells the client
    # browser what name to use when saving the file.
    filename = function() {
      paste0(input$program, "_", Sys.Date(), ".xlsx")
    },
    
    # This function should write data to a file given to it by
    # the argument 'file'.
    content = function(file) {

            # Write to a file specified by the 'file' argument
      write.xlsx(lifting_program(), file)
    }
  )

})
