\name{OptionsManager}
\alias{OptionsManager}
\alias{resetOptions}
\alias{resetOptions.default}
\alias{resetOptions.character}
\alias{updateOptions}
\alias{updateOptions.default}
\alias{updateOptions.character}
\alias{options.manager}
\alias{reset.options}
\title{ Futile options management }
\description{
  Included as part of futile is an options subsystem that facilitates the
  management of options for a particular application. The options.manager
  function produces a scoped options set within the environment, to protect
  against collisions with other libraries or applications. The options subsystem
  also provides default settings that can be restored by calling reset.options.
}
\usage{
OptionsManager(option.name, defaults = NULL)
\method{resetOptions}{default}(option.name, ...)
\method{resetOptions}{character}(option.name, ...)
\method{updateOptions}{default}(option.name, ...)
\method{updateOptions}{character}(option.name, key, value, ...)
options.manager(option.name, defaults = NULL)
reset.options(option.name, ...)
}
\arguments{
  \item{option.name}{ The namespace of the options set }
  \item{defaults}{ A list of default values to use for the new options manager }
  \item{key}{ A vector of keys in the options that need to be updated }
  \item{value}{ A vector of values that correspond to the keys above }
  \item{\dots}{ Option values to set after resetting }
}
\details{
  Using the options subsystem is simple. The first step is to create a specific
  options manager for a given namespace by using the 'OptionsManager' function.
  It is possible to specify some default values by passing a list to the default
  argument. This function returns a specialized function for managing options in
  the given namespace.

  With the new function, options can be set and accessed in an isolated 
  namespace. The options can also be reset using 'resetOptions' to the default
  values.

  Note that if multiple values are accessed, to support lists and other complex
  data structures, the output is a list. If a vector is preferred, pass
  simplify=TRUE as an argument to the user-defined options management function.

  Another arugment available in the resulting function is 'update', which allows
  specific values to be updated dynamically rather than via named key=value
  pairs. This is useful in certain situations but can be safely ignored for
  most situations.

  To reset options back to default settings, use the 'reset.options' function. 

  In certain cases, stored options may need to be set programattically, i.e.
  their name is constructed dynamically. When this occurs, use update.options to
  set the values.

  NOTE: The functions 'options.manager' and 'reset.options' are deprecated but
  still extant to maintain backwards compatibility. All futile libraries are 
  renamed to avoid naming collisions with S3 generics. Furthermore, any futile
  function that returns a function will be PascalCased, whereas all others will
  be camelCased. The dot notation is reserved strictly for S3 generics.
}
\value{
  The 'OptionsManager' function produces a custom function to manage options 
  for the specified namespace. Use this function to access and set options in
  your code.
}
\author{ Brian Lee Yung Rowe }
\examples{
  my.options <- OptionsManager('my.options', default=list(a=2,b=3))
  my.options(c=4,d='hello')
  my.options('b')
  my.options('c')

  resetOptions(my.options)
  my.options('c')

  updateOptions(my.options, paste('key',1,sep='.'), 10)
  my.options('key.1')
}
\keyword{ array }
