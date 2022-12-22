box::use(
  app/logic/get_data[load_data],
  rsconnect[deployApp]
)

load_data()

deployApp("Macro_Economics",  launch.browser = FALSE)
