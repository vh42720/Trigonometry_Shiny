library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
        x = seq(-2*pi,2*pi,by = pi/128)
        
        modelSin <- reactive({
            y = input$a*sin(input$b*(x - input$c)) + input$d
        })
        
        modelArcsin <- reactive({
            y = input$a*asin(input$b*(x - input$c)) + input$d
        })
        
        modelCos <- reactive({
            y = input$a*cos(input$b*(x - input$c)) + input$d
        })
        
        modelArccos <- reactive({
            y = input$a*acos(input$b*(x - input$c)) + input$d
        })
        
        modelTan <- reactive({
            y = input$a*tan(input$b*(x - input$c)) + input$d
        })
        
        modelArctan <- reactive({
            y = input$a*atan(input$b*(x - input$c)) + input$d
        })
        
        output$plot1 <- renderPlot({
            df1 <- data.frame(x =x,y = modelSin()) 
            g1 <- ggplot(df1,aes(x,y)) + geom_point(col="firebrick2") +
                scale_x_continuous("x",breaks = c(-2*pi, -1.5*pi, -pi, -pi/2, 0, pi/2, pi, 1.5*pi, 2*pi), labels =  expression(-2*pi,-1.5*pi,-pi, -pi/2, 0, pi/2, pi,1.5*pi,2*pi)) + 
                scale_y_continuous("y",breaks = seq(-2,2,1), limits = c(-2,2)) +
                geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
                labs(title="Sin(x)")
            g1
        })
        
        output$plot1_1 <- renderPlot({
            df1_1 <- data.frame(x =x,y = modelArcsin())
            g1_1 <- ggplot(df1_1,aes(x,y)) + geom_point(col="firebrick2") +
                geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
                labs(title="Arcsin(x)")
            g1_1
        })
        
        output$plot2 <- renderPlot({
            df2 <- data.frame(x =x,y = modelCos())
            g2 <- ggplot(df2,aes(x,y)) + geom_point(col="cadetblue4") +
                scale_x_continuous("x",breaks = c(-2*pi, -1.5*pi, -pi, -pi/2, 0, pi/2, pi, 1.5*pi, 2*pi), labels =  expression(-2*pi,-1.5*pi,-pi, -pi/2, 0, pi/2, pi,1.5*pi,2*pi)) +
                scale_y_continuous("y",breaks = seq(-2,2,1),limits = c(-2,2)) +
                geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
                labs(title="Cos(x)")
            g2
        })
        
        output$plot2_1 <- renderPlot({
            df2_1 <- data.frame(x =x,y = modelArccos())
            g2_1 <- ggplot(df2_1,aes(x,y)) + geom_point(col="cadetblue4") +
                geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
                labs(title="Arccos(x)")
            g2_1
        })
        
        output$plot3 <- renderPlot({ 
            df3 <- data.frame(x =x,y = modelTan())
            g3 <- ggplot(df3,aes(x,y)) + geom_point(col="darkslategray") +
                scale_x_continuous("x",breaks = c(-2*pi,-1.5*pi,-pi, -pi/2, 0, pi/2, pi,1.5*pi,2*pi), labels =  expression(-2*pi,-1.5*pi,-pi, -pi/2, 0, pi/2, pi,1.5*pi,2*pi)) +
                scale_y_continuous("y",breaks = seq(-2,2,1),limits = c(-2,2)) +
                geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
                labs(title="Tan(x)")
            g3
        })
        
        output$plot3_1 <- renderPlot({
            df3_1 <- data.frame(x =x,y = modelArctan())
            g3_1 <- ggplot(df3_1,aes(x,y)) + geom_point(col="darkslategray") +
                geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
                labs(title="Arctan(x)")
            g3_1
        })
})

