#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Mortgage Calculator"),
  sidebarPanel(
    h4('Property'),
    textInput('text', 'Address', value='123 Elm'),
    numericInput('principal', 'Price ($)', 250000),
    numericInput('downPayment', 'Down Payment ($)', 50000),
    h5('Mortgage Info'),
    numericInput('annualInterest', 'Mortgage Rate (excl % sign)', 6),
    numericInput('Tax', 'Mil rate ($ per $100 valuation)', 3.5),
    numericInput('loanTerm', 'Loan Term in years', 30),
    h5('Mortgage Info'),
    numericInput('Insurance', 'Insurance cost, as a % of value (excl % sign)', 2)
#    h5('Income'),
#    numericInput('Income', 'Monthly Income', 6000)
  ),
  mainPanel(
    h4('Total Housing Cost Per Month'),
    textOutput("pitiPayment"),
#    h4('Affordable?'),
#    print("Affordable"),
   
    br(),
    h4('Instructions'),
    helpText("This application calculates the 'PITI payment' for a given property and mortgage, the total monthly cost including mortgage, Insurance and Taxes."),
    code("monPayment"),
    helpText("Enter the property's cost, the amount of down payment, the Tax rate and the Insurance cost to calculate the monthly cost of ownership.")
#    code("Affordability"),
#    helpText("Enter your monthly income to determine if the mortgage is Affordable;  Affordability is defined as 30% of monthly income.")
  )
))