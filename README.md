# PND
This package contains the five models described in [Development of multivariable models to predict perinatal depression before and after delivery using patient reported survey responses at weeks 4-10 of pregnancy](https://www.researchsquare.com/article/rs-757801/v1) 

In the study the authors used survey responses answered during week 4 to week 10 of pregnancy to developed five models that predict risk of developing depression at five different time points (at week 12/13 of pregnancy, at week 21 of pregnancy, at week 32 of pregnancy, 4 weeks after delivery and 12 weeks after delivery).

Our models are free to use.

# Installing the package

The package uses the R library xgboost, so the models require the user to have xgboost installed. To install the PND package run the following code:

```r
install.packages('devtools')
devtools::install_github('jreps/PND')
```

# Applying the models

## Predictors
The predictors for the model should be collected between week 4 to week 10 of pregnancy of women who are pregnant.  

The predictors consist of:

- The EPDS survey as detailed in: Cox, J.L., Holden, J.M. and Sagovsky, R. 1987. Detection of postnatal depression: Development of the 10-item Edinburgh Postnatal Depression Scale. British Journal of Psychiatry, 150, pp.782-786.

- The GAD survey as detailed in: Spitzer, R.L., Kroenke, K., Williams, J.B. and Löwe, B., 2006. A brief measure for assessing generalized anxiety disorder: the GAD-7. Archives of internal medicine, 166(10), pp.1092-1097.

- The PROMIS survey as detailed in: PROMIS Item Bank v2.0, Emotional Support Short Form 4a. Retrieved from http://www.healthmeasures.net/administrator/components/com_instruments/uploads/PROMIS SF v2.0 - Emotional Support 4a 6-23-2016.pdf [Google Scholar]

### EPDS answers to input values
Variable: **epds_b_1** corresponds to the question "I have been able to laugh and see the funny side of things:". 

- 'As much as I always could' = 1
- 'Not quite so much now' = 2
- 'Definitely not so much now' = 3
- 'Not at all' = 4
                   
Variable: **epds_b_2** corresponds to the question "I have looked forward with enjoyment to things:". 

- 'As much as I ever did' = 1
- 'Rather less than I used to' = 2
- 'Definitely less than I used to' = 3
- 'Hardly at all' = 4

Variable: **epds_b_3** corresponds to the question "I have blamed myself unnecessarily when things went wrong:".

- 'Yes, most of the time'  = 4
- 'Yes, some of the time'  = 3
- 'Not very often' = 2
- 'No, never' = 1

Variable: **epds_b_4** corresponds to the question "I have been anxious or worried for no good reason:".  

- 'No, not at all'  = 1
- 'Hardly ever'  = 2
- 'Yes, sometimes'  = 3
- 'Yes, very often'  = 4

Variable: **epds_b_5** corresponds to the question "I have felt scared or panicky for no very good reason:".  

- 'Yes, quite a lot'  = 4
- 'Yes, sometimes'  = 3
- 'No, not much'  = 2
- 'No, not at all'  = 1

Variable: **epds_b_6** corresponds to the question "Things have been getting on top of me:". 

- 'Yes, most of the time I haven’t been able to cope at all'  = 4
- 'Yes, sometimes I haven’t been coping as well as usual'  = 3
- 'No, most of the time I have coped quite well'  = 2
- 'No, I have been coping as well as ever'  = 1

Variable: **epds_b_7** corresponds to the question "I have been so unhappy that I have had difficulty sleeping:". 

- 'Yes, most of the time'  = 4,
- 'Yes, sometimes'  = 3
- 'Not very often'  = 2
- 'No, not at all'  = 1

Variable: **epds_b_8** corresponds to the question "I have felt sad or miserable:". 

- 'Yes, most of the time'  = 4,
- 'Yes, quite often'  = 3
- 'Not very often'  = 2
- 'No, not at all'  = 1

Variable: **epds_b_9** corresponds to the question "I have been so unhappy that I have been crying:". 

- 'Yes, most of the time'  = 4
- 'Yes, quite often'  = 3
- 'Only occasionally'  = 2
- 'No, never'  = 1

### GAD answers to input

Require permission from GAD authors to show questions.  The answers to values are:

- 'Not at all' = 1
- 'Several days' = 2
- 'More than half the days' = 3
- 'Nearly every day' = 4

### PRES answers to input

How often have you felt the sentiment stated in each of the sentences below?

Variable: **pr_es_b_1** corresponds to the question "I have someone who will listen to me when I need to talk:". 

- 'Never' = 1
- 'Rarely' = 2
- 'Sometimes' = 3
- 'Often' = 4
- 'Always' = 5

Variable: **pr_es_b_2** corresponds to the question "I have someone to confide in or talk to about myself or my problems:". 

- 'Never' = 1
- 'Rarely' = 2
- 'Sometimes' = 3
- 'Often' = 4
- 'Always' = 5


Variable: **pr_es_b_3** corresponds to the question "I have someone who makes me feel appreciated:". 

- 'Never' = 1
- 'Rarely' = 2
- 'Sometimes' = 3
- 'Often' = 4
- 'Always' = 5                                                                  
 
Variable: **pr_es_b_4** corresponds to the question "I have someone to talk with when I have a bad day:".                                                   
- 'Never' = 1
- 'Rarely' = 2
- 'Sometimes' = 3
- 'Often' = 4
- 'Always' = 5 
                                                                    
## Example

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