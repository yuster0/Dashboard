fluidRow(
  boxPlus(
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
                paste(icon("procedures"), i18n$t("infection")),
                paste(icon("vials"), i18n$t("Infection")),
                paste(icon("user-plus"), i18n$t("Positivity rate"))
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
              onLabel = i18n$t("Simple"),
              onStatus = "danger",
              offStatus = "danger",
              offLabel = i18n$t("The details"),
              label = i18n$t("Display mode"),
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
  boxPlus(
    width = 12,
    closable = F,
    title = "Summary",
    dataTableOutput("worldSummaryTable") %>% withSpinner()
  )
)
