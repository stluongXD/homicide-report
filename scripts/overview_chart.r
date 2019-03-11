library(dplyr)
library(plotly)


overview_graph <- function(dataset, state_input, year_inputs) {

  # filters data down to the years and state selected
  filter_data <- homicide_data %>%
    filter(State == state_input, Year >= year_inputs[1], Year <= year_inputs[2]) %>%
    group_by(Year) %>%
    count()

  # Creates bar chart based on inputs
  bar_graph <- plot_ly(filter_data,
    x = filter_data$Year,
    y = filter_data$n,
    type = "bar",
    opacity = .8,
    hoverinfo = "y"
  ) %>%
    layout(
      title = paste0("Homicides in ", state_input, " from ", year_inputs[1], "-", year_inputs[2]),
      xaxis = list(
        title = "Year",
        showticklabels = TRUE
      ),
      yaxis = list(
        title = "Number of Homicides",
        showticklabels = TRUE
      )
    )


  bar_graph
}