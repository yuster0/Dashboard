
# reading json data to r --------------------------------------------------

library(rjson)
library(jsonlite)
library(data.table)
library(echarts4r)
library(echarts4r.maps)
library(tidyverse)
library(lubridate)
library(plyr)

worldtrends <- fromJSON("https://cov19.cc/trend.json")


#globaltrends <- data.frame(matrix(unlist(worldtrends), nrow=length(worldtrends)))   # byrow=T))

#worldtrends<- ldply (worldtrends, data.frame)

worldDf<- ldply (worldtrends, data.frame)

worldDf %>%
  pivot_longer(
    cols = starts_with("x"),
    names_to = "date",
    names_prefix = "x2020",
    values_to = "number",
    values_drop_na = FALSE
  )-> worldDf

world_trends<- worldDf %>% select(.id, date, number)# %>% rename(countries=.id)

world_trends<- world_trends%>% separate(date, 
                                        c("Year","Month","day","status"))

names(world_trends)[1] <- "Countries"
world_trends$Year <- 2020

world_trends %>%
  mutate(date = make_date(Year, Month, day)) %>% 
  relocate(date, .before=Countries) %>% 
  select(Countries,date,status,number)->worldsummaries
worldsummaries<- worldsummaries %>% relocate(Countries, .after = date)
worldsummaries %>% pivot_wider(names_from = status, values_from = number, values_fill = 0)->worldsummaries
worldsummaries$Countries<- stringr::str_to_title(worldsummaries$Countries)

worldSum <- worldsummaries %>%
  mutate(Countries = recode_factor(Countries,
                                   "congo" = "Congo",
                                   "Drcongo" = "Dem. Rep. Congo",
                                   "Ivory Coast" = "Côte d'Ivoire",
                                   "Western Sahara" = "W. Sahara",
                                   "Centralafricanrepublic" = "Central African Rep.",
                                   "Southsudan" = "S. Sudan",
                                   "unitedstates" = "United States",
                                   "Antiguaandbarbuda" = "Antigua & Barbuda",
                                   "Bosniaandherzegovina" ="Bosnia & Herzegovina",
                                   "Unitedkingdombritishvirginislands"= "British Virgin Islands",
                                   "Burkinafaso" ="Burkina Faso",
                                   "Capeverde" = "Cape Verde",
                                   "Costarica" = "Costa Rica",
                                   "Netherlandscuracao"= "Curaçao",
                                   "Dominicanrepublic" = "Dominican Republic",
                                   "Elsalvador" = "El Salvador",
                                   "Equatorialguinea" = "Equatorial Guinea",
                                   "Unitedkingdomfalklandislands" = "Falkland Islands",
                                   "Unitedkingdomchannelislands" = "Channel Islands",
                                   "Denmarkfaroeislands" = "Faroe Islands",
                                   "Francefrenchguiana"= "French Guiana",
                                   "Francefrenchpolynesia" = "French Polynesia",
                                   "Unitedkingdomgibraltar" = "Gibraltar",
                                   "Denmarkgreenland" =  "Greenland",
                                   "Franceguadeloupe" =  "Guadeloupe",
                                   "Guineabissau" =  "Guinea-Bissau",
                                   "Hongkong" = "Hong Kong SAR China",
                                   "Unitedkingdomisleofman" = "Isle of Man",
                                   "Unitedkingdomcaymanislands" = "Cayman Islands",
                                   "Ivorycoast" = "Côte d’Ivoire",
                                   "Macao" = "Macao SAR China",
                                   "Francemayotte" = "Mayotte",
                                   "Myanmar" = "Myanmar (Burma)",
                                   "Newzealand" = "New Zealand",
                                   "Francenewcaledonia" = "New Caledonia",
                                   "Northmacedonia" = "North Macedonia",
                                   "Palestine" = "Palestinian Territories",
                                   "Papuanewguinea" = "Papua New Guinea",
                                   "Francereunion" = "Réunion",
                                   "Saintkittsandnevis" = "St. Kitts & Nevis",
                                   "Saintlucia" = "St. Lucia",
                                   "Saintvincentandthegrenadines"= "St. Vincent & Grenadines",
                                   "Sanmarino" = "San Marino",
                                   "Saudiarabia" = "Saudi Arabia",
                                   "Sierraleone"= "Sierra Leone",
                                   "Sotomandprncipe" = "São Tomé & Príncipe",
                                   "Southafrica" = "South Africa",
                                   "Southkorea" = "South Korea",
                                   "Southsudan" = "South Sudan",
                                   "Srilanka" = "Sri Lanka",
                                   "Francesaintmartin" = "Saint Martin (French part)",
                                   "Francesaintpierreandmiquelon" = "St. Pierre & Miquelon",
                                   "Netherlandssintmaarten" = "Sint Maarten",
                                   "Francesaintbarthelemy" = "St. Barthélemy",
                                   "Thebahamas" = "Bahamas",
                                   "Thegambia" = "Gambia",
                                   "Timorleste" = "Timor-Leste",
                                   "Trinidadandtobago" = "Trinidad & Tobago",
                                   "Unitedarabemirates" = "United Arab Emirates",
                                   "Unitedkingdom" =  "United Kingdom",
                                   "Unitedkingdomturksandcaicosislands" = "Turks & Caicos Islands",
                                   "Unitedstates" = "United States",
                                   "Vaticancity" = "Vatican City",
                                   "Unitedstatesvirginislands" = "U.S. Virgin Islands",
                                   "Westernsahara" = "W. Sahara"
                                   ))


