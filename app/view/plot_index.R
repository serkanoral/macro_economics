box::use(
  app/logic/plot_func[index_plot],
  app/logic/data_list,
  
)

box::use(
  shiny[moduleServer, NS,tagList,selectizeInput,fluidPage],
  echarts4r[echarts4rOutput,renderEcharts4r],
  
  
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    selectizeInput(inputId = ns("select_index"),
                   label = "Select Index",
                   choices = data_list$index_names,
                   selected = c("Real imports of goods and services","Real exports of goods and services"),
                   multiple = TRUE, 
                   options = list(maxItems = 2,minItems =2)),
    selectizeInput(inputId = ns("select_country"),
                   label = "Select Country",
                   choices = data_list$country_names_,
                   selected = "Turkey",
                   multiple = FALSE),
    echarts4rOutput(ns("plot_index"))
  )
  
  
}

#' @export
server <- function(id,df) {
  moduleServer(id,  function(input, output, session) {
    
    output$plot_index <- renderEcharts4r({index_plot(data = df(),
                                                         index_name = input$select_index,
                                                         country = input$select_country)})
    
  })
}



