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
##  1     1     2     1     5     4     5     2       64.5     1
##  2     2     2     1     4     3     5     3       43       2
##  3     3     1     2     3     3     5     4       41       4
##  4     4     1     1     5     4     5     1       61       1
##  5     5     2     2     2     2     3     3       46       3
##  6     6     1     1     2     3     4     2       44       3
##  7     7     2     1     4     5     5     2       45       3
##  8     8     1     2     5     1     2     2       36       5
##  9     9     2     2     3     4     4     2       60       2
## 10    10     1     1     5     4     5     1       50       3
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
##  1     1     2     1     5     4     5     2       64.5     1
##  2     2     2     1     4     3     5     3       43       2
##  3     3     1     2     3     3     5     4       41       4
##  4     4     1     1     5     4     5     1       61       1
##  5     5     2     2     2     2     3     3       46       3
##  6     6     1     1     2     3     4     2       44       3
##  7     7     2     1     4     5     5     2       45       3
##  8     8     1     2     5     1     2     2       36       5
##  9     9     2     2     3     4     4     2       60       2
## 10    10     1     1     5     4     5     1       50       3
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
##  1     1  2 [女性] 1 [あてはま… 5 [あてはま… 4 [あまりあ… 5 [あては… 2 [まああ…       64.5 1 [上のほ…
##  2     2  2 [女性] 1 [あてはま… 4 [あまりあ… 3 [どちらと… 5 [あては… 3 [どちら…       43   2 [真ん中…
##  3     3  1 [男性] 2 [まああて… 3 [どちらと… 3 [どちらと… 5 [あては… 4 [あまり…       41   4 [真ん中…
##  4     4  1 [男性] 1 [あてはま… 5 [あてはま… 4 [あまりあ… 5 [あては… 1 [あては…       61   1 [上のほ…
##  5     5  2 [女性] 2 [まああて… 2 [まああて… 2 [まああて… 3 [どちら… 3 [どちら…       46   3 [真ん中…
##  6     6  1 [男性] 1 [あてはま… 2 [まああて… 3 [どちらと… 4 [あまり… 2 [まああ…       44   3 [真ん中…
##  7     7  2 [女性] 1 [あてはま… 4 [あまりあ… 5 [あてはま… 5 [あては… 2 [まああ…       45   3 [真ん中…
##  8     8  1 [男性] 2 [まああて… 5 [あてはま… 1 [あてはま… 2 [まああ… 2 [まああ…       36   5 [下のほ…
##  9     9  2 [女性] 2 [まああて… 3 [どちらと… 4 [あまりあ… 4 [あまり… 2 [まああ…       60   2 [真ん中…
## 10    10  1 [男性] 1 [あてはま… 5 [あてはま… 4 [あまりあ… 5 [あては… 1 [あては…       50   3 [真ん中…
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
##  1     1     2     1     5     4     5     2       64.5     1
##  2     2     2     1     4     3     5     3       43       2
##  3     3     1     2     3     3     5     4       41       4
##  4     4     1     1     5     4     5     1       61       1
##  5     5     2     2     2     2     3     3       46       3
##  6     6     1     1     2     3     4     2       44       3
##  7     7     2     1     4     5     5     2       45       3
##  8     8     1     2     5     1     2     2       36       5
##  9     9     2     2     3     4     4     2       60       2
## 10    10     1     1     5     4     5     1       50       3
## # … with 1,844 more rows
```




