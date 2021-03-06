% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/debug.R
\name{debug_traceBlockByHash}
\alias{debug_traceBlockByHash}
\title{Full trace of a block by hash.}
\usage{
debug_traceBlockByHash(hash)
}
\arguments{
\item{hash}{Data - Block hash.}
}
\value{
Object - Full stack trace of the block.
}
\description{
\code{debug_traceBlockByHash} returns a full stack trace of all invoked
opcodes of all transaction that were included in this block by hash.
}
\examples{
\donttest{
debug_traceBlockByHash('0xc41e977760873fbab207d0921bc124edce6ce4044d2718b2bba1
ebec45656ffa')
}

}
\seealso{
Other debug functions: \code{\link{debug_backtraceAt}},
  \code{\link{debug_blockProfile}},
  \code{\link{debug_cpuProfile}},
  \code{\link{debug_dumpBlock}},
  \code{\link{debug_gcStats}},
  \code{\link{debug_getBlockRlp}},
  \code{\link{debug_goTrace}},
  \code{\link{debug_memStats}},
  \code{\link{debug_seedHash}},
  \code{\link{debug_setBlockProfileRate}},
  \code{\link{debug_setHead}}, \code{\link{debug_stacks}},
  \code{\link{debug_startCPUProfile}},
  \code{\link{debug_startGoTrace}},
  \code{\link{debug_stopCPUProfile}},
  \code{\link{debug_stopGoTrace}},
  \code{\link{debug_traceBlockByNumber}},
  \code{\link{debug_traceBlockFromFile}},
  \code{\link{debug_traceBlock}},
  \code{\link{debug_traceTransaction}},
  \code{\link{debug_verbosity}},
  \code{\link{debug_vmodule}},
  \code{\link{debug_writeBlockProfile}},
  \code{\link{debug_writeMemProfile}}, \code{\link{gethr}}
}
\concept{debug functions}
