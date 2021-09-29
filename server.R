library('tinytex')
library(data.table)
library(qpcR)
library(openxlsx)
#tinytex::install_tinytex()

optionsall=fread("masteroptionslist.csv")


server <- function(input, output,session) {
  
  
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
  
  
  output$risk1_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_2 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_3 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_4 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_5 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_6 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_7 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_8 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_9 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_10 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_11 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk1_12 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk2_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk2_2 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk2_3 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk2_4 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk2_5 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk2_6 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_2 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_3 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_4 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_5 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_6 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_7 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_8 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_9 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk3_10 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk4_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk4_2 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk4_3 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk4_4 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk4_5 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk4_6 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk5_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk6_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk6_2 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk7_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk7_2 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk7_3 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  output$risk8_1 <- renderText({paste("<b>",risk1func(),"</b>",sep='')})
  
  #output$debug1 <- renderText({grep("rank_list_1_",names(input))})
  
  textsummary1 <- reactive({
    col1 = c(input$rank_list_1_1, 
             input$rank_list_1_2, 
             input$rank_list_1_3, 
             input$rank_list_1_4, 
             input$rank_list_1_5, 
             input$rank_list_1_6, 
             input$rank_list_1_7, 
             input$rank_list_1_8, 
             input$rank_list_1_9, 
             input$rank_list_1_10, 
             input$rank_list_1_11,
             input$rank_list_1_12,
             input$rank_list_2_1, 
             input$rank_list_2_2, 
             input$rank_list_2_3, 
             input$rank_list_2_4, 
             input$rank_list_2_5, 
             input$rank_list_2_6, 
             input$rank_list_3_1, 
             input$rank_list_3_2, 
             input$rank_list_3_3, 
             input$rank_list_3_4, 
             input$rank_list_3_5, 
             input$rank_list_3_6, 
             input$rank_list_3_7, 
             input$rank_list_3_8, 
             input$rank_list_3_9, 
             input$rank_list_3_10, 
             input$rank_list_4_1, 
             input$rank_list_4_2, 
             input$rank_list_4_3, 
             input$rank_list_4_4, 
             input$rank_list_4_5, 
             input$rank_list_4_6, 
             input$rank_list_5_1, 
             input$rank_list_6_1, 
             input$rank_list_6_2, 
             input$rank_list_7_1, 
             input$rank_list_7_2, 
             input$rank_list_7_3, 
             input$rank_list_8_1 
    )
    
    if(length(col1)==0){col1=NA}
    col1titles=NA
    col1grouptitles=NA
    for(i in 1:length(col1)){
      if(is.na(col1[i])==FALSE){
        col1titles[i]=optionsall[actiondesc==col1[i],actiontitle]
        col1grouptitles[i]=optionsall[actiondesc==col1[i],actiongroup]
      }
    }
    
    tab1 = data.frame(col1grouptitles,col1titles, col1)
    tab1[,1]=gsub("NA","Please add some options in the previous tabs",tab1[,1])
    tab1[,2]=gsub("NA","Please add some options in the previous tabs",tab1[,2])
    tab1[,3]=gsub("NA","Please add some options in the previous tabs",tab1[,3])
    colnames(tab1)=c("Societal feature/Behaviour group","Societal feature/Behaviour category", "Option: Action")
    
    tab1[order(tab1[,1]),]
    
  })
  
  
  output$risktab1 <- renderText({ if(length(textsummary1())!=0){   if(input$goButton>0){paste(risk1func())}}})
  
  output$textsumm1 <- renderTable({
    
    if(length(textsummary1())!=0){ if(input$goButton>0){
      
      isolate(textsummary1())
    }}
    
  })
  
  output$downloadReport <- downloadHandler(
    filename = function() {
      paste(list('Covid_19_options_',input$risk1,"_",Sys.Date()), sep = '.', 'docx'
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
      paste0("Covid19_options_",input$risk1,".xlsx")
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
