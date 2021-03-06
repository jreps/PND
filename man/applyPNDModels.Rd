% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code_to_run.R
\name{applyPNDModels}
\alias{applyPNDModels}
\title{Apply the five different models (that predict risk of depression at week 12-13 of pregnancy, week 21 of pregnancy, week 32 of pregnancy, week 4 after delivery and week 12 after delivery)}
\usage{
applyPNDModels(data)
}
\arguments{
\item{data}{A list containing the survey response inputs taken at week 4 to 10 of pregnancy for a pregnant women}
}
\description{
Apply the five different models (that predict risk of depression at week 12-13 of pregnancy, week 21 of pregnancy, week 32 of pregnancy, week 4 after delivery and week 12 after delivery)
}
\details{
This function will take as input the data for a new patient taken at week 4-10 of pregnacy, and return the 
five predicted risk (in %) per future time period.
}
