box::use(
echarts4r[e_charts,e_line,e_line_,e_theme,e_datazoom,e_tooltip,e_title,e_toolbox_feature],
dplyr[filter,group_by,arrange],
janitor[clean_names],
tidyr[pivot_wider],

)




country_plot <- function(data , 
                         index_name = "Customer Price Index", 
                         country = c("Germany","Japan","United States")) {
  
  data |> 
    filter(index_names == index_name & country_name %in% country) |> 
    group_by(country_name) |> 
    arrange(date) |> 
    e_charts(x = date) |> 
    e_line(serie = rate) |> 
    e_theme("chalk") |> 
    e_datazoom(type = "slider") |> 
    e_tooltip(trigger = "axis") |> 
    e_title(index_name) |> 
    e_toolbox_feature(feature = "saveAsImage")
   
  
}


index_plot <- function(data, 
                          index_name = c("Real imports of goods and services",
                                         "Real exports of goods and services"), 
                          country = "Turkey") {

  
    data |> 
    filter(index_names %in% index_name & country_name == country) |> 
    pivot_wider(names_from = index_names,values_from = rate) |> 
    e_charts(x = date) |> 
    e_line_(serie = index_name[1]) |> 
    e_line_(serie = index_name[2], x_index = 1, y_index = 1) |>
    e_theme("chalk") |> 
    e_datazoom(type = "slider") |> 
    e_tooltip(trigger = "axis") |> 
    e_title(country) |> 
    e_toolbox_feature(feature = "saveAsImage")
  
}




  










