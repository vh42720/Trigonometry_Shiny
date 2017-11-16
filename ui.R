library(shiny)

shinyUI(fluidPage(
  titlePanel("Visualize Trig functions"),

  sidebarLayout(
    sidebarPanel(
            h3("Form"),
            h4("y = a * sin(b(x - c)) + d"),
            sliderInput("a","Amplitude",-2,2,value = 1,step = 1),
            sliderInput("b","Period Factor (b)",-5,5,value = 1,step=1),
            sliderInput("c","Phase Shift",round(-2*pi,2),round(2*pi,2),value=0,
                        step= round(pi,2)),
            sliderInput("d","Graph Shift",-2,2,value=0, step=1)
    ),
    mainPanel(
            tabsetPanel(
                    tabPanel("Sin(x)", plotOutput("plot1")), 
                    tabPanel("Cos(x)", plotOutput("plot2")), 
                    tabPanel("Tan(x)", plotOutput("plot3")),
                    tabPanel("Arcsin(x)", plotOutput("plot1_1")),
                    tabPanel("Arccos(x)", plotOutput("plot2_1")),
                    tabPanel("Arctan(x)", plotOutput("plot3_1"))
            )
    )
  )
))
