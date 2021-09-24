library(tidyverse)

a <- 1:100
b <- 100:1

d <- tibble(a,b)

write_csv(d, "scripts/test.csv")
