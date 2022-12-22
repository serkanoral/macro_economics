box::use(
  shiny[moduleServer, NS,downloadButton,downloadHandler],
  readr[write_csv,read_rds],
)

data_csv <- read_rds("app/logic/df.rds")

#' @export
ui <- function(id) {
  ns <- NS(id)
  downloadButton(outputId = ns("download"),label = "Download Data")

}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$download <- downloadHandler(
      filename = function() {
        paste("macro_economics", Sys.Date(), ".csv", sep="")
      },
      content = function(file) {
        write_csv(data_csv, file)
      }
    )

  })
}
