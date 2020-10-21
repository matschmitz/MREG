library(shiny)

function(input, output) {
  
  getb0now <- reactive({input$b0})
  getb1now <- reactive({input$b1})
  getb2now <- reactive({input$b2})
  getb3now <- reactive({input$b3})
  
  output$mainPlot <- renderPlotly({
    b0 <- getb0now()
    b1 <- getb1now()
    b2 <- getb2now()
    b3 <- getb3now()
    
    # b0 <- 0
    # b1 <- 1
    # b2 <- 1
    # b3 <- 0
    
    GG <- expand.grid(
      x1 = seq(-1, 1, length.out = 20),
      x2 = seq(-1, 1, length.out = 20)
    ) %>% data.table()
    
    GG[, y := b0 + b1*x1 + b2*x2 + b3*x1*x2]
    
    z <- spread(GG, key = x2, value = y) %>% .[, 2:ncol(.)] %>% as.matrix %>% t
    
    
    # Plot model and data
    plot_ly() %>%
      
      add_surface(
        x = unique(GG$x1), y = unique(GG$x2), z = z,
        # colors    = c("dodgerblue4", 'dodgerblue3'),
        colors    = c("#006400", "#458B00"),
        showscale = FALSE,
        opacity   = .8,
        hoverinfo = "skip",
        contours = list(
          x = list(show           = FALSE,
                   highlight      = input$projectX2, # 
                   highlightcolor = "white",
                   highlightwidth = 5,
                   color          = "azure"),
          y = list(show           = FALSE,
                   highlight      = input$projectX1, # 
                   highlightcolor = "white",
                   highlightwidth = 5,
                   color          = "azure"),
          z = list(show           = FALSE,
                   highlight      = FALSE)
        )) %>%
      
      layout(
        title = paste0(withMathJax(sprintf(
          "$$Y = %s %s %s \\textit{X}_{1} %s %s\\textit{X}_{2} %s %s\\textit{X}_{1}\\textit{X}_{2}$$)",
          b0, ifelse(b1>=0, "+", ""), b1, ifelse(b2>=0, "+", ""), b2, ifelse(b3>=0, "+", ""), b3))),
        scene = list(
          xaxis = list(title      = "X1",
                       titlefont  = list(color = "rgb(153, 0, 0)"),
                       tickfont   = list(color = "grey"),
                       showspikes = FALSE),
          yaxis = list(title      = "X2",
                       titlefont  = list(color = "rgb(153, 0, 0)"),
                       tickfont   = list(color = "grey"),
                       showspikes = FALSE),
          zaxis = list(title      = "Y",
                       titlefont  = list(color = "rgb(153, 0, 0)"),
                       tickfont   = list(color = "grey"),
                       showspikes = FALSE),
          camera = list(eye = list(x = 2))),
        autosize = TRUE)
  })
  
  
  
}