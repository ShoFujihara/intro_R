# Rの基礎 {#basic}


## 四則演算


```r
# 足し算
1 + 2
```

```
## [1] 3
```

```r
# 引き算
1 - 2
```

```
## [1] -1
```

```r
# 掛け算
1 * 2
```

```
## [1] 2
```

```r
# 割り算
1 / 2
```

```
## [1] 0.5
```


## ベクトル


```r
# 1と3と5
c(1,3,5)
```

```
## [1] 1 3 5
```

```r
# -1と3と-5
c(-1,3,-5)
```

```
## [1] -1  3 -5
```







```r
x <- 1:10
y <- letters[1:10]
```



```r
df <- data.frame(x,y)
df
```

```
##     x y
## 1   1 a
## 2   2 b
## 3   3 c
## 4   4 d
## 5   5 e
## 6   6 f
## 7   7 g
## 8   8 h
## 9   9 i
## 10 10 j
```



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
df_tbl <- tibble(df)
df_tbl
```

```
## # A tibble: 10 × 2
##        x y    
##    <int> <chr>
##  1     1 a    
##  2     2 b    
##  3     3 c    
##  4     4 d    
##  5     5 e    
##  6     6 f    
##  7     7 g    
##  8     8 h    
##  9     9 i    
## 10    10 j
```


## 変数の加工



```r
a <- 1:100
```


