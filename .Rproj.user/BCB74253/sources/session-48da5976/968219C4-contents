box::use(
  shiny[fluidPage, moduleServer, NS,reactiveFileReader,bindCache,
        fluidRow,column,br,tabsetPanel,tabPanel,titlePanel,p],
  readr[read_rds],
  bslib[bs_theme,font_google,bs_add_variables],
  thematic[thematic_shiny],
  
)

box::use(
  app/logic/get_data[load_data],
  app/view/plot_country,
  app/view/plot_index,
  app/view/download
  
)


my_theme <- bs_theme(bootswatch = "darkly",
                     bg = "#2b344080", 
                     fg = "#ffffff",
                     base_font = font_google("Inter")) 

thematic_shiny(font = "auto")

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    theme = my_theme,
    titlePanel(title = "Macro Economics"),
    br(),
    p("Index tab, you can compare up to 10 countries for each index."),
    p("Country tab, you can compare 2 indexes for each country. 
    This is a dual axis chart, 
      which means first index will be on the left and second index will be on the right. 
      You have to choose two indexes to create a chart."),
    p("You can filter the dates either with selecting zoom on the right corner of the chart 
    and make a selection on the chart, 
    or there is a slider below the chart, you can slide and filter with that as well. 
    You can download the chart as well as the data.
      Not all the countries have these index values so the chart may appear empthy."),
    
    download$ui(ns("download")),
    br(),br(),
    tabsetPanel(id = "tabs",type = "pills",
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
    download$server("download")
    
  })
}
