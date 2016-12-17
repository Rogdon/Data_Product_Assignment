#
# This is the server logic for our assignment
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
library(scales)

#read in SP500 data between 2006-2016 from the St. Louis Fed
infile <- read.csv(file="SP500.csv", header=TRUE,na.strings=c("#N/A"))
sp500 <- na.omit(as.data.frame(infile))

# Define server logic required to draw a chart
shinyServer(function(input, output) {

    #render SP500 chart
    output$sp500Plot <- renderPlot({
        labels <- seq(2006, 2016, length.out=11)
        print(labels)
        ggplot(sp500, aes(as.double.difftime(DATE), VALUE)) +
            geom_point(size = 1.3, shape = 21, fill = "green", colour = "black") + 

         
            labs(x = "Days Elapsed from September 2006",
                 title = "SP 500 2006 - 2016")   
    })
    
    #reactively render subset of the SP500 chart
    observeEvent(input$done, {
        
        brushed_data <- brushedPoints(sp500, input$brush1, xvar="DATE",yvar="VALUE")

        if (nrow(brushed_data) > 0) {
            
        output$sp500Plot_select <- renderPlot({
            ggplot(brushed_data, aes(as.Date(DATE), VALUE)) +
                geom_point(size = 1.5, shape = 21, fill = "green", colour = "black")  + 
               theme(axis.text.x=element_text(angle = -90, hjust = 1))+
                xlab("DATE")
            
        }) 
        }
    })

})