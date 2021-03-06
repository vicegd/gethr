% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/miner.R
\name{miner_setGasPrice}
\alias{miner_setGasPrice}
\title{Minimal gas price for mining.}
\usage{
miner_setGasPrice(price)
}
\arguments{
\item{price}{Integer - Value of the gas price.}
}
\value{
Boolean - \code{true} if changed, otherwise \code{false}.
}
\description{
\code{miner_setGasPrice} sets the minimal accepted gas price when mining
transactions. Any transactions that are below this limit are excluded from
the mining process.
}
\examples{
\donttest{
miner_setGasPrice(10)
}

}
\seealso{
Other miner functions: \code{\link{gethr}},
  \code{\link{miner_setEtherBase}},
  \code{\link{miner_setExtra}}, \code{\link{miner_start}},
  \code{\link{miner_stop}}
}
\concept{miner functions}
