fluidRow(
  column(
    width = 12,
    style = "padding:0px;",
    widgetUserBox(
      title = ("Novel Coronavirus"),
      subtitle = ("Coronavirus disease 2019 (COVID-19)"),
      width = 12,
      type = NULL,
      src = "ncov.jpeg",
      color = "purple",
      collapsible = F,
      background = T,
      footer_padding = F,
      backgroundUrl = "ncov_back.jpg",
      # tags$p(dashboardLabel(status = 'danger',  # APIアクセスできなかった
      #                       style = 'square',
      #                       paste(sep = ' | ', lang[[langCode]][71], # ページ閲覧数
      #                             statics$result$totals$pageviews$all)
      #                       ),
      #        dashboardLabel(status = 'success',
      #                       style = 'square',
      #                       paste(sep = ' | ', lang[[langCode]][72], # 閲覧者数
      #                             statics$result$totals$uniques)
      #        )
      #        ),

      )
    )
  )
  column(
    width = 7,
    fluidRow(
      Component.MainValueBox(
        mainValue = sum(mhlwSummary[date == max(date)]$Tested, na.rm = T),
        mainValueSub = getFileUpdateTime(mhlwSummaryPath),
        sparklineName = "pcrSparkLine",
        diffNumber = (sum(mhlwSummary[date == max(date)]$Tested) - sum(mhlwSummary[date == max(date) - 1]$Tested, na.rm = T)),
        text = ("Tested"),
        icon = "vials",
        color = "yellow"
      ),
      Component.MainValueBox(
        mainValue = 75654,
        mainValueSub = 312,
        sparklineName = "confirmedSparkLine",
        diffNumber = 4325,
        text = ("Confirmed"),
        icon = "procedures",
        color = "red"
      )
    ),
    fluidRow(
      Component.MainValueBox(
        mainValue = sum(mhlwSummary[date == max(date)]$Discharged),
        # Discharged / (PCR Positive - クルーズ船帰国の40名 - Death)
        mainValueSub = paste0(round(sum(mhlwSummary[date == max(date)]$Discharged) /
          (sum(mhlwSummary[date == max(date)]$Positive) - 40 - sum(mhlwSummary[date == max(date)]$Death, na.rm = T)) * 100, 2), "%"),
        sparklineName = "dischargeSparkLine",
        diffNumber = (sum(mhlwSummary[date == max(date)]$Discharged) - sum(mhlwSummary[date == max(date) - 1]$Discharged, na.rm = T)),
        text = ("Recovered"),
        icon = "user-shield",
        color = "green"
      ),
      Component.MainValueBox(
        mainValue = 2345,
        mainValueSub = paste0(round(100 * 2345/ 75654, 2), "%"),
        sparklineName = "deathSparkLine",
        diffNumber = 321,
        text = ("Death"),
        icon = "bible",
        color = "navy"
      )
    ),
    fluidRow(column(
      width = 12,
      style = "padding:0px;",
      boxPlus(
        width = 12,
        actionButton(
          inputId = "twitterShare",
          label = "Twitter",
          icon = icon("twitter"),
        )
      )
    )
  )
)
  

