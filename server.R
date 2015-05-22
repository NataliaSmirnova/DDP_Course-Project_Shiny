library(shiny)
data(mtcars)
fit<-lm(mpg~as.factor(as.character(am))+wt+cyl,mtcars)

prediction <-function (weight,cylinders,transmission) 

   {predict(fit,newdata=data.frame(am=c(transmission),wt=c(weight*2.2046),cyl=c(as.numeric(cylinders))))}

create_data_frame<-function (weight,cylinders,transmission) 
    
    {
    
    if (transmission==0) {transmission_type <- "Automatic"} else {transmission_type <- "Manual"}
    
    
    Parameters<-c("Weight, tons: ","Number of cylinders: ","Type of transmission: ", "Predicted fuel consumption, miles/gallon: ")
    Values<-c(weight,cylinders,transmission_type,round(prediction(weight,cylinders,transmission)[[1]],2))
    cbind(Parameters,Values)
}


WeightInput = 0


shinyServer(
    function(input, output) {
 
        output$Table <- renderTable({
            create_data_frame(input$WeightInput,input$CylindersInput,input$TransmissionInput)})
        output$About <- renderUI({
            
            str1 <- "The presented model predict the fuel consumption based on the information"
            str2 <- "about weight of an automobile, type of a transmission (manual or automatic) "
            str3 <- "and number of cylinders. Multiple linear regression model (without intersections)"
            str4 <- "was used for the purpose of prediction."
            str5 <- paste("See also", strong("'Prediction formula'"), "to find out parameters of the prediction model.")
       
            HTML(paste(str1, str2, str3, str4, str5, sep = '<br/>'))
        })
        
        output$Formula <- renderPrint(summary(fit))
        
       
    }
)