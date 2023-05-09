# データの読み込み {#data}


## 様々な形式のデータの読み込み
### csvデータの読み込み

`read_csv()`を用いる．`read.csv`でも可能．


```r
library(tidyverse)
```

```
## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
## ✔ dplyr     1.1.2     ✔ readr     2.1.4
## ✔ forcats   1.0.0     ✔ stringr   1.5.0
## ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
## ✔ purrr     1.0.1     
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

```r
d_csv <- read_csv("data/example_1.csv")
```

```
## Rows: 1854 Columns: 9
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## dbl (9): id, c1_1, c2a, c2b, c2c, c2d, c2e, c17_1hensa, c15a
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
## # ℹ 1,844 more rows
```


### xlsxデータの読み込み

xlsxデータを読み込む．


```r
library(readxl)
d_excel <- read_excel("data/example_1.xlsx")
d_excel
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
## # ℹ 1,844 more rows
```


### dtaデータの読み込み

Stataで用いられている`dta`データを読み込むには`haven`パッケージの`read_dta`を用いる．
SPSSの場合は`read_sav`，SASの場合は`read_sas`を使えばよい．


```r
library(haven)
d_dta <- read_dta("data/example_1.dta")
d_dta
```

```
## # A tibble: 1,854 × 9
##       id c1_1      c2a        c2b     c2c     c2d     c2e     c17_1hensa c15a   
##    <dbl> <dbl+lbl> <dbl+lbl>  <dbl+l> <dbl+l> <dbl+l> <dbl+l> <dbl+lbl>  <dbl+l>
##  1     1 2 [女性]  2 [まああ… 3 [ど… 3 [ど… 3 [ど… 2 [ま… 68         1 [上…
##  2     2 2 [女性]  1 [あては… 4 [あ… 3 [ど… 5 [あ… 3 [ど… 43         2 [真…
##  3     3 2 [女性]  2 [まああ… 4 [あ… 2 [ま… 5 [あ… 4 [あ… 56         3 [真…
##  4     4 1 [男性]  3 [どちら… 4 [あ… 1 [あ… 5 [あ… 5 [あ… 39         4 [真…
##  5     5 2 [女性]  1 [あては… 5 [あ… 4 [あ… 5 [あ… 2 [ま… 59         1 [上…
##  6     6 2 [女性]  1 [あては… 2 [ま… 3 [ど… 5 [あ… 2 [ま… 58         2 [真…
##  7     7 1 [男性]  2 [まああ… 3 [ど… 3 [ど… 5 [あ… 4 [あ… 41         4 [真…
##  8     8 2 [女性]  2 [まああ… 2 [ま… 2 [ま… 3 [ど… 3 [ど… 46         3 [真…
##  9     9 1 [男性]  1 [あては… 4 [あ… 4 [あ… 5 [あ… 3 [ど… 35.5       3 [真…
## 10    10 2 [女性]  2 [まああ… 3 [ど… 3 [ど… 5 [あ… 2 [ま… 46         2 [真…
## # ℹ 1,844 more rows
```

### 変数ラベルと値ラベルの削除

もともとのデータセットに変数ラベルや値ラベルがある場合があるが，それらを除きたければ`zap_label`と`zap_labels`を用いる．個人的にはラベルは無いほうがよいと考えている（基本はコードブックなどで確認すべきこと）ので，削除する．


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
## # ℹ 1,844 more rows
```

## データの確認



```r
d <- read_csv("data/example_1.csv")
```

```
## Rows: 1854 Columns: 9
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## dbl (9): id, c1_1, c2a, c2b, c2c, c2d, c2e, c17_1hensa, c15a
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
d
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
## # ℹ 1,844 more rows
```

ケースと変数の数を確認


```r
dim(d)
```

```
## [1] 1854    9
```

変数名の確認

```r
names(d)
```

```
## [1] "id"         "c1_1"       "c2a"        "c2b"        "c2c"       
## [6] "c2d"        "c2e"        "c17_1hensa" "c15a"
```



```r
summary(d)
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
library(skimr)
skim(d)
```


