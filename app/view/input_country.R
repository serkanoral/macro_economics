box::use(
  shiny[moduleServer, NS,selectInput]
)

box::use(app/logic/data_list)

#' @export
ui <- function(id) {
  ns <- NS(id)
selectInput(ns("input_country"),
            label = "Select Country",
            choices =data_list$country_names,
            selected = "Turkey",multiple = TRUE )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
  })
}