globalsummary <- worldsummaries %>% filter(Countries == "world")

# Daily global summaries with population ----------------------------------

worldCorona <- fromJSON("https://cov19.cc/report.json") # one day report
world <- as.data.table(worldCorona$regions$world$list)
rm(worldCorona)
world$date<- as.Date(parse_date_time(world$last_updated, c('mdy', 'ymd_HMS')))
world %>% relocate(date, before="country") %>% select(-last_updated) -> world
world <- as.data.table(world)
test_population <- world %>% select(country, population, tests)
# world <- world[, `Number of cases/100k Population` := round(confirmed / (population/ 100000), 0)]

test_population <- test_population %>%
  mutate(Countries = recode_factor(country,
                                 "Antigua and Barbuda" = "Antigua & Barbuda",
                                 "Congo" = "Congo",
                                 "DR Congo" = "Dem. Rep. Congo",
                                 "Hong Kong" = "Hong Kong SAR China",
                                 "Ivory Coast" = "Côte d'Ivoire",
                                 "Western Sahara" = "W. Sahara",
                                 "Central African Republic" = "Central African Rep.",
                                 "South Sudan" = "S. Sudan",
                                 "The Bahamas" = "Bahamas",
                                 "The Gambia" ="Gambia",
                                 "Bosnia and Herzegovina" = "Bosnia & Herzegovina",
                                 "Saint Kitts and Nevis" = "St. Kitts & Nevis",
                                 "Saint Lucia" = "St. Lucia",
                                 "Saint Vincent and the Grenadines" = "St. Vincent & Grenadines",
                                 "São Tomé and Príncipe" = "São Tomé & Príncipe",
                                 "Trinidad and Tobago" = "Trinidad & Tobago",
                                "Palestine" = "Palestinian Territories"
                                 ))
test_population <- test_population %>% select(Countries, population, tests) 
total <- merge(worldSum,test_population,by="Countries", all.x=TRUE)
total <- as.data.table(total)
total <- total[, `Number of cases/100k Population` := round(confirmed / (population/ 100000), 0)]
total <- total[, `Number of tests/100k Population` := round(tests / (population/ 100000), 0)]
total <- total[, `Number of Cases/Test` := round(confirmed / (tests/ 100), 0)]



# mutate the country names to align with echarts country names ------------


world <- world %>%
  mutate(country = recode_factor(country,
                                 "Congo" = "Congo",
                                 "DR Congo" = "Dem. Rep. Congo",
                                 "Ivory Coast" = "Côte d'Ivoire",
                                 "Western Sahara" = "W. Sahara",
                                 "Central African Republic" = "Central African Rep.",
                                 "South Sudan" = "S. Sudan"))

# For legend formating ----------------------------------------------------

worldCase = list(
  list(min = 500),
  list(min = 200, max = 500),
  list(min = 100, max = 200),
  list(min = 50, max = 100),
  list(min = 20, max = 50),
  list(min = 10, max = 20),
  list(min = 5, max = 10),
  list(min = 0, max = 5),
  list(min = 0, max = 1),
  list(value = 0)
)
columnNameForMap <- "casesPer100k"

splitList <- list(
                      list(min = 500),
                      list(min = 200, max = 500),
                      list(min = 100, max = 200),
                      list(min = 50, max = 100),
                      list(min = 20, max = 50),
                      list(min = 10, max = 20),
                      list(min = 5, max = 10),
                      list(min = 0, max = 5),
                      list(min = 0, max = 1),
                      list(value = 0)
                    )

colorScale <- c("#ffffff", "#cd4652")
legendFormatter <- worldCase  

timeSeriesTitle <- lapply(unique(total$date), function(i) {
  return(
    list(
      text = "Number of Cases/100K Population", #worldCase
      subtext = i
    )
  )
})

