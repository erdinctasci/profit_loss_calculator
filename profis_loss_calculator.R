library(shiny)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("superhero"),
  titlePanel("Kaldıraçlı İşlem Kar/Zarar Hesaplama"),
  sidebarLayout(
    sidebarPanel(
      numericInput("girisMiktari", "Pozisyona Giriş Miktarı (Dolar):", value = 10),
      numericInput("kaldirac", "Kaldıraç Oranı:", value = 10),
      numericInput("alisFiyati", "Alış Fiyatı:", value = 0),
      numericInput("satisFiyati", "Satış Fiyatı:", value = 0),
      actionButton("hesapla", "Hesapla", 
                   style = "border: 1px solid white; color: white; background-color: #337ab7; padding: 5px 10px; border-radius: 4px; 
                      hover: background-color: #286090;")
    ),
    mainPanel(
      uiOutput("sonuc")
    )
  ),
  tags$footer(
    tags$div(style = "text-align: center;", "Developed by Erdinç Taşçı"),
    style = "position: fixed; bottom: 0; width: 100%; font-size: 10px; background-color: transparent; color: #fff;"
  )
)

server <- function(input, output) {
  observeEvent(input$hesapla, {
    toplamPozisyon <- input$girisMiktari * input$kaldirac
    karZarar <- (input$satisFiyati - input$alisFiyati) * (toplamPozisyon / input$alisFiyati)
    
    
    output$sonuc <- renderUI({
      if (karZarar >= 0) {
        color <- "green"
      } else {
        color <- "red"
      }
      
      tags$div(
        tags$span(style = paste("color:", color, "; font-size: 16px;"), "Kar/Zarar:"),
        tags$div(style = paste("color:", color, "; font-size: 24px;"), paste("$", formatC(karZarar, format = "f", digits = 2)))
      )
    })
  })
}


shinyApp(ui = ui, server = server)
