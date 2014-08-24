---
title       : Developing Data Products
subtitle    : Reproducible Pitch
author      : Ronald Broberg
job         : Global Warmer
framework   : html5slides   # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Read-And-Delete

1. Edit YAML front matter
2. Write using R Markdown
3. Use an empty line followed by three dashes to separate slides!

## Normal Distribution

The normal (or Gaussian) distribution is defined as follows:

$$latex
f(x;\mu,\sigma^2) = \frac{1}{\sigma\sqrt{2\pi}} 
e^{ -\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2 }
$$

---

## Density Plot

To generate random draws from a normal distribution we use the **rnorm** function:


```r
output <- rnorm(1000, 100, 15);
```

---

## Bell Shape

The normal distribution has the typical bell shape:


```r
library(ggplot2)
qplot(output)
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk block2](assets/fig/block2.png) 

---

## Kernel density estimation

We can perform density estimation on the sample:


```r
plot(density(output))
```

![plot of chunk block3](assets/fig/block3.png) 

---

## Carl Friedrich Gauß

This little guy had something to do with it

!['Gauss'](http://goo.gl/ZwTTXv)
