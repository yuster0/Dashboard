getFinalAndDiff <- function(vector) {
  index <- length(vector)
  return(list("final" = vector[index], "diff" = vector[index] - vector[index - 1]))
}

getFileUpdateTime <- function(file) {
  fileUpdateTime <- file.info(file)$mtime
  latestUpdateDuration <- difftime(Sys.time(), fileUpdateTime)
  return(paste0(round(latestUpdateDuration[[1]], 0)
   
  ))
}

convertUnit2Ja <- function(x) {
  x <- as.character(units(x))
  if (x == "secs") {
  } else if (x == "mins") {
  } else if (x == "hours") {
  } else if (x == "days") {
  } else if (x == "weeks") {
  } else {
    return(paste(x, "ago"))
  }
}

getChangeIcon <- function(number) {
  if (number > 0) {
    return(icon("fa fa-caret-up"))
  } else if (number < 0) {
    return(icon("fa fa-caret-down"))
  } else {
    return(icon("fa fa-lock"))
  }
}

getChangeIcon_ <- function(number) {
  if (number > 0) {
    return(icon("caret-up"))
  } else if (number < 0) {
    return(icon("caret-down"))
  } else {
    return(icon("lock"))
  }
}

getChangeIconWrapper <- function(number, type = "icon") {
  if (type == "icon") {
    return(getChangeIcon_(number))
  } else {
    return(getChangeIcon(number))
  }
}

getDiffValueAndSign <- function(number) {
  if (number >= 0) {
    return(paste0("+", number))
  } else {
    return(number)
  }
}

generateColorStyle <- function(data, colors, by) {
  breaks <- seq(0, max(ifelse(is.na(data), 0, data), na.rm = T), by = by)
  colorPanel <- colorRampPalette(colors)(length(breaks) + 1)
  return(list(cuts = breaks, values = colorPanel))
}
