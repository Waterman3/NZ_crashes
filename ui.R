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
  titlePanel("Fatal and Serious Crashes"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h3("Please select calendar or financial year"),
        checkboxGroupInput("year_type","Type of Year",
                           c("Financial Year" = "fin_year",
                             "Calendar Year" = "year"))
    ),
      
      mainPanel(h1("Your information"),
      tabPanel(
        h3("Which financial year?"),
        checkboxGroupInput("financial_year","Financial Year",
                           c("2006/07" = "2006/2007",
                             "2007/08" = "2007/2008",
                             "2008/09" = "2008/2009",
                             "2009/10" = "2009/2010",
                             "2010/11" = "2010/2011",
                             "2011/12" = "2011/2012",
                             "2012/13" = "2012/2013",
                             "2013/14" = "2013/2014",
                             "2014/15" = "2014/2015",
                             "2015/16" = "2015/2016")),
      h2("Year Type"),
                textOutput("year_type"),
                h2("Year"),
                textOutput("financial_year"),
                submitButton("Submit"),
                textOutput("result")
               )
      )
  ))
)