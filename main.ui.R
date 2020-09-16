fluidPage(
  Component.Notification(
    status = "danger",
    context = paste0(
      "1. Due to the limited performance of the server used on this site, some caches are stored in the browser.",
      "If the screen display is strange or the value is not updated, reload or clear the cache and access again.",
      "2. Since May 9, the standards for releasing data from the Ministry of Health, Labor and Welfare have changed significantly, so it is necessary to deal with all figures other than the number of infected people and the number of deaths. Please note that data such as the number of discharged patients and the number of tests will not be updated until the response is completed."
    )
  ),
  source(
    file = ( "~/OneDrive/rdirectory/dashb/Dashboard/FirstRow.ui.R"), #/Users/yusterronoh/OneDrive/rdirectory/dashb/Dashboard
    local = T,
    encoding = "UTF-8"
  )$value,
 )
  
  # fluidRow(
  #   boxPlus(
  #     title = tagList(
  #       icon("map-marked-alt"),
  #       ("Situation in Each Prefecture")
  #     ),
  #     closable = F,
  #     collapsible = T,
  #     width = 12,
  #     tabsetPanel(
  #       source(
  #         file = paste0(COMPONENT_PATH, "/Main/ConfirmedMap.ui.R"),
  #         local = T,
  #         encoding = "UTF-8"
  #       )$value,
  #       source(
  #         file = paste0(COMPONENT_PATH, "/Main/ComparePref.ui.R"),
  #         local = T,
  #         encoding = "UTF-8"
  #       )$value,
  #       tabPanel(
  #         title = tagList(icon("th"), ("感染者数ヒートマップ")),
  #         fluidRow(
  #           column(
  #             width = 9,
  #             uiOutput("confirmedHeatmapWrapper") %>% withSpinner(proxy.height = "600px")
  #           ),
  #           column(
  #             width = 3,
  #             tags$div(
  #               radioGroupButtons(
  #                 inputId = "confirmedHeatmapSelector",
  #                 label = ("ヒートマップ選択"),
  #                 size = "sm", justified = T,
  #                 choiceNames = c(("日次新規"), ("倍加時間")),
  #                 choiceValues = list("confirmedHeatmap", "confirmedHeatmapDoublingTime"),
  #                 status = "danger"
  #               ),
  #               style = "margin-top:5px;"
  #             ),
  #             uiOutput("confirmedHeatmapDoublingTimeOptions")
  #           )
  #         )
  #       ),
  #       tabPanel(
  #         title = tagList(icon("grip-horizontal"), ("市区町村の感染者数")),
  #         echarts4rOutput("confirmedCityTreemap", height = "600px") %>% withSpinner()
  #       )
  #     ),
  #     tags$hr(),
  #     source(
  #       file = paste0(COMPONENT_PATH, "Main/DescriptionValue.ui.R"),
  #       local = T,
  #       encoding = "UTF-8"
  #     )$value,
  #     footer = tags$small(paste(
  #       ("更新時刻"), UPDATE_DATETIME, ("開発＆調整中")
  #     ))
  #   ),
  # ),
  # fluidRow(
  #   Component.Tendency()
  # ),
  # fluidRow(
  #   Component.ComfirmedPyramid(),
  #   Component.SymptomsProgression()
  # ),
  # fluidRow(
  #   Component.NewsList(),
  #   column(
  #     width = 8,
  #     actionButton(
  #       width = "100%",
  #       inputId = "gotoRoutePage",
  #       style = paste0("color: #fff; background-color: ", middleRed),
  #       label = tagList(
  #         ("感染ルート・クラスターへ"),
  #         dashboardLabel(
  #           "Beta 0.2",
  #           status = "warning"
  #         )
  #       ),
  #       icon = icon("connectdevelop")
  #     )
#     )
#   )
# )


##############################################################################################################
# fluidPage(
#   Component.Notification(
#     status = "danger",
#     context = paste0(
#       "1. Due to the limited performance of the server used on this site, some caches are stored in the browser.",
#       "If the screen display is strange or the value is not updated, reload or clear the cache and access again.",
#       "2. Since May 9, the standards for releasing data from the Ministry of Health, Labor and Welfare have changed significantly, so it is necessary to deal with all figures other than the number of infected people and the number of deaths. Please note that data such as the number of discharged patients and the number of tests will not be updated until the response is completed."
#     )
#   ),
#   source(
#     file = paste0(COMPONENT_PATH, "/Main/FirstRow.ui.R"),
#     local = T,
#     encoding = "UTF-8"
#   )$value,
#   fluidRow(
#     boxPlus(
#       title = tagList(
#         icon("map-marked-alt"),
#         ("Situation in Each Prefecture")
#       ),
#       closable = F,
#       collapsible = T,
#       width = 12,
#       tabsetPanel(
#         source(
#           file = paste0(COMPONENT_PATH, "/Main/ConfirmedMap.ui.R"),
#           local = T,
#           encoding = "UTF-8"
#         )$value,
#         source(
#           file = paste0(COMPONENT_PATH, "/Main/ComparePref.ui.R"),
#           local = T,
#           encoding = "UTF-8"
#         )$value,
#         tabPanel(
#           title = tagList(icon("th"), ("感染者数ヒートマップ")),
#           fluidRow(
#             column(
#               width = 9,
#               uiOutput("confirmedHeatmapWrapper") %>% withSpinner(proxy.height = "600px")
#             ),
#             column(
#               width = 3,
#               tags$div(
#                 radioGroupButtons(
#                   inputId = "confirmedHeatmapSelector",
#                   label = ("ヒートマップ選択"),
#                   size = "sm", justified = T,
#                   choiceNames = c(("日次新規"), ("倍加時間")),
#                   choiceValues = list("confirmedHeatmap", "confirmedHeatmapDoublingTime"),
#                   status = "danger"
#                 ),
#                 style = "margin-top:5px;"
#               ),
#               uiOutput("confirmedHeatmapDoublingTimeOptions")
#             )
#           )
#         ),
#         tabPanel(
#           title = tagList(icon("grip-horizontal"), ("市区町村の感染者数")),
#           echarts4rOutput("confirmedCityTreemap", height = "600px") %>% withSpinner()
#         )
#       ),
#       tags$hr(),
#       source(
#         file = paste0(COMPONENT_PATH, "Main/DescriptionValue.ui.R"),
#         local = T,
#         encoding = "UTF-8"
#       )$value,
#       footer = tags$small(paste(
#         ("更新時刻"), UPDATE_DATETIME, ("開発＆調整中")
#       ))
#     ),
#   ),
#   fluidRow(
#     Component.Tendency()
#   ),
#   fluidRow(
#     Component.ComfirmedPyramid(),
#     Component.SymptomsProgression()
#   ),
#   fluidRow(
#     Component.NewsList(),
#     column(
#       width = 8,
#       actionButton(
#         width = "100%",
#         inputId = "gotoRoutePage",
#         style = paste0("color: #fff; background-color: ", middleRed),
#         label = tagList(
#           ("感染ルート・クラスターへ"),
#           dashboardLabel(
#             "Beta 0.2",
#             status = "warning"
#           )
#         ),
#         icon = icon("connectdevelop")
#       )
#     )
#   )
#)
##############################################################################################################





