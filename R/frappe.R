#' frappe
#'
#' Basic frappe chart
#'
#' @import htmlwidgets
#'
#' @export
frappe <- function(data, labels,  type = c('bar', 'line', 'pie', 'donut', 'percentage'), ..., width = NULL, height = NULL, elementId = NULL) {

  type <- match.arg(type)

  # forward options using x
  x = list(
    data = data,
    labels = labels,
    type = type,
    options = list(...)
  )


  # create widget
  htmlwidgets::createWidget(
    name = 'frappe',
    x,
    width = width,
    height = height,
    package = 'frappe',
    elementId = elementId
  )
}

#' Shiny bindings for frappe
#'
#' Output and render functions for using frappe within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a frappe
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name frappe-shiny
#'
#' @export
frappeOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'frappe', width, height, package = 'frappe')
}

#' @rdname frappe-shiny
#' @export
renderFrappe <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, frappeOutput, env, quoted = TRUE)
}

#
# df_eg <- data.frame(labels = seq(2000,2010,1),
#                     values = round(cumsum(rnorm(11)),2))
#
# frappe(data = df_eg$values,
#        labels = df_eg$labels,
#        type = "line",
#        colors = c('green','red','yellow'),
#        title = "National Sales Data: 2000-2010",
#        seriesname = "National Sales"
# )
