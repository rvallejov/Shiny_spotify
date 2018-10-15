library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
  dashboardHeader(title = "My Shiny Project"),
  dashboardSidebar(
    sidebarUserPanel("Raul Vallejo", image = "spotify-icon.png"),
    sidebarMenu(
      menuItem("Top tracks worldwide", tabName = "map", icon = icon("map")),
      menuItem("Song ranking over time", tabName = "timeseries", icon = icon("table")),
      menuItem("Music adoption and retention", tabName = "scatterplot", icon = icon("globe")),
      menuItem("Extreme observations", tabName = "scatter", icon = icon("volume-up")),
      menuItem("Outliers by country", tabName = "boxplots", icon = icon("balance-scale")),
      menuItem("Outlier stream generation", tabName = "barplots", icon = icon("calculator")),
      menuItem("Top 20% stream generation", tabName = "barplots2", icon = icon("arrow-up")),
      menuItem("Adoption vs top 20% streams", tabName = "clusterplot", icon = icon("spotify"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "map",
              fluidRow(infoBoxOutput("distinct.artists"),
                       infoBoxOutput("distinct.tracks"),
                       infoBoxOutput("total.streams"),
                       checkboxInput(inputId = "mapscale",
                                              label = "Log scale",
                                              value = FALSE)),
              fluidRow(htmlOutput("map1"))
      ),
      tabItem(tabName = "timeseries",
              # fluidRow(textOutput("line.title")),
              fluidRow(column(2,checkboxGroupInput(inputId = "Top.tracks.1",
                                                   label = "#1 Songs",
                                                   choices = top.songs,
                                                   selected = top.songs[5]),
                                checkboxGroupInput(inputId = "selected.regions",
                                                 label = "Regions",
                                                 choices = my.regions,
                                                 selected = my.regions[6])),
                       column(10,plotlyOutput("line1")))
      ),
      tabItem(tabName = "scatterplot",
              fluidRow(valueBoxOutput("distinct.top.ten"),
                       valueBoxOutput("global.reten"),
                       valueBoxOutput("global.adopt")),
              fluidRow(column(8, offset = 2,plotlyOutput("scatter2")))
      ),
      tabItem(tabName = "scatter",
              fluidRow(actionButton(inputId = "resample",
                                             label = "Plot sample",
                                             icon = icon("random"))),
              fluidRow(valueBoxOutput("streams.sample")),
              fluidRow(column(10,offset = 1,plotlyOutput("scatter1")))
      ),
      tabItem(tabName = "boxplots",
              fluidRow(radioButtons(inputId = "outliers", label = "Zoom plot",
                                    choices = c("Both","Without outliers","Only outliers"),
                                    selected = "Both",inline = TRUE)),
              fluidRow(column(8, offset = 2,plotOutput("boxplot1")))
      ),
      tabItem(tabName = "barplots",
              fluidRow(radioButtons(inputId = "outlier.groups", label = "Outlier criteria",
                                    choices = c("Graph outlier","Top 20%"),
                                    selected = "Graph outlier", inline = TRUE),
                       column(7,plotlyOutput("outlier.streams")),
                       column(5,plotlyOutput("polarity"))
              )
      ),
      tabItem(tabName = "barplots2",
              fluidRow(column(5,plotlyOutput("barplot")),
                       column(7,htmlOutput("map2"))
              )
      ),
      tabItem(tabName = "clusterplot",
              fluidRow(column(8, offset = 2, plotlyOutput("clusters")))
      )
    )
  )
))


# fluidPage(
#   
#   titlePanel(h1("Spotify Daily Top 200 streaming data wolrdwide")),
#   
#   sidebarLayout(
#     sidebarPanel(
#       checkboxGroupInput(inputId = "Top.tracks",
#                          label = "#1 Songs",
#                          choices = top.songs,
#                          selected = top.songs[5]),
#       checkboxGroupInput(inputId = "selected.regions",
#                          label = "Regions",
#                          choices = my.regions,
#                          selected = my.regions[1]),
#       # selectizeInput(inputId = "scatter.top.tracks",
#       #                label = "Top n tracks",
#       #                choices = c(1:20),
#       #                selected = 10),
#       sliderInput(inputId = "scatter.top.tracks", 
#                   label = "Top n tracks",
#                   min = 1, max = 20,
#                   value = 10)
#     ),
#     # mainPanel(plotOutput("line1"))
#     mainPanel(
#       fluidRow(
#         # column(6, plotOutput("line1")),
#         # column(6, plotOutput("scatter2"))
#         plotlyOutput("line1"),
#         plotlyOutput("scatter2")
#       )
#     )
#   )
  # sidebarLayout(
  #   sidebarPanel(
  #     img(src="AerialOcean.JPG",
  #       width="100%")
  #     ),
  # 
  #   mainPanel(
  #     tags$iframe(src="https://www.youtube.com/embed/5gIhrPGyu6U",
  #               width="640", height="360")
  #   )
  # )
  
# )


