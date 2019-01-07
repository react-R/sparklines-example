#' @export
curve <- function(...) {
  reactR::React$SparklinesCurve(...)
}

#' @export
spots <- function(...) {
  reactR::React$SparklinesSpots(...)
}

#' @export
reference_line <- function(...) {
  reactR::React$SparklinesReferenceLine(...)
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
sparklines <- function(data, ...) {
  htmlwidgets::createWidget(
    'sparklines',
    reactR::reactData(reactR::component("Sparklines", c(list(data = data, ...)))),
    width = NULL,
    height = NULL,
    package = 'sparklines',
    elementId = NULL
  )
}

#' Shiny bindings for sparklines
#'
#' Output and render functions for using sparklines within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a sparklines
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name sparklines
#'
#' @export
sparklinesOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'sparklines', width, height, package = 'sparklines')
}

#' @rdname sparklines
#' @export
renderSparklines <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sparklinesOutput, env, quoted = TRUE)
}

# Magical
sparklines_html <- function(id, style, class, ...) {
  tagList(
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    tags$span(id = id, class = class)
  )
}
