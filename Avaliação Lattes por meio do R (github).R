# Instale e ative o pacote ChocoLattes
install.packages("ChocoLattes",dependencies = T)
library(ChocoLattes)

# Defina seu diretório de trabalho (onde serão importados e exportados arquivos)
setwd('C:/Users/...')

# Faça uma lista das formas de citação na produção
my.aliases <- list(c("Zé da Silva","Silva, Z"))

# Defina o diretório onde estão os currículos salvos em XML (esta opção está disponível no Lattes)
# Sugestão: crie uma pasta na pasta do pacote Chollattes com os currículos e use a função abaixo
my.dir <- system.file("nome da pasta", package="ChocoLattes")
# ou use
my.dir <- 'C:/Users/...'

# Crie uma lista da produção 
lattes.list <- lattes_to_list(CV.dir = my.dir,
                              author.aliases = my.aliases)

y <-plot_chart(lattes.list, chart.type = c("ggplot2", "plotly", "rCharts"),
               width = 960, height = 480, language = list("EN","PT"),
               which.fields = c("journal.accepted", "journal.published",
                 "conference.international", "conference.national", "book.chapters", "books",
                "phd.theses", "msc.theses"))

# Visualize o gráfico de produções 
print(y)

# Crie a página de produção em HTML
make_productions_page(lattes.list = lattes.list, 
                      chart.type  = "ggplot2", 
                      h1.title    = "PPG", 
                      h2.title    = "Universidade",
                      language    = c("EN","PT"),
                      which.fields = c("journal.accepted", "journal.published",
                                       "conference.international", "conference.national", "book.chapters", "books",
                                       "phd.theses", "msc.theses"))

# Avaliar a produção por estrato Qualis e por ano
# Faça o download da classificação Qualis, selecionando apenas os campos
# Evento de Classificação e Área de Avaliação
# (https://sucupira.capes.gov.br/sucupira/public/consultas/coleta/veiculoPublicacaoQualis/listaConsultaGeralPeriodicos.jsf) 
# Depois copie e cole o conteúdo em uma planilha do Google Sheets e salve em formato ".csv"
# (https://docs.google.com/spreadsheets/u/0/) 

# Informe a localização da planilha do Qualis
qualis.file.pg<-"C:/Users/.../Untitled spreadsheet - Sheet1.csv"

# Gere os gráficos de produção por estrato para os anos selecionados
extract_qualis(lattes.list, years=list(2018,2019), qualis.file.pg, isComputerScience = FALSE,
               output.file = c("csv", "xlsx"), plotQualis = TRUE,
               qualis.extract = NULL, plot.width = 16, plot.height = 8,
               plot.units = "in", plot.res = 300, plot.text.size = 18)
