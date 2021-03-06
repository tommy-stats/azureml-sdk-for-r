% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hyperdrive.R
\name{random_parameter_sampling}
\alias{random_parameter_sampling}
\title{Define random sampling over a hyperparameter search space}
\usage{
random_parameter_sampling(parameter_space, properties = NULL)
}
\arguments{
\item{parameter_space}{A named list containing each parameter and its
distribution, e.g. \code{list("parameter" = distribution)}.}

\item{properties}{A named list of additional properties for the algorithm.}
}
\value{
The \code{RandomParameterSampling} object.
}
\description{
In random sampling, hyperparameter values are randomly selected from the
defined search space. Random sampling allows the search space to include
both discrete and continuous hyperparameters.
}
\section{Details}{

In this sampling algorithm, parameter values are chosen from a set of
discrete values or a distribution over a continuous range. Functions you can
use include:
\code{choice()}, \code{randint()}, \code{uniform()}, \code{quniform()}, \code{loguniform()},
\code{qloguniform()}, \code{normal()}, \code{qnormal()}, \code{lognormal()}, and \code{qlognormal()}.
}

\examples{
\dontrun{
param_sampling <- random_parameter_sampling(list("learning_rate" = normal(10, 3),
                                                 "keep_probability" = uniform(0.05, 0.1),
                                                 "batch_size" = choice(16, 32, 64, 128)))
}
}
\seealso{
\code{choice()}, \code{randint()}, \code{uniform()}, \code{quniform()}, \code{loguniform()},
\code{qloguniform()}, \code{normal()}, \code{qnormal()}, \code{lognormal()}, \code{qlognormal()}
}
