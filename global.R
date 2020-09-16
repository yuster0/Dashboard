library(shiny)
library(shinydashboard)
library(data.table)
library(DT)
library(ggplot2)
library(shinycssloaders)
library(shinydashboardPlus)
library(shinyWidgets)
library(leaflet)
library(rjson)
library(htmltools)
library(leaflet.minicharts)
library(echarts4r)
library(sparkline)
library(shinyBS)
library(shiny.i18n)
library(countup)

DATA_PATH <- "~/OneDrive/rdirectory/dashb/Dashboard/" 

source(file = ( "~/OneDrive/rdirectory/dashb/Dashboard/Functions.R"), local = T, encoding = "UTF-8") 
source(file = ( "~/OneDrive/rdirectory/dashb/Dashboard/ValueBox.R"), local = T, encoding = "UTF-8")
source(file = ( "~/OneDrive/rdirectory/dashb/Dashboard/Notification.R"), local = T, encoding = "UTF-8")




mhlwSummaryPath <- paste0(DATA_PATH, "/MHLW/summary1.csv")
mhlwSummary <- fread(file = mhlwSummaryPath)
mhlwSummary$date <- as.Date(as.character(mhlwSummary$date), "%Y%m%d")
mhlwSummary <- mhlwSummary[order(Name_region, date)]
setnafill(mhlwSummary, type = "locf", cols = c("Positive", "Discharged", "Tested"))

GLOBAL_VALUE <- reactiveValues(
  World = list(
    Summary = NULL,
    SummaryTable = NULL
  )
)
