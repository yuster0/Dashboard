#
shinyUI(
    dashboardPagePlus(
        skin = "purple",
        title = ("Novel Coronavirus Bulletin"),
        header = dashboardHeaderPlus(
            title = paste0("🦠 ", ("COVID 19 BULLETIN")), 
            titleWidth = 350,
            enable_rightsidebar = F
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
                tags$link(rel = "icon", href = "favicon.ico"),
                tags$meta(name = "twitter:card", content = "summary_large_image"),
                tags$meta(property = "og:title", content = "🦠 SARS-COV Bulletin"),
                tags$meta(property = "og:description", content = "This site summarises reports and  latest morbidity, mortality information of the new coronavirus in Montenegro"),
                tags$meta(property = "og:image", content = "https://repository-images.githubusercontent.com/237152814/77329f80-917c-11ea-958c-731c8433c504")
            ),
            tabItems(
                tabItem(
                    tabName = "Montenegro",
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
                    ),
                    tabItem(
                        tabName = "about",
                        fluidRow(
                            column(
                                width = 12,
                                boxPlus(
                                    width = 12,
                                    collapsible = F,
                                    fluidRow(
                                        column(
                                            width = 12,
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        ),
        footer = dashboardFooter(
            left_text = tagList(userPost(
                id = 1,
                src = "profile.png",
                author = tagList(
                    tags$small("Developed by"),
                    "Ronoh Y"
                ),
                collapsible = F,
                description = "Epidemiologist"
            )),
            right_text = tagList(
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

fluidRow(
    column(
        width = 5,
        style = "padding:0px;",
        widgetUserBox(
            title = ("Novel coronavirus"),
            subtitle = ("Coronavirus disease 2019 (COVID-19)"),
            width = 12,
            type = NULL,
            src = "ncov.jpeg",
            color = "purple",
            collapsible = F,
            background = T,
            footer_padding = F,
            backgroundUrl = "ncov_back.jpg")
    )
)
