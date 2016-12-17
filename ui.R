##
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
    titlePanel("SP 500 Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
#            fileInput('datafile', 'Choose CSV File',
#                      accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),    

            actionButton("done","REDRAW Subset of SP500 Chart"),
            h5("Instruction : Select points on the chart, and press the REDRAW button")
        ),
        
        
        # Show a plot of the SP 500 Chart, and a chart of the brushed points
        mainPanel(
            #7plotOutput("sp500Plot", brush = brushOpts(id="brush1")),
            plotOutput("sp500Plot", dblclick = "sp500_dblclick",brush = "brush1"),
            plotOutput("sp500Plot_select"),
            #6textOutput("minVALUE") 
            tableOutput("sp500TABLE")
            
        )
    )
))
