box::use(
  shiny[moduleServer, NS,selectInput]
)

box::use(app/logic/data_list)

#' @export
ui <- function(id) {
  ns <- NS(id)
  selectInput(ns("input_index"),
              label = "Select Index",
              choices =data_list$index_names,
              selected = "Turkey",multiple = FALSE )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
  })
}
