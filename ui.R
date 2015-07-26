library(shiny)

shinyUI(fluidPage(
        
        # Title
        titlePanel("mtcars Variables Relationship with 'mpg'"),
        
        # Sidebar
        sidebarLayout(
                sidebarPanel(
                        h2("Instructions"),
                        p("The application will show the box plot and the graph of the linear model
                        of the selected variable and the 'miles per gallon' variable (mpg)"),
                        br(),
                        p("If the outlaiers check is clicked it will show the plots including them."),
                        br(),
                        p("You can also take a look at the linear model info on the Data Tab."),
                        br(),
                        selectInput("variable", "Variable:",
                                    c("#cylinders" = "cyl",
                                      "Displacement" = "disp",
                                      "Gross horsepower" = "hp",
                                      "Rear axle ratio" = "drat",
                                      "Weight" = "wt",
                                      "1/4 mile time" = "qsec",
                                      "V/S" = "vs",
                                      "Transmission" = "am",
                                      "#gears" = "gear",
                                      "#carburetors" = "carb"
                                    )),
                        checkboxInput("outliers", "Show Outliers", FALSE)    
                ),
                
                # Show two plots and summary data
                mainPanel(
                        tabsetPanel(type = "tabs", 
                                    tabPanel('Graphics',
                                             h2('Boxplot'),
                                             plotOutput("my_boxplot"),
                                             h2('Linear Model'),
                                             plotOutput("my_regression")
                                    ),
                                    tabPanel('Data',
                                             h2('Linear Model Summary'),
                                             verbatimTextOutput("my_fit")
                                    )
                        )
                )  
        )
))