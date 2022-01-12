
# Define server logic required to draw plot
function(input, output) {
  mpg_analysis <- reactive({
          mpg %>% 
                  filter(class %in% input$class_of_car)
  })
         
  output$mpgPlot <- renderPlot({
          mpg_analysis() %>% 
                  ggplot() + 
                  geom_point(mapping = aes(x = displ, y = hwy, color = class))
    
  })
  
}
