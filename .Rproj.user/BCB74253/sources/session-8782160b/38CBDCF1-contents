box::use(
  app/logic/plot_func[index_plot],
  app/logic/data_list,
  
)

box::use(
  shiny[moduleServer, NS,tagList,selectizeInput,fluidPage,br,fluidRow,column,req],
  echarts4r[echarts4rOutput,renderEcharts4r],
  
  
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    br(),
    fluidRow(column(6,selectizeInput(inputId = ns("select_index"),
                                     label = "Select Index",
                                     choices = data_list$index_names,
                                     selected = c("Real imports of goods and services","Real exports of goods and services"),
                                     multiple = TRUE, 
                                     options = list(maxItems = 2)),
                    column(6,selectizeInput(inputId = ns("select_country"),
                                            label = "Select Country",
                                            choices = data_list$country_names_,
                                            selected = "Turkey",
                                            multiple = FALSE)))),
    
    echarts4rOutput(ns("plot_index"))
  )
  
  
}

#' @export
server <- function(id,df) {
  moduleServer(id,  function(input, output, session) {
    
    output$plot_index <- renderEcharts4r({req(input$select_index,input$select_country)
      index_plot(data = df(),index_name = input$select_index,
                                country = input$select_country)})
    
  })
}



