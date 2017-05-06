library(shiny)
# Define UI for dataset viewer application
fluidPage(includeCSS("bootstrap.css"),
  # Application title
  titlePanel("My Assignment"),
  # Sidebar with controls to provide a caption, select a dataset,
  # and specify the number of observations to view. Note that
  # changes made to the caption in the textInput control are
  # updated in the output area immediately as you type
  sidebarLayout(position = "left",
    sidebarPanel(h3("Data Set Selection"),
      textInput("caption", "Caption:", "My Data Summary"),

      selectInput("dataset", "Select a dataset:",
                  choices = c("Cars", "Morley", "mtcars", "Seatbelts")),

      numericInput("obs", "Number of observations to view:", 10),
      # Add a download button so the user can determine a dataset and
      # a csv file od the data can be downloaded
      downloadButton('downloadData', 'Download')
    ),
    # Show the caption, a summary of the dataset and an HTML
    # table with the requested number of observations
    mainPanel(
      h3(textOutput("caption", container = span)),
      verbatimTextOutput("summary"),
      tableOutput("view")
    )
  )
)