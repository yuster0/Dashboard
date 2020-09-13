Component.MainValueBox <-
  function(mainValue,
           mainValueSub,
           sparklineName,
           diffNumber,
           text,
           icon,
           color) {
    valueBox(
      width = 6,
      value = tagList(
        countup(mainValue),
        tags$small(paste0("| ", mainValueSub),
          style = "color:white;font-size:16px;margin-top:10px;margin-right:10px;opacity:0.8"
        )
      ),
      subtitle = tagList(
        "　",
        sparklineOutput(sparklineName),
        tags$span(
          countup(diffNumber),
          getChangeIconWrapper(diffNumber),
          text,
          style = "float:right;"
        )
      ),
      icon = icon(icon),
      color = color
    )
  }

# Explanation of the impact of matching the number of discharges
Component.MainValueBox.Info <-
  function(mainValue,
           mainValueSub,
           sparklineName,
           diffNumber,
           text,
           icon,
           color) {

    valueBox(
      width = 6,
      value = tagList(
        countup(mainValue),
        tags$small(paste0("| ", mainValueSub),
                   tags$span(id = "discharged_info", icon("info-circle")),
                   bsTooltip(id = "discharged_info",
                             title = sprintf(("The number of confirmed discharges is% s, and other% s discharges are in the process of matching with individual positives. Therefore, the total number of hospitalizations and discharges does not match the number of positive PCR tests. <br><br> *From April 22, 2nd year of Reiwa, the standard for the number of discharged patients released by the Ministry of Health, Labor and Welfare has changed."),
                             mainValueSub, (mainValue - mainValueSub)),
                             placement = "right"),
                   style = "color:white;font-size:16px;margin-top:10px;margin-right:10px;opacity:0.8"
        )
      ),
      subtitle = tagList(
        "　",
        sparklineOutput(sparklineName),
        tags$span(
          countup(diffNumber),
          getChangeIconWrapper(diffNumber),
          text,
          style = "float:right;"
        )
      ),
      icon = icon(icon),
      color = color
    )
  }