Table: (\#tab:unnamed-chunk-9)Data summary

|                         |     |
|:------------------------|:----|
|Name                     |d    |
|Number of rows           |1854 |
|Number of columns        |9    |
|_______________________  |     |
|Column type frequency:   |     |
|numeric                  |9    |
|________________________ |     |
|Group variables          |None |


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|   mean|     sd| p0|    p25|   p50|     p75| p100|hist  |
|:-------------|---------:|-------------:|------:|------:|--:|------:|-----:|-------:|----:|:-----|
|id            |         0|          1.00| 927.50| 535.35|  1| 464.25| 927.5| 1390.75| 1854|▇▇▇▇▇ |
|c1_1          |         0|          1.00|   1.51|   0.50|  1|   1.00|   2.0|    2.00|    2|▇▁▁▁▇ |
|c2a           |         5|          1.00|   1.77|   0.95|  1|   1.00|   2.0|    2.00|    5|▇▆▂▁▁ |
|c2b           |         8|          1.00|   3.48|   1.20|  1|   3.00|   4.0|    4.00|    5|▂▃▆▇▆ |
|c2c           |        12|          0.99|   2.73|   1.08|  1|   2.00|   3.0|    3.00|    5|▃▅▇▃▁ |
|c2d           |        11|          0.99|   4.06|   1.14|  1|   3.00|   4.0|    5.00|    5|▁▁▃▃▇ |
|c2e           |         6|          1.00|   2.42|   1.09|  1|   2.00|   2.0|    3.00|    5|▅▇▆▂▁ |
|c17_1hensa    |       251|          0.86|  52.19|   9.72| 30|  44.75|  52.0|   60.00|   75|▃▇▇▇▂ |
|c15a          |        26|          0.99|   2.62|   1.23|  1|   2.00|   3.0|    3.00|    5|▆▇▇▃▂ |



```r
table(d$c1_1)
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
## Attaching package: 'janitor'
```

```
## The following objects are masked from 'package:stats':
## 
##     chisq.test, fisher.test
```

```r
tabyl(d_dta, c1_1)
```

```
##  c1_1   n   percent
##     1 912 0.4919094
##     2 942 0.5080906
```


## データの加工と集計

データの加工と集計で主に使用するのは次の関数である．



```r
関数 <- c("select", "filter", "drop_na", "mutate", "summarise", "group_by","ungroup","pivot_longer","pivot_wider","separate")
目的 <- c("変数を選択", "ケースを選択", "欠損値の削除", "変数の追加", "データの要約","グループ別の処理","グループ化の解除","データをロング形式にする","データをワイド形式にする","文字列を複数の列に分離")
例 <- c("`d %>% select(var1, var2)`",
       "`d %>% filter(var1 >= 5)`",
       "`d %>% drop_na(var1, var2)`",
       "`d <- d %>% mutate(var3 = var1 + var2)`",
       "`d %>% summarise(Mean = mean(var1))`",
       "`d %>% group_by(group) %>% summarise(Median = median(var1))`",
       "`d %>% group_by(group) %>% summarise(Median = median(var1)) %>% ungroup()`",
       "","","")
tibble(関数,目的,例) %>% 
  knitr::kable()
```



|関数         |目的                     |例                                                                         |
|:------------|:------------------------|:--------------------------------------------------------------------------|
|select       |変数を選択               |`d %>% select(var1, var2)`                                                 |
|filter       |ケースを選択             |`d %>% filter(var1 >= 5)`                                                  |
|drop_na      |欠損値の削除             |`d %>% drop_na(var1, var2)`                                                |
|mutate       |変数の追加               |`d <- d %>% mutate(var3 = var1 + var2)`                                    |
|summarise    |データの要約             |`d %>% summarise(Mean = mean(var1))`                                       |
|group_by     |グループ別の処理         |`d %>% group_by(group) %>% summarise(Median = median(var1))`               |
|ungroup      |グループ化の解除         |`d %>% group_by(group) %>% summarise(Median = median(var1)) %>% ungroup()` |
|pivot_longer |データをロング形式にする |                                                                           |
|pivot_wider  |データをワイド形式にする |                                                                           |
|separate     |文字列を複数の列に分離   |                                                                           |


### 変数を選択する


```r
d %>% select(id, c1_1)
```

```
## # A tibble: 1,854 × 2
##       id  c1_1
##    <dbl> <dbl>
##  1     1     2
##  2     2     2
##  3     3     2
##  4     4     1
##  5     5     2
##  6     6     2
##  7     7     1
##  8     8     2
##  9     9     1
## 10    10     2
## # ℹ 1,844 more rows
```


`c2`を含む変数を選択する場合には`contains`を用いる．
 

```r
d %>% select(id, contains("c2"))
```

```
## # A tibble: 1,854 × 6
##       id   c2a   c2b   c2c   c2d   c2e
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
##  1     1     2     3     3     3     2
##  2     2     1     4     3     5     3
##  3     3     2     4     2     5     4
##  4     4     3     4     1     5     5
##  5     5     1     5     4     5     2
##  6     6     1     2     3     5     2
##  7     7     2     3     3     5     4
##  8     8     2     2     2     3     3
##  9     9     1     4     4     5     3
## 10    10     2     3     3     5     2
## # ℹ 1,844 more rows
```



```r
関数 <- c("starts_with",
        "ends_with",
        "contains",
        "matches",
        "num_range")

一致 <- c("変数名の始まりが一致",
        "変数名の終わりが一致",
        "変数名の文字が一致",
        "正規表現で一致",
        "q01,q02,...のように一致")

tibble(関数,一致) %>% 
  knitr::kable()
```



|関数        |一致                    |
|:-----------|:-----------------------|
|starts_with |変数名の始まりが一致    |
|ends_with   |変数名の終わりが一致    |
|contains    |変数名の文字が一致      |
|matches     |正規表現で一致          |
|num_range   |q01,q02,...のように一致 |



```r
d %>% select(starts_with("c2"))
```

```
## # A tibble: 1,854 × 5
##      c2a   c2b   c2c   c2d   c2e
##    <dbl> <dbl> <dbl> <dbl> <dbl>
##  1     2     3     3     3     2
##  2     1     4     3     5     3
##  3     2     4     2     5     4
##  4     3     4     1     5     5
##  5     1     5     4     5     2
##  6     1     2     3     5     2
##  7     2     3     3     5     4
##  8     2     2     2     3     3
##  9     1     4     4     5     3
## 10     2     3     3     5     2
## # ℹ 1,844 more rows
```


```r
d %>% select(ends_with("a"))
```

```
## # A tibble: 1,854 × 3
##      c2a c17_1hensa  c15a
##    <dbl>      <dbl> <dbl>
##  1     2       68       1
##  2     1       43       2
##  3     2       56       3
##  4     3       39       4
##  5     1       59       1
##  6     1       58       2
##  7     2       41       4
##  8     2       46       3
##  9     1       35.5     3
## 10     2       46       2
## # ℹ 1,844 more rows
```


```r
d %>% select(matches("[ia]"))
```

```
## # A tibble: 1,854 × 4
##       id   c2a c17_1hensa  c15a
##    <dbl> <dbl>      <dbl> <dbl>
##  1     1     2       68       1
##  2     2     1       43       2
##  3     3     2       56       3
##  4     4     3       39       4
##  5     5     1       59       1
##  6     6     1       58       2
##  7     7     2       41       4
##  8     8     2       46       3
##  9     9     1       35.5     3
## 10    10     2       46       2
## # ℹ 1,844 more rows
```


### ケースを選択


```r
d %>% filter(c1_1 == 1)
```

```
## # A tibble: 912 × 9
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>
##  1     4     1     3     4     1     5     5       39       4
##  2     7     1     2     3     3     5     4       41       4
##  3     9     1     1     4     4     5     3       35.5     3
##  4    11     1     3     2     1    NA     3       40       3
##  5    12     1     1     4     2     5     2       52       1
##  6    13     1     1     5     5     5     2       45       3
##  7    14     1     1     5     4     5     1       61       1
##  8    16     1     1     2     3     4     2       44       3
##  9    19     1     1     5     4     5     2       58       1
## 10    21     1     2     1     1     2     4       68       1
## # ℹ 902 more rows
```

```r
d %>% filter(c1_1 != 1)
```

```
## # A tibble: 942 × 9
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>
##  1     1     2     2     3     3     3     2         68     1
##  2     2     2     1     4     3     5     3         43     2
##  3     3     2     2     4     2     5     4         56     3
##  4     5     2     1     5     4     5     2         59     1
##  5     6     2     1     2     3     5     2         58     2
##  6     8     2     2     2     2     3     3         46     3
##  7    10     2     2     3     3     5     2         46     2
##  8    15     2     2     4     3     4     3         63     2
##  9    17     2     3     2     2     3     3         NA     4
## 10    18     2     1     5     4     5     1         51     2
## # ℹ 932 more rows
```

```r
d %>% filter(c2a %in% c(1,2,3))
```

```
## # A tibble: 1,726 × 9
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
## # ℹ 1,716 more rows
```

```r
d %>% filter(!c2a %in% c(1,2,3))
```

```
## # A tibble: 128 × 9
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>
##  1    23     1     4     4     1     1     3         NA     5
##  2    31     2     4     1     1     1     2         45     5
##  3    36     1     4     2     2     3     4         NA     3
##  4    52     1     4     2     2     3     3         NA     5
##  5    60     1     5     5     1     2     1         63     1
##  6    82     2     4     3     3     3     5         NA     5
##  7    85     2     4     2     2     3     3         64     2
##  8    92     2     4     2     3     2     2         38     5
##  9   130     1     5     2     1     1     3         NA     5
## 10   138     1     4     4     1     3     4         54     2
## # ℹ 118 more rows
```

### 欠損値の削除


```r
d %>%
  drop_na(c2a)
```

```
## # A tibble: 1,849 × 9
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
## # ℹ 1,839 more rows
```

### 変数の追加


```r
d <- d %>% 
  mutate(random = runif(n = nrow(d)))
d
```

```
## # A tibble: 1,854 × 10
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a random
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>  <dbl>
##  1     1     2     2     3     3     3     2       68       1  0.766
##  2     2     2     1     4     3     5     3       43       2  0.450
##  3     3     2     2     4     2     5     4       56       3  0.658
##  4     4     1     3     4     1     5     5       39       4  0.378
##  5     5     2     1     5     4     5     2       59       1  0.202
##  6     6     2     1     2     3     5     2       58       2  0.169
##  7     7     1     2     3     3     5     4       41       4  0.755
##  8     8     2     2     2     2     3     3       46       3  0.609
##  9     9     1     1     4     4     5     3       35.5     3  0.272
## 10    10     2     2     3     3     5     2       46       2  0.707
## # ℹ 1,844 more rows
```

値を反転させた変数を作成する．頭に`re_``をつけている


```r
d <- d %>%
  mutate(
    re_c2a = 6 - c2a,
    re_c2b = 6 - c2b,
    re_c2c = 6 - c2c,
    re_c2d = 6 - c2d,
    re_c2e = 6 - c2e,
    school = re_c2a + c2b + c2c + c2d + re_c2e,
    school_dev = (school - mean(school, na.rm = TRUE)) / sd(school, na.rm = TRUE)
  )
d
```

```
## # A tibble: 1,854 × 17
##       id  c1_1   c2a   c2b   c2c   c2d   c2e c17_1hensa  c15a random re_c2a
##    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>      <dbl> <dbl>  <dbl>  <dbl>
##  1     1     2     2     3     3     3     2       68       1  0.766      4
##  2     2     2     1     4     3     5     3       43       2  0.450      5
##  3     3     2     2     4     2     5     4       56       3  0.658      4
##  4     4     1     3     4     1     5     5       39       4  0.378      3
##  5     5     2     1     5     4     5     2       59       1  0.202      5
##  6     6     2     1     2     3     5     2       58       2  0.169      5
##  7     7     1     2     3     3     5     4       41       4  0.755      4
##  8     8     2     2     2     2     3     3       46       3  0.609      4
##  9     9     1     1     4     4     5     3       35.5     3  0.272      5
## 10    10     2     2     3     3     5     2       46       2  0.707      4
## # ℹ 1,844 more rows
## # ℹ 6 more variables: re_c2b <dbl>, re_c2c <dbl>, re_c2d <dbl>, re_c2e <dbl>,
## #   school <dbl>, school_dev <dbl>
```



```r
d <- d %>%
  mutate(gender = case_when(c1_1 == 1 ~ "Men",
                            c1_1 == 2 ~ "Women",
                            TRUE ~ NA_character_))
```



### データの要約


```r
d %>% 
  summarise(mean_hensa = mean(c17_1hensa, na.rm = TRUE),
            median_hensa = median(c17_1hensa, na.rm = TRUE),
            sd_hensa = sd(c17_1hensa, na.rm = TRUE))
```

```
## # A tibble: 1 × 3
##   mean_hensa median_hensa sd_hensa
##        <dbl>        <dbl>    <dbl>
## 1       52.2           52     9.72
```


### グループ別の処理

グループ別に処理して，結果を求める．


```r
d %>% 
  group_by(gender) %>% 
  summarise(mean_school = mean(school, na.rm = TRUE))
```

```
## # A tibble: 2 × 2
##   gender mean_school
##   <chr>        <dbl>
## 1 Men           17.8
## 2 Women         18.4
```


グループ別に処理して，変数を追加する．ここでは男女別に`school`を求めて新たな変数`school_group_mn`を作成している．



```r
d <- d %>% 
  group_by(gender) %>% 
  mutate(school_group_mean = mean(school, na.rm = TRUE)) %>%
  ungroup()
```



```r
d <- d %>% 
  mutate(school_group_dev = school - school_group_mean)

d %>% select(gender, school, school_group_mean, school_group_dev)
```

```
## # A tibble: 1,854 × 4
##    gender school school_group_mean school_group_dev
##    <chr>   <dbl>             <dbl>            <dbl>
##  1 Women      17              18.4           -1.39 
##  2 Women      20              18.4            1.61 
##  3 Women      17              18.4           -1.39 
##  4 Men        14              17.8           -3.77 
##  5 Women      23              18.4            4.61 
##  6 Women      19              18.4            0.612
##  7 Men        17              17.8           -0.771
##  8 Women      14              18.4           -4.39 
##  9 Men        21              17.8            3.23 
## 10 Women      19              18.4            0.612
## # ℹ 1,844 more rows
```



### グループ化の解除




