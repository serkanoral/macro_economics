box::use(
  purrr[map2_dfr,possibly],
  tidyr[pivot_longer,drop_na],
  dplyr[select,distinct,mutate,rename,pull],
  countrycode,
  app/logic/functions
)




# Country Abbreviation

country_code <- countrycode::codelist_panel |> 
  select(country.name.en, wb_api2c ) |> 
  distinct() |> 
  drop_na()

country_codes <- country_code |> pull(wb_api2c) 
indexes <- c("CPI", "URATE", "RGFCF", "RPUC","RETA",
           "IP", "RGDP","CONF","PPI","GDEBT","GDP",
           "RPRC","HOU","UTIL","SENT","CBAL","PUC",
           "PRC", "GFCF", "EXP", "RCI", "REXP","SEI",
           "RIMP","IMP","POP","CI","GBAL","EMP","JVR",
           "JQR","GDPPC","RGDPPC","GSPE","GREV","M3",
           "CA","WAGEMAN","JLR","JHR","OILPROD","ELE") 


# lists <- expand.grid(country_codes,indexes,stringsAsFactors = FALSE) 
lists <- expand.grid(c("TR","US","FR"),c("CPI","PPI","URATE"),stringsAsFactors = FALSE) 

#' @export
df <- map2_dfr(lists$Var1,lists$Var2,
               possibly(~functions$read_cpi(country = .x,index = .y),otherwise = NULL,quiet = TRUE))|> 
  pivot_longer(!c(date, country_abb), names_to = "index",values_to = "rate",values_drop_na = TRUE) 



# df <- map2_dfr(lists$Var1,lists$Var2,
#                possibly(~functions$read_cpi(country = .x,index = .y),otherwise = NULL))|> 
#   pivot_longer(!c(date, country_abb), names_to = "index",values_to = "rate") |> 
#   drop_na()





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


