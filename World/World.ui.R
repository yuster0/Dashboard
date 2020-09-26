fluidRow(
  box(
    width = 12,
    closable = F,
    title = tagList(icon("globe"), "World Map"),
    fluidRow(
      column(
        width = 8,
        fluidRow(
          column(
            width = 9,
            radioGroupButtons(
              inputId = "switchWorldMap",
              label = NULL,
              justified = T,
              choiceNames = c(
                paste(icon("procedures"), ("infection")),
                paste(icon("vials"), ("Infection")),
                paste(icon("user-plus"), ("Positivity rate"))
              ),
              choiceValues = c("worldCase", "worldTest", "worldRate"),
              status = "danger"
            )
          ),
          column(
            width = 3,
            switchInput(
              inputId = "switchWorldMapVersion",
              value = T,
              onLabel = ("Simple"),
              onStatus = "danger",
              offStatus = "danger",
              offLabel = ("The details"),
              label = ("Display mode"),
              inline = T,
              size = "small",
              width = "300px",
              labelWidth = "200px",
              handleWidth = "100px"
            ),
          )
        ),
        uiOutput("worldConfirmedDateSelector"),
        echarts4rOutput("worldConfirmed", height = "600px") %>% withSpinner()
      ),
      column(
        width = 4,
        echarts4rOutput("countryLine", height = "350px") %>% withSpinner(),
        echarts4rOutput("countryTestLine", height = "350px") %>% withSpinner()
      )
    )
  ),
  box(
    width = 12,
    closable = F,
    title = "Summary",
    dataTableOutput("worldSummaryTable") %>% withSpinner()
  )
)
