# データの読み込み {#data}


## csvデータの読み込み

`read_csv()`を用いる．`read.csv`でも可能．


```r
library(tidyverse)
```

```
## ─ Attaching packages ──────────────────── tidyverse 1.3.1 ─
```

```
## ✓ tibble  3.1.4     ✓ dplyr   1.0.7
## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
## ✓ readr   2.0.1     ✓ forcats 0.5.1
## ✓ purrr   0.3.4
```

```
## ─ Conflicts ───────────────────── tidyverse_conflicts() ─
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
d_csv <- read_csv("data/example_1.csv")
```

```
## Rows: 1854 Columns: 9
```

```
## ─ Column specification ────────────────────────────
## Delimiter: ","
## dbl (9): id, c1_1, c2a, c2b, c2c, c2d, c2e, c17_1hensa, c15a
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
d_csv
```

```
## # A tibble: 1,854 × 9
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>
##  1     1     2     2     3     3     3     2       68       1
##  2     2     2     1     4     3     5     3       43       2
##  3     3     2     2     4     2     5     4       56       3
##  4     4     1     3     4     1     5     5       39       4
##  5     5     2     1     5     4     5     2       59       1
##  6     6     2     1     2     3     5     2       58       2
##  7     7     1     2     3     3     5     4       41       4
##  8     8     2     2     2     2     3     3       46       3
##  9     9     1     1     4     4     5     3       35.5     3
## 10    10     2     2     3     3     5     2       46       2
## # … with 1,844 more rows
```


## xlsxデータの読み込み

xlsxデータを読み込む．


```r
library(readxl)
d_xlsx <- read_xlsx("data/example_1.xlsx")
d_xlsx
```

```
## # A tibble: 1,854 × 9
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>
##  1     1     2     2     3     3     3     2       68       1
##  2     2     2     1     4     3     5     3       43       2
##  3     3     2     2     4     2     5     4       56       3
##  4     4     1     3     4     1     5     5       39       4
##  5     5     2     1     5     4     5     2       59       1
##  6     6     2     1     2     3     5     2       58       2
##  7     7     1     2     3     3     5     4       41       4
##  8     8     2     2     2     2     3     3       46       3
##  9     9     1     1     4     4     5     3       35.5     3
## 10    10     2     2     3     3     5     2       46       2
## # … with 1,844 more rows
```




## dtaデータの読み込み

Stataで用いられている`dta`データを読み込むには`read_dta`を用いる．


```r
library(haven)
d_dta <- read_dta("data/example_1.dta")
d_dta
```

```
## # A tibble: 1,854 × 9
##       id      c1_1      c2a      c2b      c2c     c2d     c2e c17_1hensa    c15a
##    <dbl> <dbl+lbl> <dbl+lb> <dbl+lb> <dbl+lb> <dbl+l> <dbl+l>  <dbl+lbl> <dbl+l>
##  1     1  2 [女性] 2 [まああて… 3 [どちらと… 3 [どちらと… 3 [どちら… 2 [まああ…       68   1 [上のほ…
##  2     2  2 [女性] 1 [あてはま… 4 [あまりあ… 3 [どちらと… 5 [あては… 3 [どちら…       43   2 [真ん中…
##  3     3  2 [女性] 2 [まああて… 4 [あまりあ… 2 [まああて… 5 [あては… 4 [あまり…       56   3 [真ん中…
##  4     4  1 [男性] 3 [どちらと… 4 [あまりあ… 1 [あてはま… 5 [あては… 5 [あては…       39   4 [真ん中…
##  5     5  2 [女性] 1 [あてはま… 5 [あてはま… 4 [あまりあ… 5 [あては… 2 [まああ…       59   1 [上のほ…
##  6     6  2 [女性] 1 [あてはま… 2 [まああて… 3 [どちらと… 5 [あては… 2 [まああ…       58   2 [真ん中…
##  7     7  1 [男性] 2 [まああて… 3 [どちらと… 3 [どちらと… 5 [あては… 4 [あまり…       41   4 [真ん中…
##  8     8  2 [女性] 2 [まああて… 2 [まああて… 2 [まああて… 3 [どちら… 3 [どちら…       46   3 [真ん中…
##  9     9  1 [男性] 1 [あてはま… 4 [あまりあ… 4 [あまりあ… 5 [あては… 3 [どちら…       35.5 3 [真ん中…
## 10    10  2 [女性] 2 [まああて… 3 [どちらと… 3 [どちらと… 5 [あては… 2 [まああ…       46   2 [真ん中…
## # … with 1,844 more rows
```


ラベルがあるがそれを除きたければ`zap_label`と`zap_labels`を用いる．
個人的にはラベルは無いほうがよいと考えている（基本はコードブックなどで確認すべきこと）ので，削除する．


```r
d_dta <- d_dta %>% zap_label()
d_dta <- d_dta %>% zap_labels()
d_dta
```

```
## # A tibble: 1,854 × 9
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>
##  1     1     2     2     3     3     3     2       68       1
##  2     2     2     1     4     3     5     3       43       2
##  3     3     2     2     4     2     5     4       56       3
##  4     4     1     3     4     1     5     5       39       4
##  5     5     2     1     5     4     5     2       59       1
##  6     6     2     1     2     3     5     2       58       2
##  7     7     1     2     3     3     5     4       41       4
##  8     8     2     2     2     2     3     3       46       3
##  9     9     1     1     4     4     5     3       35.5     3
## 10    10     2     2     3     3     5     2       46       2
## # … with 1,844 more rows
```



```r
summary(d_dta)
```

```
##        id              c1_1            c2a             c2b      
##  Min.   :   1.0   Min.   :1.000   Min.   :1.000   Min.   :1.00  
##  1st Qu.: 464.2   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:3.00  
##  Median : 927.5   Median :2.000   Median :2.000   Median :4.00  
##  Mean   : 927.5   Mean   :1.508   Mean   :1.768   Mean   :3.48  
##  3rd Qu.:1390.8   3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:4.00  
##  Max.   :1854.0   Max.   :2.000   Max.   :5.000   Max.   :5.00  
##                                   NA's   :5       NA's   :8     
##       c2c             c2d             c2e          c17_1hensa   
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :30.00  
##  1st Qu.:2.000   1st Qu.:3.000   1st Qu.:2.000   1st Qu.:44.75  
##  Median :3.000   Median :4.000   Median :2.000   Median :52.00  
##  Mean   :2.727   Mean   :4.061   Mean   :2.423   Mean   :52.19  
##  3rd Qu.:3.000   3rd Qu.:5.000   3rd Qu.:3.000   3rd Qu.:60.00  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :75.00  
##  NA's   :12      NA's   :11      NA's   :6       NA's   :251    
##       c15a      
##  Min.   :1.000  
##  1st Qu.:2.000  
##  Median :3.000  
##  Mean   :2.622  
##  3rd Qu.:3.000  
##  Max.   :5.000  
##  NA's   :26
```



```r
table(d_dta$c1_1)
```

```
## 
##   1   2 
## 912 942
```


```r
library(janitor)
```

```
## 
##  次のパッケージを付け加えます: 'janitor'
```

```
##  以下のオブジェクトは 'package:stats' からマスクされています: 
## 
##      chisq.test, fisher.test
```

```r
tabyl(d_dta, c1_1)
```

```
##  c1_1   n   percent
##     1 912 0.4919094
##     2 942 0.5080906
```




