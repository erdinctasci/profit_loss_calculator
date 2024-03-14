library(shiny)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("superhero"),
  titlePanel("Kaldıraçlı İşlem Kar/Zarar Hesaplama"),
  sidebarLayout(
    sidebarPanel(
      checkboxInput("hesaplamaTipi", "Yüzdesel Büyüme ile Hesapla", value = FALSE),
      numericInput("girisMiktari", "Pozisyona Giriş Miktarı (Dolar):", value = 10),
      numericInput("kaldirac", "Kaldıraç Oranı:", value = 10),
      conditionalPanel(
        condition = "input.hesaplamaTipi == false",
        numericInput("alisFiyati", "Alış Fiyatı:", value = 0),
        numericInput("satisFiyati", "Satış Fiyatı:", value = 0)
      ),
      conditionalPanel(
        condition = "input.hesaplamaTipi == true",
        numericInput("yuzdeDegisim", "Yüzdesel Büyüme (%):", value = 0)
      ),
      actionButton("hesapla", "Hesapla", style = "color: white; background-color: #337ab7; padding: 5px 10px; border-radius: 4px;")
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
    if (!input$hesaplamaTipi) {  
      toplamPozisyon <- input$girisMiktari * input$kaldirac
      karZarar <- (input$satisFiyati - input$alisFiyati) * toplamPozisyon / input$alisFiyati
    } else {  
      toplamPozisyon <- input$girisMiktari * input$kaldirac
      karZarar <- input$yuzdeDegisim / 100 * toplamPozisyon
    }
    
    output$sonuc <- renderUI({
      if (karZarar >= 0) {
        color <- "green"
      } else {
        color <- "red"
      }
      
      tags$div(
        tags$span(style = paste("color:", color, "; font-size: 16px;"), "Kar/Zarar: "),
        tags$div(style = paste("color:", color, "; font-size: 24px;"), paste("$", formatC(karZarar, format = "f", digits = 2)))
      )
    })
  })
}

shinyApp(ui = ui, server = server)
