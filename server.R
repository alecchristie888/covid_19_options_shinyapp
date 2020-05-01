library('tinytex')
library(data.table)
library(qpcR)
library(openxlsx)
#tinytex::install_tinytex()

optionsall=fread("masteroptionslist.csv")


server <- function(input, output,session) {

  textsummary1 <- reactive({
      col1 = c(input$rank_list_2a,input$rank_list_4a,input$rank_list_6a)
      if(length(col1)==0){col1=NA}
      col1titles=NA
      for(i in 1:length(col1)){
        if(is.na(col1[i])==FALSE){
        col1titles[i]=optionsall[actiondesc==col1[i],actiontitle]
        }
      }

      tab1 = data.frame(col1titles, col1)
      tab1[,1]=gsub("NA","Please add some options in the previous tabs",tab1[,1])
      tab1[,2]=gsub("NA","Please add some options in the previous tabs",tab1[,2])
      colnames(tab1)=c("Societal feature/Behaviour", "Option: Action")
      
      tab1[order(tab1[,1]),]
  })

 
  output$exampletab <- renderTable({
    tab2= data.frame(c("Increase physical spacing","","Expand space or time for shared activities","Spread out use of shared space","","",
                       "Hinder transmission through air"), 
                     c("Maintain gaps between workspaces: Seats 2m apart throughout canteen",
                       "Alternate seats on each side of narrow tables: Alternate seats on long tables in annex",
                       "Run activity for longer: Lunch period extended by 30 minutes.",
                       "Divide into groups and rotate use of shared space: Each section brings sandwiches to eat at their desk for an allocated day a week.",
                       "Provide live announcements on spacing: Tannoy announcements made when canteen is full.",
                       "Limit time inside shared space: Lunch limited to 20 minutes",
                       "Hold events outdoors where possible: After lunch coffee provided on new benches outside when weather suitable"))
    colnames(tab2)= c("Societal feature/Behaviour", "Option: Action")
    tab2
    })
  

  risk1func <- reactive({ input$risk1 })
  
  output$risk1.1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk2.1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3.1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})

  output$risktab1 <- renderText({ if(length(textsummary1())!=0){   if(input$goButton>0){paste(risk1func())}}})

  output$textsumm1 <- renderTable({
    
    if(length(textsummary1())!=0){ if(input$goButton>0){
      
      isolate(textsummary1())
    }}
    
  })
  

  
  
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
        
        if(is.null(textsummary1())==FALSE){
          addWorksheet(
          wb = my_workbook,
          sheetName = risk1func()
        )
          writeData(
          my_workbook,
          sheet = 1,
          textsummary1(),
          startRow = 1,
          startCol = 1
        )

        }
        
      saveWorkbook(my_workbook, file)
      }
    )
  
  
}
