library(shiny)

fluidPage(theme = "myCSS.css",
          headerPanel(title = "", windowTitle = "Régression multiple"),
          h2("Régression multiple"),
          
          sidebarLayout(
            sidebarPanel(width = 2,
                         sliderInput("b0", withMathJax("$$\\textit{b}_{0}$$"),
                                     min = -2, max = 2, value = 0, step = .2, animate = TRUE),
                         sliderInput("b1", withMathJax("$$\\textit{b}_{1}$$"),
                                     min = -2, max = 2, value = 0, step = .2, animate = TRUE),
                         sliderInput("b2", withMathJax("$$\\textit{b}_{2}$$"),
                                     min = -2, max = 2, value = 0, step = .2, animate = TRUE),
                         sliderInput("b3", withMathJax("$$\\textit{b}_{3}$$"),
                                     min = -2, max = 2, value = 0, step = .2, animate = TRUE),
                         checkboxInput('projectX1', 'Y~X1'),
                         checkboxInput('projectX2', 'Y~X2'),
            ),
            
            mainPanel(
              plotlyOutput('mainPlot', height = "700px")
            )
          )
          
)