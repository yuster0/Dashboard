
source(
    file = ("~/OneDrive/rdirectory/dashb/Dashboard/global.R"),
    local = TRUE,
    encoding = "UTF-8"
)

shinyServer(function(input, output){
    source(file = ( "~/OneDrive/rdirectory/dashb/Dashboard/Functions.R"), local = T, encoding = "UTF-8") 
    source(file = ( "~/OneDrive/rdirectory/dashb/Dashboard/ValueBox.R"), local = T, encoding = "UTF-8")
    source(file = ( "~/OneDrive/rdirectory/dashb/Dashboard/FirstRow.ui.R"), local = T, encoding = "UTF-8")
    
    # observeEvent(input$switchCaseMap, {
   # updateTabItems(session, "sideBarTab")

})
