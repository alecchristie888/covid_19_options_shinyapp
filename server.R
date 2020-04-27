library('tinytex')
library(data.table)
library(qpcR)
library(openxlsx)
source('chooser.R')

server <- function(input, output,session) {
    
  textsummary <- reactive({
      name1=input$risk1
      name2=input$risk2
      name3=input$risk3
      
      riska1 = input$rank_list_2a
      if(is.null(riska1)==TRUE){riska1=NA}
      riska2 = input$rank_list_4a
      if(is.null(riska2)==TRUE){riska2=NA}
      riska3 = input$rank_list_6a
      if(is.null(riska3)==TRUE){riska3=NA}
      
      riskb1 = input$rank_list_2b
      if(is.null(riskb1)==TRUE){riskb1=NA}
      riskb2 = input$rank_list_4b
      if(is.null(riskb2)==TRUE){riskb2=NA}
      riskb3 = input$rank_list_6b
      if(is.null(riskb3)==TRUE){riskb3=NA}
      
      riskc1 = input$rank_list_2c
      if(is.null(riskc1)==TRUE){riskc1=NA}
      riskc2 = input$rank_list_4c
      if(is.null(riskc2)==TRUE){riskc2=NA}
      riskc3 = input$rank_list_6c
      if(is.null(riskc3)==TRUE){riskc3=NA}
      
      col1=c(riska1,riska2,riska3)
      col2=c(riskb1,riskb2,riskb3)
      col3=c(riskc1,riskc2,riskc3)

      col1NA=0;col2NA=0;col3NA=0
      if(length(which(is.na(col1)==TRUE))!=length(col1)){col1NA=1}
      if(length(which(is.na(col2)==TRUE))!=length(col2)){col2NA=1}
      if(length(which(is.na(col3)==TRUE))!=length(col3)){col3NA=1}
      
      if(col1NA==1 | col2NA==1 | col3NA==1){
      mat1=matrix(c(col1, col2, col3),
             nrow=max(c(length(col1),length(col2),length(col3))),ncol=3, 
             dimnames=list(c(1:max(c(length(col1),length(col2),length(col3)))),c(name1,name2,name3)))
      
      mat1=mat1[,which(c(col1NA,col2NA,col3NA)==1)]
      if(is.matrix(mat1)==FALSE){
        mat1 = matrix(mat1,nrow=length(mat1),ncol=1,dimnames=list(c(1:length(mat1)),c(name1,name2,name3)[which(c(col1NA,col2NA,col3NA)==1)]))
      }
      return(mat1)
      }
      
      else{mat1=matrix(c("Please drag some options to the different risks to display your list."),
                       ncol=1,dimnames=list(c("1"),c("Options")))
      return(mat1)}


  })

  
  
  risk1func <- reactive({ input$risk1 })
  
  output$risk1.1 <- renderText({paste(risk1func())})
  output$risk2.1 <- renderText({paste(risk1func())})
  output$risk3.1 <- renderText({paste(risk1func())})
  
  
  risk2func <- reactive({ input$risk2 })
  
  output$risk1.2 <- renderText({paste(risk2func())})
  output$risk2.2 <- renderText({paste(risk2func())})
  output$risk3.2 <- renderText({paste(risk2func())})
  
  risk3func <- reactive({ input$risk3 })
  
  output$risk1.3 <- renderText({paste(risk3func())})
  output$risk2.3 <- renderText({paste(risk3func())})
  output$risk3.3 <- renderText({paste(risk3func())})
  
    
  output$textsumm <- renderTable({
    
    if(input$goButton>0){
      
      isolate(textsummary())
    }
    
  },rownames = TRUE,colnames = TRUE)
  
  
  output$downloadReport <- downloadHandler(
    filename = function() {
      paste(list('Custom_Covid_19_options',Sys.Date()), sep = '.', 'docx'
      )
    },
    
    content = function(file) {
      library(rmarkdown)
      out <- render('report.Rmd', word_document())
      file.rename(out, file)
    }
  )
  
 
    output$downloadxl <- downloadHandler(
      filename = function() {
        "Covid19_options_data.xlsx"
      },
      content = function(file) {
        my_workbook <- createWorkbook()
        
        addWorksheet(
          wb = my_workbook,
          sheetName = "Options"
        )

        
        writeData(
          my_workbook,
          sheet = 1,
          textsummary(),
          startRow = 1,
          startCol = 1
        )
        
      saveWorkbook(my_workbook, file)
      }
    )
  
  
}
