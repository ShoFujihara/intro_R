# 基本的な統計 {#basicstatistics}



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



```r
mean(d$c17_1hensa)
```

```
## [1] NA
```

