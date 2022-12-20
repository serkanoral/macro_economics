box::use(
  app/logic/plot_func[country_plot],
  app/logic/data_list
  
)

box::use(
  shiny[moduleServer, NS,tagList,selectizeInput,fluidPage,observeEvent],
  echarts4r[echarts4rOutput,renderEcharts4r],
 shinyWidgets[pickerInput]
  
)

data_list$index_names

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    selectizeInput(inputId = ns("select_index"),
                label = "Select Index",
                choices = data_list$index_names,
                selected = "Customer Price Index",
                multiple = FALSE),
    selectizeInput(inputId = ns("select_country"),
                   label = "Select Country",
                   choices = data_list$country_names_,
                   selected = c("Germany","Japan","United States"),
                   multiple = TRUE, 
                   options = list(maxItems = 5)),
    echarts4rOutput(ns("plot_country"))
  )
  
  
}

#' @export
server <- function(id,df) {
  moduleServer(id,  function(input, output, session) {
    
    output$plot_country <- renderEcharts4r({country_plot(data = df(),
                                                 index_name = input$select_index ,
                                                 country = input$select_country)})
   
  })
}



