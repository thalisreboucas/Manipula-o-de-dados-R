library(tidyverse)
library(esquisse)
library(knitr)
#%>%kable("latex")

#importa��o de dados 
big = read.csv("BigLucy.csv",sep = ",",row.names = 1)

#visualiza��o
View(big)

#fun��o da moda
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#visualiza��o do n�mero de empresas pelo spam 
big %>%
  group_by(Level,SPAM) %>%  summarise(n = n())%>%View()

#visualiza��o do n�mero de empresas pelo spam ,com m�dia, desvio p. , moda ,max e min.
big %>%
  group_by(Level,SPAM) %>% summarise(n = n(),m�dia = mean(Taxes),s = sd(Taxes),moda =getmode(Taxes),
 minimo = min(Taxes),mediana = median(Taxes),maximo = max(Taxes))%>%View()

#visualiza��o pelo tipo de empresa para analise descri.
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

#tabela do n�mero de empresas pelo spam ,com m�dia, desvio p. , moda ,max e min./latex
big %>%
  group_by(Level,SPAM) %>% summarise(n = n(),m�dia = mean(Taxes),s = sd(Taxes),moda =getmode(Taxes),
                                     minimo = min(Taxes),mediana = median(Taxes),maximo = max(Taxes))%>%kable("latex")

#Tabela de distribui��o de setores do spam.\latex
big %>%
  group_by(Level,SPAM) %>%  summarise(n = n())%>%kable("latex")



