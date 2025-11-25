# 回帰分析 {#regression}






``` r
library(tidyverse)
d_csv <- read_csv("data/example_7.csv")
d_csv
```

```
## # A tibble: 1,854 × 6
##       id  c1_1  c15a   c19 m25m_b m25f_b
##    <dbl> <dbl> <dbl> <dbl>  <dbl>  <dbl>
##  1     1     2     3     2      3      4
##  2     2     2     5     6      4      4
##  3     3     2     2     6      7      7
##  4     4     1     3     3      3      6
##  5     5     2     1     6      5      4
##  6     6     2     1     6      7      7
##  7     7     2     1     6      7      7
##  8     8     1     5     2      6      1
##  9     9     1     3     7      3      5
## 10    10     1     4     6      4      3
## # ℹ 1,844 more rows
```



``` r
library(car)
d <- d_csv %>%
  mutate(gender = factor(c1_1, 
                         levels = 1:2,
                         labels = c("Men","Women")),
         grade = 5 - c15a,
         asp = car::recode(c19, "1=9;2=12;3:5=14;6=16;7=18;else=NA"),
         medu = car::recode(m25m_b, "1:3=1;4:6=2;7:8=3;else=NA"),
         medu = factor(medu, 
                       levels = 1:3, 
                       labels = c("JH/HS","JC/PTC","Univ")),
         fedu = car::recode(m25f_b, "1:3=1;4:6=2;7:8=3;else=NA"),
         fedu = factor(fedu, 
                       levels = 1:3, 
                       labels = c("JH/HS","JC/PTC","Univ")),
  ) %>%
  select(id, gender, grade, asp, medu, fedu)
d
```

```
## # A tibble: 1,854 × 6
##       id gender grade   asp medu   fedu  
##    <dbl> <fct>  <dbl> <dbl> <fct>  <fct> 
##  1     1 Women      2    12 JH/HS  JC/PTC
##  2     2 Women      0    16 JC/PTC JC/PTC
##  3     3 Women      3    16 Univ   Univ  
##  4     4 Men        2    14 JH/HS  JC/PTC
##  5     5 Women      4    16 JC/PTC JC/PTC
##  6     6 Women      4    16 Univ   Univ  
##  7     7 Women      4    16 Univ   Univ  
##  8     8 Men        0    12 JC/PTC JH/HS 
##  9     9 Men        2    18 JH/HS  JC/PTC
## 10    10 Men        1    16 JC/PTC JH/HS 
## # ℹ 1,844 more rows
```


``` r
fit_1 <- lm(asp ~ grade, data = d)
fit_1
```

```
## 
## Call:
## lm(formula = asp ~ grade, data = d)
## 
## Coefficients:
## (Intercept)        grade  
##     13.7511       0.5791
```

``` r
summary(fit_1)
```

```
## 
## Call:
## lm(formula = asp ~ grade, data = d)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -7.0675 -0.9093  0.2489  1.0907  4.2489 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 13.75111    0.07608   180.7   <2e-16 ***
## grade        0.57908    0.02811    20.6   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.424 on 1703 degrees of freedom
##   (149 observations deleted due to missingness)
## Multiple R-squared:  0.1995,	Adjusted R-squared:  0.1991 
## F-statistic: 424.5 on 1 and 1703 DF,  p-value: < 2.2e-16
```


``` r
fit_2 <- lm(asp ~ grade + gender, data = d)
fit_2
```

```
## 
## Call:
## lm(formula = asp ~ grade + gender, data = d)
## 
## Coefficients:
## (Intercept)        grade  genderWomen  
##    13.79135      0.57930     -0.07985
```

``` r
summary(fit_2)
```

```
## 
## Call:
## lm(formula = asp ~ grade + gender, data = d)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -7.1085 -0.8701  0.2885  1.0501  4.2087 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 13.79135    0.08363 164.906   <2e-16 ***
## grade        0.57930    0.02810  20.612   <2e-16 ***
## genderWomen -0.07985    0.06896  -1.158    0.247    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.423 on 1702 degrees of freedom
##   (149 observations deleted due to missingness)
## Multiple R-squared:  0.2002,	Adjusted R-squared:  0.1992 
## F-statistic:   213 on 2 and 1702 DF,  p-value: < 2.2e-16
```



``` r
fit_3 <- lm(asp ~ grade + gender + medu + fedu, data = d)
fit_3
```

```
## 
## Call:
## lm(formula = asp ~ grade + gender + medu + fedu, data = d)
## 
## Coefficients:
## (Intercept)        grade  genderWomen   meduJC/PTC     meduUniv   feduJC/PTC  
##    13.43958      0.47091     -0.07259      0.51902      0.74786      0.10193  
##    feduUniv  
##     0.52770
```

``` r
summary(fit_3)
```

```
## 
## Call:
## lm(formula = asp ~ grade + gender + medu + fedu, data = d)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -6.3232 -0.5988  0.1491  0.9977  4.1621 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 13.43958    0.09077 148.068  < 2e-16 ***
## grade        0.47091    0.02845  16.554  < 2e-16 ***
## genderWomen -0.07259    0.06681  -1.087    0.277    
## meduJC/PTC   0.51902    0.07633   6.799 1.47e-11 ***
## meduUniv     0.74786    0.11000   6.799 1.47e-11 ***
## feduJC/PTC   0.10193    0.10081   1.011    0.312    
## feduUniv     0.52770    0.08054   6.552 7.59e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.353 on 1641 degrees of freedom
##   (206 observations deleted due to missingness)
## Multiple R-squared:  0.2681,	Adjusted R-squared:  0.2654 
## F-statistic: 100.2 on 6 and 1641 DF,  p-value: < 2.2e-16
```



``` r
library(stargazer)
stargazer(fit_1, fit_2, fit_3, type = "text",
          no.space = TRUE)
```

```
## 
## =================================================================================================
##                                                  Dependent variable:                             
##                     -----------------------------------------------------------------------------
##                                                          asp                                     
##                                (1)                       (2)                       (3)           
## -------------------------------------------------------------------------------------------------
## grade                       0.579***                  0.579***                  0.471***         
##                              (0.028)                   (0.028)                   (0.028)         
## genderWomen                                            -0.080                    -0.073          
##                                                        (0.069)                   (0.067)         
## meduJC/PTC                                                                      0.519***         
##                                                                                  (0.076)         
## meduUniv                                                                        0.748***         
##                                                                                  (0.110)         
## feduJC/PTC                                                                        0.102          
##                                                                                  (0.101)         
## feduUniv                                                                        0.528***         
##                                                                                  (0.081)         
## Constant                    13.751***                 13.791***                 13.440***        
##                              (0.076)                   (0.084)                   (0.091)         
## -------------------------------------------------------------------------------------------------
## Observations                  1,705                     1,705                     1,648          
## R2                            0.200                     0.200                     0.268          
## Adjusted R2                   0.199                     0.199                     0.265          
## Residual Std. Error     1.424 (df = 1703)         1.423 (df = 1702)         1.353 (df = 1641)    
## F Statistic         424.491*** (df = 1; 1703) 212.958*** (df = 2; 1702) 100.182*** (df = 6; 1641)
## =================================================================================================
## Note:                                                                 *p<0.1; **p<0.05; ***p<0.01
```


サンプルサイズが揃っていない．



``` r
library(estimatr)
```

