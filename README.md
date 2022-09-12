
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epu

<!-- badges: start -->
<!-- badges: end -->

The goal of `epu` is to provide easily extraction of EPU data sets from
<https://www.policyuncertainty.com>

## Installation

You can install the development version of `epu` like so:

``` r
# install.packages("devtools")
devtools::install_github("saulobarrosm/epu")
```

## Example

You can extract EPU indices by get_XXX() functions. For example, to get
the EPU indices of several countries, use get_EPU():

``` r
library(epu)
## get EPU data
epu_data <- get_EPU()
```
