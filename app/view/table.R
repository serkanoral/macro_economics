box::use(
  shiny[moduleServer, NS],
  reactable[reactableOutput,renderReactable]
)

box::use(
  app/logic/data
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  reactableOutput(ns("table"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
  output$table <- renderReactable(data$reac_table)
  })
}
