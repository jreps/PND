# PND
This package contains the five models described in [Development of multivariable models to predict perinatal depression before and after delivery using patient reported survey responses at weeks 4-10 of pregnancy](https://www.researchsquare.com/article/rs-757801/v1) 

In the study the authors used survey responses answered during week 4 to week 10 of pregnancy to developed five models that predict risk of developing depression at five different time points (at week 12/13 of pregnancy, at week 21 of pregnancy, at week 32 of pregnancy, 4 weeks after delivery and 12 weeks after delivery).

# Installing the package

The package uses the R library xgboost, so the models require the user to have xgboost installed. To install the PND package run the following code:

```r
install.packages('devtools')
devtools::install_githut('jreps/PND')
```

# Applying the models

For example, below we demonstrate how to use the package to calculate the risks for the five different time points.  If a women who was 6 weeks pregnant answers 1 to all the survey responses, then her risks could calculated by running the following code:

```r

library(PND)
data <- list(EPDS_B_1 = 1,
             EPDS_B_2 = 1,
             EPDS_B_3 = 1,
             EPDS_B_4 = 1,
             EPDS_B_5 = 1,
             EPDS_B_6 = 1,
             EPDS_B_7 = 1,
             EPDS_B_8 = 1,
             EPDS_B_9 = 1,
             GAD_B_1 = 1,
             GAD_B_2 = 1,
             GAD_B_3 = 1,
             GAD_B_4 = 1,
             GAD_B_5 = 1,
             GAD_B_6 = 1,
             GAD_B_7 = 1,
             GAD_B_8 = 1,
             PR_ES_B_1 = 1,
             PR_ES_B_2 = 1,
             PR_ES_B_3 = 1,
             PR_ES_B_4 = 1
)
applyPNDModels(data)

```