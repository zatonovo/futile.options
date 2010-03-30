\name{futile.options-package}
\alias{futile.options-package}
\alias{futile.options}
\docType{package}
\title{
  A scoped options management framework
}
\description{
  The 'futile.options' subsystem provides an easy user-defined options 
  management system that is properly scoped. This means that options created
  via 'futile.options' are fully self-contained and will not collide with 
  options defined in other packages. This package is a self-contained package
  within the futile suite of libraries.
}
\details{
\tabular{ll}{
Package: \tab futile.options\cr
Type: \tab Package\cr
Version: \tab {version}\cr
Date: \tab {date}\cr
License: \tab LGPL-3\cr
LazyLoad: \tab yes\cr
}
  While R provides a useful mechanism for storing and retrieving options, there
  is a danger that variable names collide with names defined by a package that
  a user's code depends. These types of errors are difficult to detect and
  should be avoided. Using 'futile.options' addresses this problem by properly
  scoping variables within its own custom 'namespace'. This is handled by the
  'OptionsManager', which acts as a generator for functions that manage user-
  defined options. 

  An added benefit to the package is that default values are automatically
  supported in the creation of the bespoke options manager.
}
\author{
Brian Lee Yung Rowe <r@nurometic.com>
}
\keyword{ package }
\keyword{ attribute }
\keyword{ logic }
\seealso{ \code{\link{OptionsManager}} }
\examples{
  my.options <- OptionsManager('my.options', defaults=list(a=1,b=2))
  my.options(a=5, c=3)
  my.options('a')
}
