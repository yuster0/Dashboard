Component.Notification <- function(status = "info", context = "") {
  return(fluidRow(
    box(
      width = 12,
      closable = T,
      enable_label = T,
      label_text = "New",
      label_status = "warning",
      solidHeader = T,
      status = status,
      title = tagList(icon("bullhorn"), ("Notification")),
      collapsible = T,
      collapsed = T,
      tags$small(context)
    )
  ))
}
