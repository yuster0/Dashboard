source(
    file = ("~/OneDrive/rdirectory/Dashboard/global.R"), 
    local = TRUE, 
    encoding = "UTF-8"
)

shinyUI(
   dashboardPage(
        #theme = "bootstrap.css", #it gives error  shinytheme("cerulean"),
       #theme = shinytheme("united"),
        skin = "red",
        title = ("Novel Coronavirus Bulletin"),
        header = dashboardHeader (title = " 🦠  COVID 19 BULLETIN BOARD",
        titleWidth = 350
        ),
        # TODO Add language setting
        sidebar = dashboardSidebar(sidebarMenu(
            id = "sideBarTab",
            menuItem(
                ("Epidemic Overview"),
                tabName = "Montenegro",
                icon = icon("tachometer-alt"),
                badgeLabel = ("Live"),
                badgeColor = "red"
            ),
            menuItem(
                ("Transmission route"),
                tabName = "route",
                icon = icon("project-diagram"),
                badgeLabel = ("In Dev"),
                badgeColor = "black"
            ),
            menuItem(
                ("Region status"),
                tabName = "regStatus",
                icon = icon("city"),
                menuSubItem(
                    text = ("Central region"),
                    tabName = "Централни регион"#,
                    # icon = icon("fish")
                ),
                menuSubItem(
                    text = ("Coastal region"),
                    tabName = "Приморски регион" # ,
                    # icon = icon('apple-alt')
                ),
                menuSubItem(
                    text = ("Northern region"),
                    tabName = "Сјеверни регион" # ,
                )
            ),
            menuItem(
                ("Epidemic map"),
                tabName = "caseMap",
                icon = icon("map-marked-alt"),
                badgeLabel = ("Interactive"),
                badgeColor = "black"
            ),
            menuItem(
                ("Sitrep"),
                tabName = "academic",
                icon = icon("eye"),
                badgeLabel = "V 0.1",
                badgeColor = "black"
            ),
            menuItem(
                # Google
                ("NPHI- Effect"),
                tabName = "google",
                icon = icon("google"),
                badgeLabel = "V 0.1",
                badgeColor = "black"
            ),
            menuItem(
                # Google
                "World",
                tabName = "world",
                icon = icon("globe"),
                badgeLabel = "V 0.1",
                badgeColor = "black"
            ),
            menuItem(
                ("About the site"),
                tabName = "about",
                icon = icon("readme"),
                badgeLabel = ("In dev"),
                badgeColor = "black"
            )
            )),
        dashboardBody(
            tags$head(
               tags$link(rel = "icon", href = "montenegro.ico"),
                tags$meta(name = "twitter:card", content = "summary_large_image"),
                tags$meta(property = "og:title", content = "🦠 SARS-COV Bulletin"),
                tags$meta(property = "og:description", content = "This site summarises latest morbidity, mortality information of the new coronavirus in Montenegro"),
                tags$meta(property = "og:image", content = "https://repository-images.githubusercontent.com/237152814/77329f80-917c-11ea-958c-731c8433c504")
            ),
            tabItems(
                tabItem(
                    tabName = "Montenegro",
                    source(file=("~/OneDrive/rdirectory/Dashboard//main.ui.R"),
                        local = T,
                        encoding = "UTF-8"
                    )$value
                ),
                tabItem(
                    tabName = "route",
                ),
                tabItem(
                    tabName = "Central",
                ),
                tabItem(
                    tabName = "Coastal",
                ),
                tabItem(
                    tabName = "Northern",
                ),
                tabItem(
                    tabName = "Podgorica",
                ),
                    tabItem(
                        tabName = "caseMap",
                    ),
                    tabItem(
                        tabName = "academic",
                    ),
                    tabItem(
                        tabName = "google",
                    ),
                    tabItem(
                        tabName = "world",
                        source(
                            file = ("~/OneDrive/rdirectory/Dashboard/World/World.ui.R"), 
                            local = T,
                            encoding = "UTF-8"
                        )$value
                    ),
                    tabItem(
                        tabName = "about",
                        fluidRow(
                            column(
                                width = 12,
                                box(
                                    width = 12,
                                    collapsible = F,
                                    fluidRow(
                                        column(
                                            width = 12
                                        )
                                    )
                                )
                            )
                        )
                    )    
                )
            ),
           footer = dashboardFooter(
            left = tagList(userPost(
                id = 1,
                image = "profile.jpg",
                author = tagList(
                    tags$small("Developed by"),
                    "Ronoh Y"
                ),
                collapsible = F,
                description = "Epidemiologist"
            )),
            right = tagList(
                tags$div(
                    style = "font-size:22px;letter-spacing: .3rem;",
                    tags$a(href = "https://github.com/", icon("github")),
                    tags$a(href = "https://twitter.com/", icon("twitter")),
                    tags$a(href = "https://www.linkedin.com/", icon("linkedin"))
               )
           )
       ) 
    )
)
   






