% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/admin.R
\name{admin_stopWS}
\alias{admin_stopWS}
\title{WebSocket based JSON RPC API stop.}
\usage{
admin_stopWS()
}
\value{
Boolean - \code{true} the execution was successful.
}
\description{
\code{admin_stopWS} stops the WebSocket based JSON RPC API webserver.
}
\examples{
\donttest{
admin_stopWS()
}

}
\seealso{
Other admin functions: \code{\link{admin_addPeer}},
  \code{\link{admin_datadir}},
  \code{\link{admin_nodeInfo}}, \code{\link{admin_peers}},
  \code{\link{admin_setSolc}},
  \code{\link{admin_startRPC}},
  \code{\link{admin_startWS}}, \code{\link{admin_stopRPC}},
  \code{\link{gethr}}
}
\concept{admin functions}