# Plot the map ------------------------------------------------------------

total %>% 
  group_by(date) %>%  #order_by(date)) %>% 
  e_charts(Countries, timeline = TRUE) %>% 
  e_map(`Number of cases/100k Population`) %>% 
  e_visual_map(`Number of cases/100k Population`,
               type = "piecewise",
               bottom = "20%",
               left = "0%",
               inRange = list(color = colorScale),
               splitList = splitList,
               formatter = legendFormatter
  ) %>%
  e_title(text = "Number of Cases/100K Population") %>%
  e_tooltip() %>%  
  e_timeline_opts(
    playInterval = 200,
    left = "0%",
    right = "0%",
    currentIndex = length(unique(total$date)) - 1
  ) %>%
  e_timeline_serie(
    title = timeSeriesTitle
  )


world %>% 
  e_charts(country) %>% 
  e_map(`Number of cases/100k Population`) %>% 
e_visual_map(`Number of cases/100k Population`,
        type = "piecewise",
         bottom = "20%",
       left = "0%",
  inRange = list(color = colorScale),
  splitList = splitList,
  formatter = legendFormatter
) %>%
  e_title(text = "Number of Cases/100K Population") %>%
  e_tooltip()


# Daily COVID 19 Trends ---------------------------------------------------

worldtrends <- fromJSON("https://cov19.cc/trend.json")


#globaltrends <- data.frame(matrix(unlist(worldtrends), nrow=length(worldtrends)))   # byrow=T))

worldtrends<- ldply (worldtrends, data.frame)

worldDf<- ldply (worldtrends, data.frame)

worldDf %>%
  pivot_longer(
    cols = starts_with("x"),
    names_to = "date",
    names_prefix = "x2020",
    values_to = "number",
    values_drop_na = FALSE
  )-> worldDf

world_trends<- worldDf %>% select(.id, date, number)# %>% rename(countries=.id)

world_trends<- world_trends%>% separate(date, 
                           c("Year","Month","day","status"))

names(world_trends)[1] <- "Countries"
world_trends$Year <- 2020

world_trends %>%
  mutate(date = make_date(Year, Month, day)) %>% 
  relocate(date, .after=Countries) %>% 
  select(Countries,date,status,number)->worldsummaries
worldsummaries %>% pivot_wider(names_from = status, values_from = number, values_fill = 0)->worldsummaries

globalsummary <- worldsummaries %>% filter(Countries == "world")

# Transform the countries name --------------------------------------------


geo_names<- c("Afghanistan","Albania", "Algeria", "Andorra", "Angola","Antigua & Barbuda","Anguilla","Argentina","Aruba",
              "Armenia","Australia","Austria","Azerbaijan","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize",
              "Benin","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil",
              "British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Republic","Chad","Chile",
              "China","Colombia","Comoros","Congo - Brazzaville","Costa Rica","Croatia","Cuba","Curaçao","Cyprus","Czechia","Denmark","Djibouti","Dominica",
              "Dominican Republic","Congo - Kinshasa","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Eswatini","Ethiopia","Falkland Islands",
              "Channel Islands","Faroe Islands","Fiji","Finland","France","French Guiana","French Polynesia","Gabon","Georgia","Germany","Ghana","Gibraltar","Greece",
              "Grenada","Greenland","Guatemala","Guadeloupe","Guam","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hong Kong SAR China","Hungary","Iceland","India",
              "Indonesia","Iran","Iraq","Ireland","Isle of Man","Cayman Islands","Israel","Italy","Côte d’Ivoire","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kosovo",
              "Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macao SAR China","Madagascar","Malawi",
              "Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mayotte","Mexico","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique",
              "Myanmar (Burma)","Namibia","Nepal","Netherlands","New Zealand","New Caledonia","Nicaragua","Niger","Nigeria","North Macedonia","Norway","Oman","Pakistan",
              "Palestinian Territories","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Réunion","Romania","Russia","Rwanda",
              "St. Kitts & Nevis","St. Lucia","St. Vincent & Grenadines","San Marino","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore",
              "Slovakia","Slovenia","Somalia","São Tomé & Príncipe","South Africa","South Korea","South Sudan","Spain","Sri Lanka","Saint Martin (French part)",
              "St. Pierre & Miquelon","Sint Maarten","St. Barthélemy","Sudan","Suriname","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand",
              "Bahamas","Gambia","Timor-Leste","Togo","Trinidad & Tobago","Tunisia","Turkey","Uganda","Ukraine","United Arab Emirates","United Kingdom",
              "Turks & Caicos Islands","United States","Uruguay","Uzbekistan","Vatican City","U.S. Virgin Islands","Venezuela","Vietnam","Western Sahara","Yemen",
              "Zambia","Zimbabwe")



