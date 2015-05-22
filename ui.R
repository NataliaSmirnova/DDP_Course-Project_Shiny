
library(shiny)
shinyUI(pageWithSidebar(
    titlePanel(
        h3("Fuel consumption based on weight of an automobile, type of transmission and number of cylinders")),
    sidebarPanel(
        
        h3("Input parameters:"),

        br(),
        
        numericInput('WeightInput', 'Weight, tons:', 2, min = 0.5, max = 3, step = 0.001),
        
        selectInput("CylindersInput", label = h5("Number of cylinders:"), 
                    choices = list("4" = 4, "6" = 6,
                                   "8" = 8), selected = 1),
                              
        radioButtons("TransmissionInput", label = h5("Type of transmission:"),
                                  choices = list("Automatic" = 0, "Manual" = 1),selected = 1)
        
        ##submitButton('Get results!')
        ),
    mainPanel(
        
            
        ##h4('Results of prediction:'),
        ##h5('Weight, tons:'),
        ##verbatimTextOutput("WeightOutput"),
        ##h5('Number of cylinders:'),
        ##verbatimTextOutput("CylindersOutput"),
        ##h5('Type of transmission:'),
        ##verbatimTextOutput("TransmissionOutput"),
        
        
        ##h5('Predicted fuel consumption, miles/gallon:'),
        ##verbatimTextOutput("PredictionOutput"),
        
        tabsetPanel(
            tabPanel("Results of prediction: ",tableOutput("Table")),
            tabPanel("About: ", htmlOutput("About")),
            tabPanel("Prediction formula: ", verbatimTextOutput("Formula")))
        
    )
))
