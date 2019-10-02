library(tidyverse)
library(esquisse)
library(knitr)
#%>%kable("latex")

#importação de dados 
big = read.csv("BigLucy.csv",sep = ",",row.names = 1)

#visualização
View(big)

#função da moda
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#visualização do número de empresas pelo spam 
big %>%
  group_by(Level,SPAM) %>%  summarise(n = n())%>%View()

#visualização do número de empresas pelo spam ,com média, desvio p. , moda ,max e min.
big %>%
  group_by(Level,SPAM) %>% summarise(n = n(),média = mean(Taxes),s = sd(Taxes),moda =getmode(Taxes),
 minimo = min(Taxes),mediana = median(Taxes),maximo = max(Taxes))%>%View()

#visualização pelo tipo de empresa para analise descri.
big%>%
  group_by(Level)%>%
  summarise(numero=n(),media = mean(Taxes),desvio = sd(Taxes),cv = (desvio/media)*100,minimo = min(Taxes),Q1 = quantile(Taxes,probs = 0.25),mediana = median(Taxes),
       Q3 = quantile(Taxes, probs = 0.75),
        maximo = max(Taxes),moda = getmode(Taxes))%>%View()

#Tabela tipo de empresa para analise descri./para latex
big%>%
  group_by(Level)%>%
  summarise(numero=n(),media = mean(Taxes),desvio = sd(Taxes),cv = (desvio/media)*100,minimo = min(Taxes),Q1 = quantile(Taxes,probs = 0.25),mediana = median(Taxes),
            Q3 = quantile(Taxes, probs = 0.75),
            maximo = max(Taxes),moda = getmode(Taxes))%>%kable("latex")

#tabela do número de empresas pelo spam ,com média, desvio p. , moda ,max e min./latex
big %>%
  group_by(Level,SPAM) %>% summarise(n = n(),média = mean(Taxes),s = sd(Taxes),moda =getmode(Taxes),
                                     minimo = min(Taxes),mediana = median(Taxes),maximo = max(Taxes))%>%kable("latex")

#Tabela de distribuição de setores do spam.\latex
big %>%
  group_by(Level,SPAM) %>%  summarise(n = n())%>%kable("latex")



