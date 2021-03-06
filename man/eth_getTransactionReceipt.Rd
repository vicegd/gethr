% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eth.R
\name{eth_getTransactionReceipt}
\alias{eth_getTransactionReceipt}
\title{Transaction receipt.}
\usage{
eth_getTransactionReceipt(hash, hex = TRUE)
}
\arguments{
\item{hash}{Hash - Hash of a transaction.}

\item{hex}{Boolean - \code{true} to get the response in hexadecimal,
\code{false} to get a readable response.}
}
\value{
Object - A transaction receipt, or \cite{null} when no receipt was
  found.
}
\description{
\code{eth_getTransactionReceipt} returns the receipt of a transaction by
transaction hash.
}
\examples{
\donttest{
eth_getTransactionReceipt('0xb61a9ca11109646bfd056f8be9e1e183a1b1bea3c281e
73cc4f17d332fa69a05')
eth_getTransactionReceipt('0xb61a9ca11109646bfd056f8be9e1e183a1b1bea3c281e
73cc4f17d332fa69a05', FALSE)
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
  \code{\link{eth_getCode}},
  \code{\link{eth_getFilterChanges}},
  \code{\link{eth_getFilterLogs}},
  \code{\link{eth_getLogs}}, \code{\link{eth_getProof}},
  \code{\link{eth_getStorageAt}},
  \code{\link{eth_getTransactionByBlockHashAndIndex}},
  \code{\link{eth_getTransactionByBlockNumberAndIndex}},
  \code{\link{eth_getTransactionByHash}},
  \code{\link{eth_getTransactionCount}},
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
