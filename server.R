#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(
  function(input, output){
    output$pitiPayment <- renderText({piti(input$Tax, input$Insurance, input$principal, input$annualInterest, input$loanTerm, input$downPayment) })
    output$Affordable <- renderText({Affordability(input$Tax, input$Insurance, input$principal, input$annualInterest, input$loanTerm, input$downPayment, input$income)})
  
  }
)

monPayment <- function(principal, annualInterest, loanTerm, downPayment) { 
  monthlyInterest <- annualInterest/(12 * 100)
  termMonths <- 12 * loanTerm
  monthlyPayment <- round((principal-downPayment)*monthlyInterest/(1-(1+monthlyInterest)^(-termMonths)),2)
  return(monthlyPayment)
}

piti <- function(Tax, Insurance, principal, annualInterest, loanTerm, downPayment) {
  monthlyPayment <- monPayment(principal, annualInterest, loanTerm, downPayment)
  TaxPayment <- (principal*(Tax/100))/12
  InsurancePayment <- ((Insurance/100)*principal)/12
  monthly <- round(monthlyPayment + TaxPayment + InsurancePayment,2)
  return (monthly)
}

Affordability <- function(Tax, Insurance, principal, annualInterest, loanTerm, downPayment, income) {
  pitiPayment <- piti(Tax, Insurance, principal, annualInterest, loanTerm, downPayment)
  pctofIncome <- pitiPayment/income
  if (pctofIncome > 0.3){
    Affordable <- "This loan is not Affordable."
  } else {
    Affordable <- "This loan is Affordable."
  }
  return(Affordable)
}
