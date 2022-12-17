box::use(
  shiny[fluidPage, moduleServer, NS,reactiveFileReader,bindCache,fluidRow,column],
  readr[read_rds],
)

box::use(
  app/logic/get_data[load_data],
  app/view/plot,
  app/view/input_country,
  app/view/input_index

)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    fluidRow(
      column(6,input_country$ui(ns("input_country")),
                   input_index$ui(ns("input_index")),
             plot$ui(ns("plot"))))
      
    
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    df <- reactiveFileReader(86400000,session, "app/logic/df.rds",read_rds) 
    
    plot$server("plot", df)
  })
}
