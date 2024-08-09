# I am building my first app!


# Data Professor help with this
# http://youtube.com/dataprofessor #


# Modified from Winston Chang, 
# https://shiny.rstudio.com/gallery/shiny-theme-selector.html


# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("slate"),# i prefer this theme.
    navbarPage(
      # theme = "slate",  # <--- To use a theme, uncomment this
      "Tolu's first app",
      tabPanel("Navbar 1",
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("txt1", "First Name:", "Tolulope"),# wrote my name intentionally
                 textInput("txt2", "Surname:", "Omotayo"),# wrote my name internationally 
                 
               ), # sidebarPanel
               mainPanel(
                            h1("Header 1"),
                            
                            h3("Output 1"),
                            verbatimTextOutput("txtout"),

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("Navbar 2", "This panel is intentionally left blank"),
      tabPanel("Navbar 3", "This panel is intentionally left blank")
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function  
  server <- function(input, output) {
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
  } # server
  

  # Create Shiny object
  shinyApp(ui = ui, server = server)