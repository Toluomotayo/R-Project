#I created a Bmi app, i would like to Publish it

# Thanks to :
# Data Professor                           
# http://youtube.com/dataprofessor      
# for helping me to understand this better


library(shiny)
library(shinythemes)


####################################
# User Interface                   #
####################################
ui <- fluidPage(theme = shinytheme("slate"), # I prefer this theme
                navbarPage("BMI Calculator:",
                           
                           tabPanel("Home",
                                    # Input values
                                    sidebarPanel(
                                      HTML("<h3>Input parameters</h3>"),
                                      textInput("firstname", 
                                                label = "First Name", 
                                                value = ""),  # Text input for first name
                                      sliderInput("height", 
                                                  label = "Height", 
                                                  value = 150, 
                                                  min = 30, 
                                                  max = 250),
                                      sliderInput("weight", 
                                                  label = "Weight", 
                                                  value = 60, 
                                                  min = 20, 
                                                  max = 120),
                                      
                                      actionButton("submitbutton", 
                                                   "Submit", 
                                                   class = "btn btn-primary")
                                    ),
                                    
                                    mainPanel(
                                      tags$label(h3('Status/Output')), # Status/Output Text Box
                                      verbatimTextOutput('contents'),
                                      verbatimTextOutput('nameOutput'),  # Output for the name
                                      tableOutput('tabledata') # Results table
                                    ) # mainPanel()
                                    
                           ), #tabPanel(), Home
                           
                           tabPanel("About", 
                                    titlePanel("About"), 
                                    div(includeMarkdown("about.md"), 
                                        align="justify")
                           ) #tabPanel(), About
                           
                ) # navbarPage()
) # fluidPage()


####################################
# Server                           #
####################################
server <- function(input, output, session) {
  
  # Input Data
  datasetInput <- reactive({  
        bmi <- input$weight/( (input$height/100) * (input$height/100) )
    bmi <- data.frame(bmi)
    names(bmi) <- "BMI"
    print(bmi)
    
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate("Calculation complete.") 
    } else {
      return("Server is ready for calculation.")
    }
  })
  # Output the user's first name
  output$nameOutput <- renderPrint({
    if (input$submitbutton > 0) {
      isolate(paste("Hello,", input$firstname))  # Display the first name
    }
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$submitbutton>0) { 
      isolate(datasetInput()) 
    } 
  })
  
}


####################################
# Create Shiny App                 #
####################################
shinyApp(ui = ui, server = server)
