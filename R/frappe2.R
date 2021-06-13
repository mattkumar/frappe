#' frappe2
#'
#' Frappe for 2 data sets
#'
#' @import htmlwidgets
#'
#' @export
frappe2 <- function(data1,
                     data2,

                     labels,
                     type1 = c('bar', 'line'),
                     type2 = c('bar', 'line'),
                     ...,
                     heat,
                     shade,
                     spline,
                     width = NULL,
                     height = NULL,
                     elementId = NULL) {

  type1 <- match.arg(type1)
  type2 <- match.arg(type2)

  # forward options using x
  x = list(
    data1 = data1,
    data2 = data2,
    labels = labels,
    heat = heat,
    shade = shade,
    spline = spline,
    type1 = type1,
    type2 = type2,
    options = list(...)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'frappe2',
    x,
    width = width,
    height = height,
    package = 'frappe',
    elementId = elementId
  )
}

#' Shiny bindings for frappe2
#'
#' Output and render functions for using frappe2 within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a frappe2
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name frappe2-shiny
#'
#' @export
frappe2Output <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'frappe2', width, height, package = 'frappe')
}

#' @rdname frappe2-shiny
#' @export
renderFrappe2 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, frappe2Output, env, quoted = TRUE)
}
