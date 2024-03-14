# Leveraged Trading Profit/Loss Calculator

This R Shiny application provides a simple yet powerful interface for calculating the potential profit or loss from leveraged trading activities. It is designed to help traders quickly assess the outcomes of their trading strategies under different scenarios.

## Features

- Input fields for entering the initial investment amount, leverage ratio, buy price, and sell price.
- A toggle switch to choose between calculating profit/loss based on buy/sell price or percentage change.
- Input field for entering percentage change when the toggle is switched to percentage change calculation.
- A calculate button to perform the profit/loss calculation based on the provided inputs.
- Display of the calculation result, showing the profit or loss in dollars, with dynamic coloring (green for profit, red for loss).

## Getting Started

To run this application locally, you will need R and the Shiny library installed on your computer. Follow these steps:

1. Install R from [CRAN](https://cran.r-project.org/).
2. Open R and install Shiny by running: `install.packages("shiny")`
3. Optionally, if you want to use the toggle feature, install `shinyWidgets` by running: `install.packages("shinyWidgets")`
4. Clone this repository to your local machine.
5. Open the R project file in RStudio.
6. Run the application by clicking on the 'Run App' button in RStudio.

## Usage

1. Enter the amount of money you plan to invest in the "Initial Investment Amount (Dollars):" field.
2. Enter the leverage ratio you intend to use in the "Leverage Ratio:" field.
3. If calculating based on buy/sell price, input the buy price and sell price in their respective fields.
4. If calculating based on percentage change, switch the toggle and enter the percentage change in its field.
5. Click on the "Calculate" button to see the profit or loss result.

## License

This project is open-source and available under the [MIT License](LICENSE).

## Developed by

Erdinç Taşçı
