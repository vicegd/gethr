% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eth.R
\name{eth_getCode}
\alias{eth_getCode}
\title{Code at an address.}
\usage{
eth_getCode(address, number = "latest")
}
\arguments{
\item{address}{Address - Address to get the code.}

\item{number}{Integer|Tag - Block number, or the string 'latest', 'earliest'
or 'pending'.}
}
\value{
Data - Code from the given address.
}
\description{
\code{eth_getCode} returns code at a given address.
}
\examples{
\donttest{
eth_getCode('0xcaf9a0356ddfa779fdbb55c45b22d35673550f30')
eth_getCode('0xcaf9a0356ddfa779fdbb55c45b22d35673550f30', 'earliest')
eth_getCode('0xcaf9a0356ddfa779fdbb55c45b22d35673550f30', 25)
}

}
\seealso{
Other eth functions: \code{\link{eth_accounts}},
  \code{\link{eth_blockNumber}}, \code{\link{eth_call}},
  \code{\link{eth_coinbase}},
  \code{\link{eth_estimateGas}},
  \code{\link{eth_gasPrice}}, \code{\link{eth_getBalance}},
  \code{\link{eth_getBlockByHash}},
  \code{\link{eth_getBlockByNumber}},
  \code{\link{eth_getBlockTransactionCountByHash}},
  \code{\link{eth_getBlockTransactionCountByNumber}},
  \code{\link{eth_getFilterChanges}},
  \code{\link{eth_getFilterLogs}},
  \code{\link{eth_getLogs}}, \code{\link{eth_getProof}},
  \code{\link{eth_getStorageAt}},
  \code{\link{eth_getTransactionByBlockHashAndIndex}},
  \code{\link{eth_getTransactionByBlockNumberAndIndex}},
  \code{\link{eth_getTransactionByHash}},
  \code{\link{eth_getTransactionCount}},
  \code{\link{eth_getTransactionReceipt}},
  \code{\link{eth_getUncleByBlockHashAndIndex}},
  \code{\link{eth_getUncleByBlockNumberAndIndex}},
  \code{\link{eth_getUncleCountByBlockHash}},
  \code{\link{eth_getUncleCountByBlockNumber}},
  \code{\link{eth_getWork}}, \code{\link{eth_hashrate}},
  \code{\link{eth_mining}},
  \code{\link{eth_newBlockFilter}},
  \code{\link{eth_newFilter}},
  \code{\link{eth_newPendingTransactionFilter}},
  \code{\link{eth_protocolVersion}},
  \code{\link{eth_sendRawTransaction}},
  \code{\link{eth_sendTransaction}},
  \code{\link{eth_sign}}, \code{\link{eth_submitHashrate}},
  \code{\link{eth_submitWork}}, \code{\link{eth_syncing}},
  \code{\link{eth_uninstallFilter}}, \code{\link{gethr}},
  \code{\link{personal_sendTransaction}}
}
\concept{eth functions}
