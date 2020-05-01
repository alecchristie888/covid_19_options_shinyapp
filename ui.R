library("shinythemes")
library(shiny)
require(shinyjs)
require('shinydashboard')
library(data.table)
library(sortable)

optionsall=fread("masteroptionslist.csv")
str(optionsall)

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
    h2("Identifying implementation options in Covid-19 planning"),
    br(),
                     p("This App is designed to encourage the consideration of the wide range of options for reducing risks. For example, maintaining physical distancing is key, but what do you do to ensure this happens? This app guides the user through numerous options so they can identify those they wish to explore further. This app must be used alongside consideration of accepted guidance e.g. from the government or trade body.")
                     ),
  dashboardBody(
    useShinyjs(),
    tabsetPanel(
      id = "navbar",
      tabPanel(title="How to use",id="taba",value='taba_val',
               br(),
               br(),
               h4("The final output is a list of possible options to deliver their objectives. These general options can be converted into actions, for example:"),
               br(),
               h4(strong("Risk: Overcrowded canteen")),
               tableOutput("exampletab"),
               br(),
               p("How to create such a list:"),
               br(),
               p("1. Identify and add the risk you wish to mitigate (e.g. canteen is likely to be overcrowded)"),
               p("2. Go through the options and drag over possible options for that risk"),
               p("3. Download your custom list of options that you've generated"),
               p("4. Decide how you might convert these options into specific actions describing exactly what might be done. Consider the practicality, likely effectiveness and negative impacts of the actions."),
               p("5. Use this list of possible actions to include in your planning alongside the guidance.")
               ),    
      tabPanel(title="What this tool does and doesn't do",id="tabb",value='tabb_val',
               br(),
               br(),
               h4("We only discuss means of implementing - please go elsewhere for up-to-date evidence and guidance. Examples including national guidance (e.g.",a("https://www.gov.uk/coronavirus",href="https://www.gov.uk/coronavirus"), "and the guidance from specific sectors"),
               br(),
               h4(strong("There are many areas of uncertainty especially the importance of different transmission routes and also how long the virus is active on different materials. Look for up-to-date guidance before implementing measures such as the use of masks, gloves, or different cleaning methods.")),
               br(),
               h4("This tool just considers means of adjusting physical distancing, reducing spread through contamination and improving the uptake of personal hygiene and cleaning and has been shortened to exclude policy level actions."),
               br(),
               h4("Many of these measures could have negative consequences, including on specific sectors of society. These need to be fully considered.")),
      tabPanel(title="Identify risk",id="tabb",value='tabb_val',
               br(),
               h4(strong("Identify the risk that you wish to mitigate")),
               p("e.g. Overcrowded accounts office."),
               textInput("risk1",label="",value="Risk")),
      
      tabPanel(title="1. Physical distancing",id="tab1",value='tab1_val',
               br(),
               h4(strong("Maintaining physical distancing is of prime importance.")),
               br(),br(),h4(strong("Drag options to the right if you consider they are relevant. You can also reject if useful.")),
               br(),br(),
                   bucket_list(
                     header = NULL,
                     add_rank_list(
                       text = strong('Put rejected options here'),
                       labels = NULL
                     ),
                     add_rank_list(
                       text = strong("Options"),
                       labels = optionsall[actionid==1,actiondesc]
                     ),
                     add_rank_list(
                       text = htmlOutput('risk1.1'),
                       labels=NULL,
                       input_id = 'rank_list_2a'
                     )
                   )),
      tabPanel(title="2. Reducing transmission\nthrough contaminated items",id="tab2",value='tab2_val',
               br(),
               h4(strong("This is to suggest options for further consideration for reducing contamination and subsequent infection through contaminated items.")),
               br(),
               br(),h4(strong("Drag options to the right if you consider they are relevant. You can also reject if useful.")),
               br(),br(),                   
               bucket_list(
                 header = NULL,
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==2,actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk2.1'),
                   labels=NULL,
                   input_id = 'rank_list_4a'
                 )
               )),
               tabPanel(title="3. Enhancing cleaning and hygiene",id="tab3",value='tab3_val',
               br(),
               h4(strong("Improved personal hygiene and cleaning is standard guidance.")),
               br(),
               br(),h4(strong("Drag options to the right if you consider they are relevant. You can also reject if useful.")),
               br(),br(),
               bucket_list(
                 header = NULL,
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3,actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3.1'),
                   labels=NULL,
                   input_id = 'rank_list_6a'
                 )
               )),
      tabPanel(title="Background",id="tab6",value='tab6_val',
               br(),
               h4("This is based on the work completed as a global collaboration led by BioRISC (the", a("Biosecurity Research Initiative at St Catharine's College, Cambridge",href="https://www.caths.cam.ac.uk/research/biorisc"),"),", a("Conservation Evidence",href="https://www.conservationevidence.com/"), "based in the Department of Zoology, University of Cambridge and the", a("Centre for the Study of Existential Risk.",href="https://www.cser.ac.uk/"), "They used solution scanning to generate a list of possible actions (at", a("https://covid-19.biorisc.com",href="https://covid-19.biorisc.com"), ", to reduce SARS-CoV-2 transmission (Paper preprint:", a("https://osf.io/ca5rh",href="https://osf.io/ca5rh"),")."),
               br(),
               h4("This ShinyApp was created by Alec Christie with conceptual input from William Sutherland."),
               br(),
               h4("The ShinyApp code may be adopted by others, with acknowledgment -", a("see GitHub page",href="https://github.com/alecchristie888/covid_19_options_shinyapp"),". Suggestions for improving this are also very welcome, as are further options", a("biorisc@caths.cam.ac.uk",href="biorisc@caths.cam.ac.uk"),".")),
      tabPanel(title="Download customised list of options",id="tab7",value='tab7_val',
               br(),
               br(),
               h3("Your customised list of options"),
               h4("To display an on-screen customised table of options click below."),
               actionButton("goButton","Get table of actions to copy", style='padding:4px; font-size:125%'),
               br(),
               h4(textOutput("risktab1")),htmlOutput("textsumm1"),
               br(),
               h4("To download a customised list of options as a word doc (.docx) click below."),
               downloadButton("downloadReport", "Download list of actions", style='padding:4px; font-size:125%'),
               br(),
               h4("To download a customised list of options as an excel file (.xlsx) click below."),
               downloadButton("downloadxl", "Download list of actions", style='padding:4px; font-size:125%')
               
               
               
      )
      
    )
  )
)