df_names <- c("afghanistan",
              "albania",
              "algeria",
              "andorra",
              "angola",
              "antiguaandbarbuda",
              "unitedkingdomanguilla",
              "argentina",
              "netherlandsaruba",
              "armenia",
              "australia",
              "austria",
              "azerbaijan",
              "bahrain",
              "bangladesh",
              "barbados",
              "belarus",
              "belgium",
              "belize",
              "benin",
              "bhutan",
              "bolivia",
              "bosniaandherzegovina",
              "botswana",
              "brazil",
              "unitedkingdombritishvirginislands",
              "brunei",
              "bulgaria",
              "burkinafaso",
              "burundi",
              "cambodia",
              "cameroon",
              "canada",
              "capeverde",
              "centralafricanrepublic",
              "chad",
              "chile",
              "china",
              "colombia",
              "comoros",
              "congo",
              "costarica",
              "croatia",
              "cuba",
              "netherlandscuracao",
              "cyprus",
              "czechia",
              "denmark",
              "djibouti",
              "dominica",
              "dominicanrepublic",
              "drcongo",
              "ecuador",
              "egypt",
              "elsalvador",
              "equatorialguinea",
              "eritrea",
              "estonia",
              "eswatini",
              "ethiopia",
              "unitedkingdomfalklandislands",
              "unitedkingdomchannelislands",
              "denmarkfaroeislands",
              "fiji",
              "finland",
              "france",
              "francefrenchguiana",
              "francefrenchpolynesia",
              "gabon",
              "georgia",
              "germany",
              "ghana",
              "unitedkingdomgibraltar",
              "greece",
              "grenada",
              "denmarkgreenland",
              "guatemala",
              "franceguadeloupe",
              "unitedstatesguam",
              "guinea",
              "guineabissau",
              "guyana",
              "haiti",
              "honduras",
              "hongkong",
              "hungary",
              "iceland",
              "india",
              "indonesia",
              "iran",
              "iraq",
              "ireland",
              "unitedkingdomisleofman",
              "unitedkingdomcaymanislands",
              "israel",
              "italy",
              "ivorycoast",
              "jamaica",
              "japan",
              "jordan",
              "kazakhstan",
              "kenya",
              "kosovo",
              "kuwait",
              "kyrgyzstan",
              "laos",
              "latvia",
              "lebanon",
              "lesotho",
              "liberia",
              "libya",
              "liechtenstein",
              "lithuania",
              "luxembourg",
              "macao",
              "madagascar",
              "malawi",
              "malaysia",
              "maldives",
              "mali",
              "malta",
              "mauritania",
              "mauritius",
              "francemayotte",
              "mexico",
              "moldova",
              "monaco",
              "mongolia",
              "montenegro",
              "morocco",
              "mozambique",
              "myanmar",
              "namibia",
              "nepal",
              "netherlands",
              "newzealand",
              "francenewcaledonia",
              "nicaragua",
              "niger",
              "nigeria",
              "northmacedonia",
              "norway",
              "oman",
              "pakistan",
              "palestine",
              "panama",
              "papuanewguinea",
              "paraguay",
              "peru",
              "philippines",
              "poland",
              "portugal",
              "qatar",
              "francereunion",
              "romania",
              "russia",
              "rwanda",
              "saintkittsandnevis",
              "saintlucia",
              "saintvincentandthegrenadines",
              "sanmarino",
              "saudiarabia",
              "senegal",
              "serbia",
              "seychelles",
              "sierraleone",
              "singapore",
              "slovakia",
              "slovenia",
              "somalia",
              "sotomandprncipe",
              "southafrica",
              "southkorea",
              "southsudan",
              "spain",
              "srilanka",
              "francesaintmartin",
              "francesaintpierreandmiquelon",
              "netherlandssintmaarten",
              "francesaintbarthelemy",
              "sudan",
              "suriname",
              "sweden",
              "switzerland",
              "syria",
              "taiwan",
              "tajikistan",
              "tanzania",
              "thailand",
              "thebahamas",
              "thegambia",
              "timorleste",
              "togo",
              "trinidadandtobago",
              "tunisia",
              "turkey",
              "uganda",
              "ukraine",
              "unitedarabemirates",
              "unitedkingdom",
              "unitedkingdomturksandcaicosislands",
              "unitedstates",
              "uruguay",
              "uzbekistan",
              "vaticancity",
              "unitedstatesvirginislands",
              "venezuela",
              "vietnam",
              "westernsahara",
              "yemen",
              "zambia",
              "zimbabwe")
