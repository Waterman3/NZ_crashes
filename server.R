#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$year_type <- renderText({input$year_type})
  output$financial_year <- renderText({input$financial_year})
  output$result <- renderPrint({
    result()
  })
  
 result<- reactive({
      select_year <- as.character(input$`input$financial_year`)
      select(nz_crashes, 
                        CRASH_YEAR, CRASH_FIN_YEAR, CRASH_SEV, fatal_count,
                        seriousinj_count, minorinj_count, LG_REGION_DESC,
                        TLA_ID,TLA_NAME,sh_flag) %>%
                        filter(CRASH_FIN_YEAR=="select_year") %>%
                        summarise(fatal=sum(fatal_count))
    })
})

