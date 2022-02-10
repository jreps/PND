#' Apply the five different models (that predict risk of depression at week 12-13 of pregnancy, week 21 of pregnancy, week 32 of pregnancy, week 4 after delivery and week 12 after delivery)
#'
#' @details
#' This function will take as input the data for a new patient taken at week 4-10 of pregnacy, and return the 
#' five predicted risk (in %) per future time period.
#'
#' @param data   A list containing the survey response inputs taken at week 4 to 10 of pregnancy for a pregnant women 
#' @export
applyPNDModels <- function(data){
  
  models <- loadModels()
  
  pred <- list()
  length(pred) <- 5
  for(i in 1:5){
    
    pred[[i]] <- round(100*predict(models[[i]]$model, 
                                   t(as.matrix(as.double(unlist(data))))), digits = 2)
  }
  
  values <- unlist(pred)
  names(values) <- names(models)
  
  writeLines('Warning: The five models have not been externally validated, so model generalizability has not been explored.')
  
  for(i in 1:length(values)){
  writeLines(
    paste0(
    'The model calculated a risk of PND during ', 
    names(values)[i],
    ' of ',
    round(values[i], digits = 2), 
    '%'
    )
    )
  }
  
  return(invisible(values))
}

loadModels <- function(){
  
  pathTopModels <- system.file("models", package = "PND")
  
  models <- list()
  length(models) <- 5
  for(i in 1:5){
    models[[i]]$model <- xgboost::xgb.load(file.path(pathTopModels, paste0('F', i, '_model')))
  }
  
  names(models) <- c(
    'Trimester 1 risk at weeks 12 or 13 of pregnancy',
    'Trimester 2 risk at week 21 of pregnancy',
    'Trimester 3 risk at week 32 of pregnancy',
    'After delivery risk 1 at week 4 after delivery',
    'After delivery risk 2 at week 12 after delivery'
    )

return(models)
}




