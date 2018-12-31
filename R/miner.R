#' Etherbase for mining.
#'
#' \code{miner_setEtherBase} sets the etherbase, where mining rewards will go.
#'
#' @family miner functions
#'
#' @param address Address - Address to send the rewards when mining.
#'
#' @return Boolean - \code{true} if changed, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' miner_setEtherBase('0xb117a8bc3ecf2c3f006b89da6826e49b4193977a')
#' }
#'
#' @export
miner_setEtherBase <- function(address) {
    get_post("miner_setEtherbase", list(address))
}

#' Extra data for mined blocks.
#'
#' \code{miner_setExtra} sets the extra data a miner can include when miner
#' blocks. This is capped at 32 bytes.
#'
#' @family miner functions
#'
#' @param data String - Data to include in mined blocks.
#'
#' @return Boolean - \code{true} if changed, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' miner_setExtra('My info')
#' }
#'
#' @export
miner_setExtra <- function(data) {
    get_post("miner_setExtra", list(text_to_hex(data)))
}

#' Minimal gas price for mining.
#'
#' \code{miner_setGasPrice} sets the minimal accepted gas price when mining
#' transactions. Any transactions that are below this limit are excluded from
#' the mining process.
#'
#' @family miner functions
#'
#' @param price Integer - Value of the gas price.
#'
#' @return Boolean - \code{true} if changed, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' miner_setGasPrice(10)
#' }
#'
#' @export
miner_setGasPrice <- function(price) {
    get_post("miner_setGasPrice", list(dec_to_hex(price)))
}

#' Mining process to be started.
#'
#' \code{miner_start} starts the CPU mining process with the given number of
#' threads.
#'
#' @family miner functions
#'
#' @param threads Integer - Given number of threads used for mining.
#'
#' @examples
#' \donttest{
#' miner_start()
#' miner_start(4)
#' }
#'
#' @export
miner_start <- function(threads = 1) {
    get_post("miner_start", list(threads))
}

#' Mining process to be stopped.
#'
#' \code{miner_stop} stops the CPU mining operation.
#'
#' @family miner functions
#'
#' @examples
#' \donttest{
#' miner_stop()
#' }
#'
#' @export
miner_stop <- function() {
    get_post("miner_stop")
}
