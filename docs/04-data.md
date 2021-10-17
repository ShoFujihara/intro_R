# データの読み込み {#data}


## 様々な形式のデータの読み込み
### csvデータの読み込み

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
## # … with 1,844 more rows
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
## # … with 1,844 more rows
```

## データの確認



```r
d <- read_csv("data/example_1.csv")
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
## # … with 1,844 more rows
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


## データの加工と集計

データの加工と集計で主に使用するのは次の関数である．



```r
関数 <- c("select", "filter", "drop_na", "mutate", "summarise", "group_by","ungroup")
目的 <- c("変数を選択", "ケースを選択", "欠損値の削除", "変数の追加", "データの要約","グループ別の処理","グループ化の解除")
例 <- c("`d %>% select(var1, var2)`",
       "`d %>% filter(var1 >= 5)`",
       "`d %>% drop_na(var1, var2)`",
       "`d <- d %>% mutate(var3 = var1 + var2)`",
       "`d %>% summarise(Mean = mean(var1))`",
       "`d %>% group_by(group) %>% summarise(Median = median(var1))`",
       "`d %>% group_by(group) %>% summarise(Median = median(var1)) %>% ungroup()`")
tibble(関数,目的,例) %>% 
  knitr::kable()
```



|関数      |目的             |例                                                                         |
|:---------|:----------------|:--------------------------------------------------------------------------|
|select    |変数を選択       |`d %>% select(var1, var2)`                                                 |
|filter    |ケースを選択     |`d %>% filter(var1 >= 5)`                                                  |
|drop_na   |欠損値の削除     |`d %>% drop_na(var1, var2)`                                                |
|mutate    |変数の追加       |`d <- d %>% mutate(var3 = var1 + var2)`                                    |
|summarise |データの要約     |`d %>% summarise(Mean = mean(var1))`                                       |
|group_by  |グループ別の処理 |`d %>% group_by(group) %>% summarise(Median = median(var1))`               |
|ungroup   |グループ化の解除 |`d %>% group_by(group) %>% summarise(Median = median(var1)) %>% ungroup()` |


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
## # … with 1,844 more rows
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
## # … with 1,844 more rows
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
## # … with 1,844 more rows
```


### ケースを選択


### 欠損値の削除

### 変数の追加

### データの要約

### グループ別の処理

### グループ化の解除




