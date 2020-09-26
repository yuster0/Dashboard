
source(
    file = ("~/OneDrive/rdirectory/Dashboard/global.R"), 
    local = TRUE, 
    encoding = "UTF-8"
)

shinyServer(function(input, output, session){
    source(file = ("~/OneDrive/rdirectory/Dashboard/World/World.server.R"), local = T, encoding = "UTF-8")
    #source(file = ("~/OneDrive/rdirectory/dashb/Dashboard/Functions.R"), local = T, encoding = "UTF-8") 
    source(file = ("~/OneDrive/rdirectory/Dashboard/ValueBox.R"), local = T, encoding = "UTF-8")
    source(
        file = ("~/OneDrive/rdirectory/Dashboard/Sparkline.R"),local = TRUE, encoding = "UTF-8"
    )
     #observeEvent(input$switchCaseMap, {
   updateTabItems(session, "sideBarTab")
   
     #})
})
