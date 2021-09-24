# 有向非巡回グラフ（DAG） {#DAG}


```r
library(dagitty)
library(lavaan)
```

```
## This is lavaan 0.6-9
## lavaan is FREE software! Please report any bugs.
```



```r
g <- dagitty('dag{
  x [pos="0,1"]
  y [pos="1,1"]
  x -> y
 }')
plot(g)
```

<img src="08-DAG_files/figure-html/unnamed-chunk-2-1.png" width="672" />

## Confounder


```r
g <- dagitty('dag{
  x [pos="0,1"]
  y [pos="1,1"]
  z [pos="0.5,0"]
  x -> y ; x <- z -> y
  }')
plot(g)
```

<img src="08-DAG_files/figure-html/unnamed-chunk-3-1.png" width="672" />


## Mediator



```r
g <- dagitty('dag{
  x [pos="0,1"]
  y [pos="1,1"]
  z [pos="0.5,0"]
  x -> y;
  x -> z -> y
  }')
plot(g)
```

<img src="08-DAG_files/figure-html/unnamed-chunk-4-1.png" width="672" />


## Collidar


```r
g <- dagitty('dag{
  x [pos="0,1"]
  y [pos="1,1"]
  z [pos="0.5,0"]
  x -> y;
  x -> z <- y
  }')
plot(g)
```

<img src="08-DAG_files/figure-html/unnamed-chunk-5-1.png" width="672" />

