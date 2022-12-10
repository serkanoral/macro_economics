box::use(
  purrr[map2_dfr,possibly],
  tidyr[drop_na, pivot_longer],
  dplyr[select,distinct,mutate,rename,pull],
  app/logic/functions
)




# Country Abbreviation

country_code <- countrycode::codelist_panel |> 
  select(country.name.en, wb_api2c ) |> 
  distinct() |> 
  drop_na()

codes <- country_code |> pull(wb_api2c) 
index <- c("CPI", "URATE", "RGFCF", "RPUC","RETA",
           "IP", "RGDP","CONF","PPI","GDEBT","GDP",
           "RPRC","HOU","UTIL","SENT","CBAL","PUC",
           "PRC", "GFCF", "EXP", "RCI", "REXP","SEI",
           "RIMP","IMP","POP","CI","GBAL","EMP","JVR",
           "JQR","GDPPC","RGDPPC","GSPE","GREV","M3",
           "CA","WAGEMAN","JLR","JHR","OILPROD","ELE") 


lists <- expand.grid(codes,index,stringsAsFactors = FALSE) 

df <- map2_dfr(lists$Var1,lists$Var2,possibly(~functions$read_cpi(country = .x,index = .y),otherwise = NULL) )


df <- df |> 
  pivot_longer(!c(date, country_abb), names_to = "index",values_to = "rate") |> 
  drop_na()


#' @export
df


