library(tidyverse)
library("ggthemes")
#esquisse()

#histograma com escala fixa
ggplot(big) +
 aes(x = Taxes) +
 geom_histogram(bins = 30L, fill = "#617a89") +
 labs(x = "Taxas", y = "Empresas", title = "Histograma das empresas pelas taxas") +
 theme_minimal() +
 facet_wrap(vars(Level))

#boxplot das empresas sobre taxas
ggplot(big) +
 aes(x = Level, y = Taxes, group = Level) +
 geom_boxplot(fill = "#377eb8") +
 labs(x = "empresas", y = "Taxas", title = "Boxplot das empresas em relação as taxas") +
 theme_minimal()

#histograma das taxas por empresas
ggplot(big) +
 aes(x = Taxes, group = Level) +
 geom_histogram(bins = 30L, fill = "#575c6d") +
 labs(x = "Taxes", y = "Número de empresas", title = "Histograma das Taxas") +
 theme_minimal() +
 facet_wrap(vars(Level), scales = "free")

#gráfico de distribuição por empresa em função do spam
ggplot(big) +
 aes(x = SPAM, group = Level) +
 geom_bar(fill = "#575c6d") +
 labs(x = "spam", y = "número de empresas", title = "Gráfico de barra ") +
 theme_minimal() +
 facet_wrap(vars(Level), scales = "free")


