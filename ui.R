library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Plot genes from any time course experiment:"),
  # Application title
  hr(),
  br(),
  fluidRow(
	  column(5,
		  fileInput("filename", label = "Data file input (support .csv, .txt, .tab)",
		  		  accept = c(
		  		            "text/csv",
		  		            "text/comma-separated-values,text/plain",
		  		            ".csv")),
		  actionButton("Submit","Submit for processing"),
		  hr(),
		  br(),
		  textInput("feature", "Feature Name:", "")),

              
      column(8, 
             # Show a plot of the generated distribution
             mainPanel(plotOutput('plot'),  width = "100%")))
			 
 ))
			 
