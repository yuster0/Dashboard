
source(
    file = "global.R",
    local = TRUE,
    encoding = "UTF-8"
)

shinyServer(function(input, output){
    source(file = ( "~/OneDrive/flexdashboard/sam_dash/Functions.R"), local = T, encoding = "UTF-8")
    source(file = ( "~/OneDrive/flexdashboard/sam_dash/ValueBox.R"), local = T, encoding = "UTF-8")
    source(file = ( "~/OneDrive/flexdashboard/sam_dash/FirstRow.ui.R"), local = T, encoding = "UTF-8")
    
    # observeEvent(input$switchCaseMap, {
   # updateTabItems(session, "sideBarTab")

})
