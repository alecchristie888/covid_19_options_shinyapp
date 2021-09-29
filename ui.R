library("shinythemes")
library(shiny)
require(shinyjs)
require('shinydashboard')
library(data.table)
library(sortable)

optionsall=fread("masteroptionslist.csv",stringsAsFactors = FALSE)
#str(optionsall)

fluidPage(useShinyjs(),
  titlePanel(title = tags$a(href='https://doi.org/10.1016/j.jobb.2021.08.003',target="_blank",
                            tags$img(src="image2.jpg", width = 175, height = 50)), 
             windowTitle = 'Covid-19 solution scanning tool'),
  titlePanel(title='Covid-19 solution scanning tool'),
  sidebarLayout(
      sidebarPanel(width=3, 
             h4("Background"),
             p("This is based on the work completed as a global collaboration led by BioRISC", a("(Biosecurity Research Initiative at St Catharine's College, Cambridge),",href="https://www.caths.cam.ac.uk/research/biorisc",target="_blank"), a("Conservation Evidence",href="https://www.conservationevidence.com/",target="_blank"), "based in the Department of Zoology, University of Cambridge and the", a("Centre for the Study of Existential Risk.",href="https://www.cser.ac.uk/",target="_blank"), "They used solution scanning to generate a list of possible actions", a("(https://covid-19.biorisc.com)",href="https://covid-19.biorisc.com",target="_blank"), "to reduce SARS-CoV-2 transmission", a("(journal article).",href="https://doi.org/10.1016/j.jobb.2021.08.003",target="_blank")),
             p("This ShinyApp was created by Alec Christie with conceptual input from William Sutherland."),
             p("The ShinyApp code may be adopted by others, with acknowledgment - see", a("GitHub.",href="https://github.com/alecchristie888/covid_19_options_shinyapp",target="_blank"),"Suggestions for improving this are also very welcome, as are further options", a("biorisc@caths.cam.ac.uk.",href="biorisc@caths.cam.ac.uk",target="_blank"))
      ),
  mainPanel(width=9,
      navbarPage("",id="maintabs",
        tabPanel(title="How to use",id="taba",value='taba_val',
               tags$style(
                 ".navbar-nav li a {
                            font-size: 17px;
                            font-weight: bold;
                              }
                            "
               ),
               h3("Identifying implementation options in Covid-19 planning"),
               p("This app is designed to encourage the consideration of the wide range of options for reducing risks related to Covid-19. For example, maintaining physical distancing is key, but what do you do to ensure this happens? This app guides the user through numerous options so they can identify those they wish to explore further. This app must be used alongside consideration of accepted guidance e.g. from the government or trade body."),
               #textOutput("debug1"),
               p("The final output is a list of possible options to deliver their objectives. These general options can be converted into actions, for example:"),
               br(),
               h4(strong("Risk: Overcrowded canteen")),
               tableOutput("exampletab"),
               br(),
               p("How to create such a list:"),
               p("1. Identify and add the risk you wish to mitigate (e.g. canteen is likely to be overcrowded)"),
               p("2. Go through the options and drag over possible options for that risk"),
               p("3. Download your custom list of options that you've generated"),
               p("4. Decide how you might convert these options into specific actions describing exactly what might be done. Consider the practicality, likely effectiveness and negative impacts of the actions."),
               p("5. Use this list of possible actions to include in your planning alongside the guidance.")
      ),    
      tabPanel(title="What this tool does and doesn't do",id="tabb",value='tabb_val',
               p("We only discuss means of implementing - please go elsewhere for up-to-date evidence and guidance. Examples including national guidance (e.g.",a("https://www.gov.uk/coronavirus",href="https://www.gov.uk/coronavirus"), "and the guidance from specific sectors)."),
               p("There are many areas of uncertainty especially the importance of different transmission routes and also how long the virus is active on different materials. Look for up-to-date guidance before implementing measures such as the use of masks, gloves, or different cleaning methods."),
               p("This tool just considers means of adjusting physical distancing, reducing spread through contamination and improving the uptake of personal hygiene and cleaning and has been shortened to exclude policy level actions."),
               p("Many of these measures could have negative consequences, including on specific sectors of society. These need to be fully considered.")),
      tabPanel(title="Identify risk",id="tabb",value='tabb_val',
               h5(strong("Identify the risk that you wish to mitigate")),
               p("e.g. Overcrowded accounts office."),
               textInput("risk1",label="",value="Risk")),
      tabPanel(title="1. Physical distancing",id="tab1",value='tab1_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_1'),
                   labels=NULL,
                   input_id = 'rank_list_1_1'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_2",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_2",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_2'),
                   labels=NULL,
                   input_id = 'rank_list_1_2'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_3",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_3",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_3'),
                   labels=NULL,
                   input_id = 'rank_list_1_3'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_4",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_4",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_4'),
                   labels=NULL,
                   input_id = 'rank_list_1_4'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_5",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_5",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_5'),
                   labels=NULL,
                   input_id = 'rank_list_1_5'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_6",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_6",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_6'),
                   labels=NULL,
                   input_id = 'rank_list_1_6'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_7",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_7",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_7'),
                   labels=NULL,
                   input_id = 'rank_list_1_7'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_8",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_8",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_8'),
                   labels=NULL,
                   input_id = 'rank_list_1_8'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_9",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_9",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_9'),
                   labels=NULL,
                   input_id = 'rank_list_1_9'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_10",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_10",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_10'),
                   labels=NULL,
                   input_id = 'rank_list_1_10'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_11",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_11",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_11'),
                   labels=NULL,
                   input_id = 'rank_list_1_11'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==1&actionsubid=="1_12",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==1&actionsubid=="1_12",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk1_12'),
                   labels=NULL,
                   input_id = 'rank_list_1_12'
                 )
               ),
               br()),
      tabPanel(title="2. Reducing transmission\nthrough contaminated items",id="tab2",value='tab2_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==2&actionsubid=="2_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==2&actionsubid=="2_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk2_1'),
                   labels=NULL,
                   input_id = 'rank_list_2_1'
                 )
               ),
               br(),br(),                   
               bucket_list(
                 header = strong(unique(optionsall[actionid==2&actionsubid=="2_2",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==2&actionsubid=="2_2",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk2_2'),
                   labels=NULL,
                   input_id = 'rank_list_2_2'
                 )
               ),
               br(),br(),                   
               bucket_list(
                 header = strong(unique(optionsall[actionid==2&actionsubid=="2_3",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==2&actionsubid=="2_3",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk2_3'),
                   labels=NULL,
                   input_id = 'rank_list_2_3'
                 )
               ),
               br(),br(),                   
               bucket_list(
                 header = strong(unique(optionsall[actionid==2&actionsubid=="2_4",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==2&actionsubid=="2_4",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk2_4'),
                   labels=NULL,
                   input_id = 'rank_list_2_4'
                 )
               ),
               br(),br(),                   
               bucket_list(
                 header = strong(unique(optionsall[actionid==2&actionsubid=="2_5",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==2&actionsubid=="2_5",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk2_5'),
                   labels=NULL,
                   input_id = 'rank_list_2_5'
                 )
               ),
               br(),br(),                   
               bucket_list(
                 header = strong(unique(optionsall[actionid==2&actionsubid=="2_6",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==2&actionsubid=="2_6",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk2_6'),
                   labels=NULL,
                   input_id = 'rank_list_2_6'
                 )
               )
      ),
      tabPanel(title="3. Reduce transmission through contaminated items or surfaces",id="tab3",value='tab3_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_1'),
                   labels=NULL,
                   input_id = 'rank_list_3_1'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_2",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_2",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_2'),
                   labels=NULL,
                   input_id = 'rank_list_3_2'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_3",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_3",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_3'),
                   labels=NULL,
                   input_id = 'rank_list_3_3'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_4",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_4",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_4'),
                   labels=NULL,
                   input_id = 'rank_list_3_4'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_5",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_5",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_5'),
                   labels=NULL,
                   input_id = 'rank_list_3_5'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_6",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_6",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_6'),
                   labels=NULL,
                   input_id = 'rank_list_3_6'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_7",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_7",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_7'),
                   labels=NULL,
                   input_id = 'rank_list_3_7'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_8",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_8",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_8'),
                   labels=NULL,
                   input_id = 'rank_list_3_8'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_9",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_9",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_9'),
                   labels=NULL,
                   input_id = 'rank_list_3_9'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==3&actionsubid=="3_10",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==3&actionsubid=="3_10",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk3_10'),
                   labels=NULL,
                   input_id = 'rank_list_3_10'
                 )
               )),
      tabPanel(title="4. Enhancing cleaning and hygiene",id="tab4",value='tab4_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==4&actionsubid=="4_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==4&actionsubid=="4_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk4_1'),
                   labels=NULL,
                   input_id = 'rank_list_4_1'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==4&actionsubid=="4_2",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==4&actionsubid=="4_2",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk4_2'),
                   labels=NULL,
                   input_id = 'rank_list_4_2'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==4&actionsubid=="4_3",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==4&actionsubid=="4_3",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk4_3'),
                   labels=NULL,
                   input_id = 'rank_list_4_3'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==4&actionsubid=="4_4",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==4&actionsubid=="4_4",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk4_4'),
                   labels=NULL,
                   input_id = 'rank_list_4_4'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==4&actionsubid=="4_5",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==4&actionsubid=="4_5",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk4_5'),
                   labels=NULL,
                   input_id = 'rank_list_4_5'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==4&actionsubid=="4_6",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==4&actionsubid=="4_6",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk4_6'),
                   labels=NULL,
                   input_id = 'rank_list_4_6'
                 )
               )),
      tabPanel(title="5. Reduce transmission through waste water",id="tab5",value='tab5_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==5&actionsubid=="5_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==5&actionsubid=="5_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk5_1'),
                   labels=NULL,
                   input_id = 'rank_list_5_1'
                 )
               )
      ),
      tabPanel(title="6. Reduce transmission through non-human animals in the community",id="tab6",value='tab6_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==6&actionsubid=="6_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==6&actionsubid=="6_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk6_1'),
                   labels=NULL,
                   input_id = 'rank_list_6_1'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==6&actionsubid=="6_2",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==6&actionsubid=="6_2",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk6_2'),
                   labels=NULL,
                   input_id = 'rank_list_6_2'
                 )
               )),
      tabPanel(title="7. Restrict disease spread between areas",id="tab7",value='tab7_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==7&actionsubid=="7_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==7&actionsubid=="7_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk7_1'),
                   labels=NULL,
                   input_id = 'rank_list_7_1'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==7&actionsubid=="7_2",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==7&actionsubid=="7_2",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk7_2'),
                   labels=NULL,
                   input_id = 'rank_list_7_2'
                 )
               ),
               br(),br(),
               bucket_list(
                 header = strong(unique(optionsall[actionid==7&actionsubid=="7_3",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==7&actionsubid=="7_3",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk7_3'),
                   labels=NULL,
                   input_id = 'rank_list_7_3'
                 )
               )),
      tabPanel(title="8. Manage public knowledge and attitude",id="tab8",value='tab8_val',
               p("Drag options to the right if you consider they are relevant. You can also reject options if useful."),
               bucket_list(
                 header = strong(unique(optionsall[actionid==8&actionsubid=="8_1",actiontitle])),
                 add_rank_list(
                   text = strong('Put rejected options here'),
                   labels = NULL
                 ),
                 add_rank_list(
                   text = strong("Options"),
                   labels = optionsall[actionid==8&actionsubid=="8_1",actiondesc]
                 ),
                 add_rank_list(
                   text = htmlOutput('risk8_1'),
                   labels=NULL,
                   input_id = 'rank_list_8_1'
                 )
               )),
            tabPanel(title="Download customised list of options",id="tab10",value='tab10_val',
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
      
    ),position="right"
  )
)
