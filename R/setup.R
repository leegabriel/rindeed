#' Setup
#' 
#' Setup scrape
#' 
#' @param base.url base url to scrape from, see details
#' @param country country of base url, see details
#' 
#' @details 
#' One MUST specify \code{base.url} OR \code{country}, if the latter is given 
#' the function looks for the respective \code{base.url} (subdomain) 
#' of the given country.
#' 
#' Valid values for \code{country}:
#' \itemize{
#'  \item{argentina}
#'  \item{australia}
#'  \item{austria}
#'  \item{belgium - dutch}
#'  \item{belgium - french}
#'  \item{brazil}
#'  \item{canada - english}
#'  \item{canada - french}
#'  \item{chile}
#'  \item{china}
#'  \item{colombia}
#'  \item{denmark}
#'  \item{france}
#'  \item{germany}
#'  \item{hong kong}
#'  \item{india}
#'  \item{ireland}
#'  \item{israel}
#'  \item{italy}
#'  \item{japan}
#'  \item{mexico}
#'  \item{netherlands}
#'  \item{new zealand}
#'  \item{norway}
#'  \item{poland}
#'  \item{portugal}
#'  \item{russia}
#'  \item{singapore}
#'  \item{south africa}
#'  \item{south korea}
#'  \item{spain}
#'  \item{sweden}
#'  \item{switzerland - french}
#'  \item{switzerland - german}
#'  \item{turkey}
#'  \item{uae}
#'  \item{uk}
#'  \item{us}
#' }
#' 
#' @examples 
#' in_setup(base.url = "http://www.indeed.com")
#' in_setup(country = "us")
#' 
#' @author John Coene \email{jcoenep@gmail.com}
#' 
#' @export
in_setup <- function(base.url = NULL, country = NULL){
  
  df <- url_country_match(base.url, country)
  
  options(base.url = df$base.url,
          country = df$country)
}

#' Retrieve settings
#' 
#' Rerieve settings set with \code{\link{in_setup}}
#' 
#' @return Returns data.frame of settings:
#' \itemize{
#'  \item base.url
#'  \item country
#' }
#' 
#' @examples
#' in_setup(country = "us") 
#' (my_settings <- in_settings())
#' 
#' @author John Coene \email{jcoenep@gmail.com}
#' 
#' @export
in_settings <- function(){
  base.url <- tryCatch({getOption("base.url")},
                       error = function(e) e)
  
  country <- tryCatch({getOption("country")},
                      error = function(e) e)
  
  if(is(country, "error") || is(base.url, "error")) stop("no settings")
  
  set = data.frame(base.url = base.url,
                   country = country)
  return(set)
}