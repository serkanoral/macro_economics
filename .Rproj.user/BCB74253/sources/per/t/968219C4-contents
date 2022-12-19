box::use(
  shiny[fluidPage, moduleServer, NS,reactiveFileReader,bindCache,
        fluidRow,column,br,tabsetPanel,tabPanel],
  readr[read_rds],
)

box::use(
  app/logic/get_data[load_data],
  app/view/plot_country,
  app/view/plot_index
  
  
  
  
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    br(),
    tabsetPanel(id = "tabs",type = "pills",
                br(),
                tabPanel(title = "Index",plot_country$ui(ns("plot_country"))),
                tabPanel(title = "Country", plot_index$ui(ns("plot_index"))))
    
    
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    df <- reactiveFileReader(86400000,session, "app/logic/df.rds",read_rds) 
    
    plot_country$server("plot_country", df)
    plot_index$server("plot_index",df)
    
  })
}