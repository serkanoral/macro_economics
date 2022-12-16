box::use(
echarts4r[e_charts,e_line,e_theme,e_datazoom,e_tooltip,e_title],
dplyr[filter,group_by,arrange],
)




country_plot <- function(data , index_name = "Customer Price Index", country = "TR"){
  
  data |> 
    filter(index_names == index_name & country_abb == country) |> 
    group_by(country_name) |> 
    arrange(date) |> 
    e_charts(x = date) |> 
    e_line(serie = rate) |> 
    e_theme("dark") |> 
    e_datazoom(type = "slider") |> 
    e_tooltip(trigger = "axis") |> 
    e_title(index_name) 
   
  
}


