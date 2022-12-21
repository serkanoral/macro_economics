
box::use(
  dplyr[select,distinct,pull,mutate,rename,left_join],
  tidyr[drop_na,pivot_longer],
  readr[read_csv],
  purrr[set_names,map2_dfr,possibly],
  tibble[tibble],
)

box::use(
  app/logic/data_list
)


# Datasets


#' @export
load_data <- function() {
  
  read_page <- function(country, index) {
    
    Sys.sleep(sample(1:10,size = 1,replace = TRUE))
    read_csv(paste0("https://www.econdb.com/api/series/",index,country, "/?format=csv"),
             show_col_types = FALSE, col_types = "Ddc") |> 
      mutate(country_abb = country) |> 
      rename(index = paste0(index,country)) |> 
      set_names(c("date", index, "country_abb")) 
  }

 map2_dfr(data_list$lists$Var1,data_list$lists$Var2,
               possibly(~read_page(country = .x,index = .y),otherwise = NULL,quiet = TRUE))|> 
  pivot_longer(!c(date, country_abb), names_to = "index",
               values_to = "rate",values_drop_na = TRUE) |> 
  left_join(data_list$country_code, by = c("country_abb" = "wb_api2c")) |> 
  left_join(data_list$index_df, by = c("index" = "indexes")) |> 
  rename("country_name" = country.name.en)|> 
   write_rds(file = "app/logic/df.rds")
  
  
}






