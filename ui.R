library("shinythemes")
library(shiny)
require(shinyjs)
require('shinydashboard')
library(data.table)
library(sortable)

source('chooser.R')

optionsall=fread("masteroptionslist.csv")


css <- 
  "
.container {
margin: 0;
padding: 15px;
}
#expr-container .selectize-input {
font-size: 13px;
line-height: 24px;
}
#expr-container .selectize-dropdown {
font-size: 13px;
line-height: 24px;
}
#expr-container .selectize-dropdown-content {
max-height: 1000px;
padding: 0;
}
#expr-container .selectize-dropdown-content .option {
border-bottom: 1px dotted #ccc;
}
"


dashboardPage(
  title='Covid-19 tool',skin="black",
  dashboardHeader(
    title = tags$a(href='http://doi.org/10.17605/OSF.IO/CA5RH',
                   tags$img(src="image2.jpg", width = 175, height = 50))),
  dashboardSidebar(
    h2("Identifying implementation options for your Covid-19 plan"),
                     p("This app must be used alongside consideration of guidance. Our intent is to encourage the consideration of the wide range of options, for example, maintaining physical distancing is key to any plan but do you ensure this happens? This guides the user through numerous options so they can identify those they wish to explore further.")
                     ),
  dashboardBody(
    useShinyjs(),
    tabsetPanel(
      id = "navbar",
      tabPanel(title="How to use",id="taba",value='taba_val',
               br(),
               br(),
               p("The aim of this app is help users work though a set of options to create a set of action for further consideration."),
               br(),
               p("The final output is a list of possible options that you can convert into possible actions like this:"),
               br(),
               strong("Risk: IT room"),
               p(".	Ensure IT staff can access most files from work. However many of the tasks need access to the computers in 1.23."), 
               p(".	Divide into two teams to reduce risk of the entire IT department having to self isolate. Jane to decide on the teams."), 
               p(".	Each team works one week in the office and one week from home"),
               p(".	Use every second desk to increase spacing."),
               p(".	We keep talking about extending 1.23, which is cramped, into 1.24. This should now be our top building priority."),
               br(),
               p("If you might find that useful it is achieved by:"),
               br(),
               p("1. 	Reading relevant guidance to decide on strategy"),
               p("2. 	Identify the key risks (up to three at a time)"),
               p("3. 	Extract possible options for each risk"),
               p("4. 	Download the results"),
               p("5. 	Decide how you might convert the general options into actions that apply to your circumstances"),
               p("6. 	Consider the practicality, likely effectiveness and negative impacts of the actions. Use this list of possible actions to include in your planning alongside the guidance."),
               p("We only discuss means of implementing - please go elsewhere for up to date evidence and guidance. There are many areas of uncertainty especially the importance of different transmission routes and also how long the virus is active on different material. Look for up-to-date guidance before implementing measures such as the use of masks, different cleaning methods, when gloves are beneficial and when they may be harmful.")
               ),    
      tabPanel(title="What this tool does and doesn't do",id="tabb",value='tabb_val',
               br(),
               br(),p("This tool does not replace evidence and guidance and must be used alongside the evidence and  guidance on general principles e.g. from John Hopkins University and especially used alongside guidance for specific sectors, such as those listed here. This tool just considers means of adjusting physical distancing, reducing spread through contamination and improving the uptake of personal hygiene and cleaning."),
               br(),
               p("There are many areas of uncertainty.  Go elsewhere for the up to date evidence and guidance. Examples include the use of masks, cleaning methods, when gloves are beneficial and when they may be harmful, the importance of different transmission routes, the importance of how long the virus is active on different material etc."),
               br(),
               p("We stress that we are not contributing to the discussion as to when the transitions from lockdown should occur, just contributing to the debate on the means of leaving lockdown when that occurs."),
               br(),
               p("Many of these measures could have negative consequences, including on specific sectors of society. These need to be fully considered.")
              ),
      tabPanel(title="Identify risks",id="tabb",value='tabb_val',
               br(),
               p("Please identify the risks that you wish to mitigate here (capped at three at a time currently)."),
               textInput("risk1",label="",value="Risk 1"),
               textInput("risk2",label="",value="Risk 2"),
               textInput("risk3",label="",value="Risk 3")),
               tabPanel(title="1. Physical distancing",id="tab1",value='tab1_val',
               br(),
               h5(strong("It is accepted that maintaining physical distancing it of prime importance. This is to suggest options for implementing physical distancing for further consideration.")),
               br(),br(),br(),
               tags$style(css),
               div(id = "expr-container",
               column(4,selectInput('rank_list_2a', textOutput("risk1.1"), optionsall[actionid==1,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")),
               column(4,selectInput('rank_list_2b', textOutput("risk1.2"), optionsall[actionid==1,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")),
               column(4,selectInput('rank_list_2c', textOutput("risk1.3"), optionsall[actionid==1,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")))),
      tabPanel(title="2. Reducing transmission\nthrough contaminated items",id="tab2",value='tab2_val',
               br(),
               h5(strong("This is to suggest options for further consideration for reducing contamination and subsequent infection through contaminated items.")),
               br(),br(),br(),
               tags$style(css),
               div(id = "expr-container",
               column(4,selectInput('rank_list_4a', textOutput("risk2.1"), optionsall[actionid==2,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")),
               column(4,selectInput('rank_list_4b', textOutput("risk2.2"), optionsall[actionid==2,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")),
               column(4,selectInput('rank_list_4c', textOutput("risk2.3"), optionsall[actionid==2,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")))),
      tabPanel(title="3. Enhancing cleaning and hygiene",id="tab3",value='tab3_val',
               br(),
               h5(strong("Improved personal hygiene and cleaning is standard guidance.  This is to suggest options for implementing for further consideration.")),
               br(),br(),br(),
               tags$style(css),
               div(id = "expr-container",
               column(4,selectInput('rank_list_6a', textOutput("risk3.1"), optionsall[actionid==3,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")),
               column(4,selectInput('rank_list_6b', textOutput("risk3.2"), optionsall[actionid==3,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")),
               column(4,selectInput('rank_list_6c', textOutput("risk3.3"), optionsall[actionid==3,actiondesc], multiple=TRUE, selectize=TRUE,width="100%")))),
              
      tabPanel(title="Background",id="tab6",value='tab6_val',
               p("This is based on the work completed as a global collaboration led by BioRISC (the", a("Biosecurity Research Initiative at St Catharine's College, Cambridge",href="https://www.caths.cam.ac.uk/research/biorisc"),"),", a("Conservation Evidence",href="https://www.conservationevidence.com/"), "based in the Department of Zoology, University of Cambridge and the", a("Centre for the Study of Existential Risk",href="https://www.cser.ac.uk/"), "who used solution scanning to generate a list of possible options (at", a("https://covid-19.biorisc.com",href="https://covid-19.biorisc.com"), ", to reduce SARS-CoV-2 transmission (Paper preprint:", a("https://osf.io/ca5rh",href="https://osf.io/ca5rh"),")."),
               p("This ShinyApp was created by Alec Christie with conceptual input from William Sutherland."),
               p("The ShinyApp code may be adopted by others, with acknowledgment -", a("see GitHub page",href="https://github.com/alecchristie888/covid_19_options_shinyapp"),". Suggestions for improving this are also very welcome.")),
      tabPanel(title="Download custom list of options",id="tab7",value='tab7_val',
               br(),
               br(),
               h2("Your customised list of options"),
               p("To display an on-screen customised table of options then click below."),
               actionButton("goButton","Get table of options to copy", style='padding:4px; font-size:125%'),
               br(),
               htmlOutput("textsumm"),
               br(),
               p("To download a customised list of options as a word doc (.docx) click below."),
               downloadButton("downloadReport", "Download list of options", style='padding:4px; font-size:125%'),
               br(),br(),
               br(),
               p("To download a customised list of options as an excel file (.xlsx) click below."),
               downloadButton("downloadxl", "Download list of options", style='padding:4px; font-size:125%')
               
               
               
      )
      
    )
  )
)
