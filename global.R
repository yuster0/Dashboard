library(shiny)
library(shinydashboard)
library(data.table)
library(DT)
library(ggplot2)
library(shinyjs)
library(shinycssloaders)
library(shinydashboardPlus)
library(shinythemes)
library(fresh)
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

DATA_PATH <- "~/OneDrive/rdirectory/Dashboard/" 

source(file = ( "~/OneDrive/rdirectory/Dashboard/Functions.R"), local = T, encoding = "UTF-8") 
source(file = ( "~/OneDrive/rdirectory/Dashboard/ValueBox.R"), local = T, encoding = "UTF-8")
source(file = ( "~/OneDrive/rdirectory/Dashboard/Notification.R"), local = T, encoding = "UTF-8")




mhlwSummaryPath <- paste0(DATA_PATH, "/MHLW/summary1.csv")
mhlwSummary <- fread(file = mhlwSummaryPath)
mhlwSummary$date <- as.Date(as.character(mhlwSummary$date), "%Y%m%d")
mhlwSummary <- mhlwSummary[order(Name_region, date)]
setnafill(mhlwSummary, type = "locf", cols = c("Positive", "Discharged", "Tested"))

lightRed <- "#F56954"
middleRed <- "#DD4B39"
darkRed <- "#B03C2D"
lightYellow <- "#F8BF76"
middleYellow <- "#F39C11"
darkYellow <- "#DB8B0A"
lightGreen <- "#00A65A"
middleGreen <- "#01A65A"
darkGreen <- "#088448"
superDarkGreen <- "#046938"
lightNavy <- "#5A6E82"
middelNavy <- "#001F3F"
darkNavy <- "#001934"
lightGrey <- "#F5F5F5"
lightBlue <- "#7BD6F5"
middleBlue <- "#00C0EF"
darkBlue <- "#00A7D0"

options(spinner.color = middleRed)

GLOBAL_VALUE <- reactiveValues(
  World = list(
    Summary = NULL,
    SummaryTable = NULL
  )
)


