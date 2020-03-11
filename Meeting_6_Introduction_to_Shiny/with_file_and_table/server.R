
# Load data
mpg_data <- read.csv("mpg_data.csv")

# Define server logic required to draw a plot and table
function(input, output) {
        
        mpg_analysis <- reactive({
                mpg_data %>% 
                        filter(class %in% input$class_of_car)
        })
        
        output$mpgPlot <- renderPlot({
                mpg_analysis() %>% 
                        ggplot() + 
                        geom_point(mapping = aes(x = displ, y = hwy, color = class))
                
        })
        
        output$mpgTable <- renderTable({
                mpg_analysis() %>% 
                        group_by(class) %>% 
                        summarise(displ = mean(displ),
                                  hwy = mean(hwy)
                        )
        })
}
