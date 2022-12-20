box::use(
  countrycode,
  dplyr[select, distinct, pull], 
  tidyr[drop_na],
  tibble[tibble],
  readr[read_rds]
)



# index names
#' @export
index_names <- c("Customer Price Index", "Unemployment" 
                 , "Real gross fixed capital formation"
                 , "Real public consumption"
                 , "Retail trade"
                 , "Industrial production" 
                 , "Real gross domestic product"
                 , "Consumer confidence index" 
                 , "Producer price index" 
                 , "Government debt" 
                 , "Gross domestic product"
                 , "Real private consumption"
                 , "House price" 
                 , "Utilization rate"
                 , "Sentiment index"
                 , "Commercial balance (goods + services)"
                 , "Public consumption"
                 , "Private consumption"
                 , "Gross fixed capital formation"
                 , "Exports of goods and services"
                 , "Real change in inventories"
                 , "Real exports of goods and services" 
                 , "Stock exchange index"
                 , "Real imports of goods and services" 
                 , "Imports of goods and services"
                 , "Population" 
                 , "Change in inventories"
                 , "Government balance"
                 , "Total employment"
                 , "Job vacancy rate" 
                 , "Job quits rate" 
                 , "GDP per capital"
                 , "Real GDP per capital" 
                 , "General government total expenditure"
                 , "General government total revenue"
                 , "Money supply"
                 , "Current account balance"
                 , "Hourly wage manufacturing"
                 , "Job layoffs rate" 
                 , "Job hires rate" 
                 , "Oil production"
                 , "Production electricity")

# country codes and names
#' @export
country_code <- countrycode::codelist_panel|> 
  select(country.name.en, wb_api2c)|> 
  distinct()|> 
  drop_na()

# just country codes
#' @export
country_codes <- country_code|> pull(wb_api2c) 

#' @export
country_names <- country_code |> pull(country.name.en)

# just index codes
#' @export
indexes <- c("CPI", "URATE", "RGFCF", "RPUC","RETA",
             "IP", "RGDP","CONF","PPI","GDEBT","GDP",
             "RPRC","HOU","UTIL","SENT","CBAL","PUC",
             "PRC", "GFCF", "EXP", "RCI", "REXP","SEI",
             "RIMP","IMP","POP","CI","GBAL","EMP","JVR",
             "JQR","GDPPC","RGDPPC","GSPE","GREV","M3",
             "CA","WAGEMAN","JLR","JHR","OILPROD","ELE") 
# index code + names
#' @export
index_df <- tibble(index_names = index_names ,  indexes = indexes)

# the data we will import
#' @export
lists <- expand.grid(country_codes,indexes,stringsAsFactors = FALSE) 


df <- read_rds("app/logic/df.rds")

#' @export
country_names_ <- df |> pull(country_name) |> unique()


