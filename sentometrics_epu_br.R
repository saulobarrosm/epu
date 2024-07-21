# Required packages
library(Rcpp)
library(sentometrics)
library(quanteda)
library(data.table)
library(dplyr)
library(readxl)
library(beepr)

# Read newspaper text dataset 
base <- read.csv("newspaper_text.csv", encoding = "UTF-8", sep = ";")

# Dataset adaptation to the sentometrics standard
base$date = substr(base$date,1,10)
base <- base[nchar(base$text) > 300,] #news with less than 300 characters were removed 
names(base)[names(base) == 'text'] <- "texts"
base <- base[!duplicated(base[ , "texts"]),] # remove duplicates
base$folha <- 1
base <- base[!is.na(base$date),]
base$id <- seq.int(nrow(base))

# Creation of the textual corpus
corpus <- sento_corpus(usnews[, c("id", "date", "texts", "folha", "g1", "extra")])

# Definition of words for each EPU topic
keywords <- list(
  E = c("econômico", "economia"),
  P = c("regulação", "déficit", "orçamento", "imposto", "banco central", "alvorada", "planalto",
        "congresso", "senado", "câmara dos deputados", "legislação", "lei", "tarifa"),
  U = c("incerto", "incerteza")
)
keywords_dt <- lapply(keywords, function(kw) data.table(x = kw, y = 1))
lex <- sento_lexicons(keywords_dt)
  
s <- compute_sentiment(corpus, lex, "counts")
  
s[, -c("date", "word_count")]
  
sA <- s[, 1:3]
sB <- s[, -c(1:3)]
  
# Only news with three or more words from each topic were considered EPU
to_epu <- function(x) as.numeric(rowSums(x > 0) >= 3) 
  
sB[, "EPU--folha" := to_epu(.SD), .SDcols = endsWith(colnames(sB), "folha")]
sB[, "EPU--g1" := to_epu(.SD), .SDcols = endsWith(colnames(sB), "g1")]
sB[, "EPU--extra1" := to_epu(.SD), .SDcols = endsWith(colnames(sB), "extra")]
  
s2 <- as.sentiment(cbind(sA, sB[, c("EPU--folha", "EPU--g1","EPU--extra1")]))
  
  
# Normalization
w <- data.frame("simple" = c(rep(0, 11), 1), "linear" = weights_exponential(12, alphas = 10^-10)[, 1])
ctr <- ctr_agg(howDocs = "equal_weight", do.ignoreZeros = FALSE,
                 howTime = "own", by = "month", lag = 12, weights = w)
  
sm <- aggregate(s2, ctr)
  
dt <- as.data.table(subset(sm, date < "2021-11-03"))
sds <- apply(dt[, -1], 2, sd)
  
sm2 <- scale(sm, center = FALSE, scale = sds/100)
subset(sm2, date < "2021-11-03")[["stats"]]
  
# Agregate if there are other newspapers
sm3 <- aggregate(sm2, features = list(journals = c("folha", "g1", "extra")))
  
# Aggregate measure chart
plot(sm3, "time")
  
sm4 <- scale(sm, center = rep(-50, nmeasures(sm)), scale = FALSE)

#Final graph
plot(sm4)
  
#Final results
final_results <- as.data.frame(sm4[["measures"]])
  
# Save final results
write.csv2(final_results, file="final_results.csv")