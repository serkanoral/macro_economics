
box::use(
  dplyr[select,distinct,pull,mutate,rename],
  tidyr[drop_na],
  readr[read_csv],
  purrr[set_names]
)



#' @export
read_cpi <- function(country, index) {
  
  Sys.sleep(sample(1:10,size = 1,replace = TRUE))
  read_csv(paste0("https://www.econdb.com/api/series/",index,country, "/?format=csv"),
           show_col_types = FALSE, col_types = "Ddc") |> 
    mutate(country_abb = country) |> 
    rename(index = paste0(index,country)) |> 
    set_names(c("date", index, "country_abb")) 
  
}

  


    

  # Index:
  # CPI - Customer Price Index *
  # URATE - Unemployment *
  # RGFCF - Real gross fixed capital formation
  # RPUC - Real public consumption
  # RETA - Retail trade
  # IP - Industrial production *
  # RGDP - Real gross domestic product
  # CONF - Consumer confidence index *
  # PPI - Producer price index *
  # GDEBT - Government debt *
  # GDP - Gross domestic product
  # RPRC - Real private consumption
  # HOU - House price *
  # UTIL - Utilization rate
  # SENT - Sentiment index
  # CBAL - Commercial balance (goods + services)
  # PUC - Public consumption
  # PRC - Private consumption
  # GFCF - Gross fixed capital formation
  # EXP - Exports of goods and services
  # RCI - Real change in inventories
  # REXP - Real exports of goods and services *
  # SEI - Stock exchange index
  # RIMP - Real imports of goods and services *
  # IMP -  Imports of goods and services
  # POP -  Population *
  # CI - Change in inventories
  # GBAL - Government balance
  # EMP - Total employment
  # JVR - Job vacancy rate *
  # JQR - Job quits rate *
  # GDPPC - GDP per capital
  # RGDPPC - Real GDP per capital *
  # GSPE - General government total expenditure
  # GREV - General government total revenue
  # M3 - Money supply
  # CA - Current account balance
  # WAGEMAN - Hourly wage manufacturing
  # JLR - Job layoffs rate *
  # JHR - Job hires rate *
  # OILPROD - Oil production
  # ELE - Production electricity *
  
    






