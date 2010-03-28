\name{options.manager}
\alias{options.manager}
\alias{reset.options}
\alias{reset.options.default}
\alias{reset.options.character}
\title{ Futile options management }
\description{
  Included as part of futile is an options subsystem that facilitates the
  management of options for a particular application. The options.manager
  function produces a scoped options set within the environment, to protect
  against collisions with other libraries or applications. The options subsystem
  also provides default settings that can be restored by calling reset.options.
}
\usage{
options.manager(option.name, defaults = NULL)
\method{reset.options}{default}(option.name, ...)
\method{reset.options}{character}(option.name, ...)
}
\arguments{
  \item{option.name}{ The namespace of the options set }
  \item{defaults}{ A list of default values to use for the new options manager }
  \item{\dots}{ Option values to set after resetting }
}
\details{
  Using the options subsystem is simple. The first step is to create a specific
  options manager for a given namespace by using the 'options.manager' function.
  It is possible to specify some default values by passing a list to the default
  argument. This function returns a specialized function for managing options in
  the given namespace.

  With the new function, options can be set and accessed in an isolated 
  namespace. The options can also be reset using reset.options to the default
  values.

  Note that if multiple values are accessed, to support lists and other complex
  data structures, the output is a list. If a vector is preferred, pass
  simplify=TRUE as an argument to the user-defined options management function.

  To reset options back to default settings, use the reset.options function. 
}
\value{
  The 'options.manager' function produces a custom function to manage options 
  for the specified namespace. Use this function to access and set options in
  your code.
}
\author{ Brian Lee Yung Rowe }
\examples{
  my.options <- options.manager('my.options', default=list(a=2,b=3))
  my.options(c=4,d='hello')
  my.options('b')
  my.options('c')

  reset.options(my.options)
  my.options('c')
}
\keyword{ array }
