#' mixfraps
#'
#' Frappe for 3 groups
#'
#' @import htmlwidgets
#'
#' @export
mixfraps <- function(data1,
                     data2,
                     data3,
                     labels,
                     type1 = c('bar', 'line'),
                     type2 = c('bar', 'line'),
                     type3 = c('bar', 'line'),
                     ...,
                     width = NULL,
                     height = NULL,
                     elementId = NULL) {

  type1 <- match.arg(type1)
  type2 <- match.arg(type2)
  type3 <- match.arg(type3)

  # forward options using x
  x = list(
    data1 = data1,
    data2 = data2,
    data3 = data3,
    labels = labels,
    type1 = type1,
    type2 = type2,
    type3 = type3,
    options = list(...)
  )


  # create widget
  htmlwidgets::createWidget(
    name = 'mixfraps',
    x,
    width = width,
    height = height,
    package = 'frappe',
    elementId = elementId
  )
}

#' Shiny bindings for mixfraps
#'
#' Output and render functions for using mixfraps within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a mixfraps
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name mixfraps-shiny
#'
#' @export
mixfrapsOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'mixfraps', width, height, package = 'frappe')
}

#' @rdname mixfraps-shiny
#' @export
renderMixfraps <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, mixfrapsOutput, env, quoted = TRUE)
}
