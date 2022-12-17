box::use(
  app/logic/plot_func[country_plot],

  
  

)

box::use(
  shiny[moduleServer, NS],
  echarts4r[echarts4rOutput,renderEcharts4r],
  
  
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("plot"))
}

#' @export
server <- function(id,df) {
  moduleServer(id,  function(input, output, session) {
  
    output$plot <- renderEcharts4r({country_plot(data = df())})
   
  })
}

