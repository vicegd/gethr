#' Information about pending and queued transactions.
#'
#' \code{txpool_content} returns the list the exact details of all the
#' transactions currently pending for inclusion in the next block(s), as well as
#' the ones that are being scheduled for future execution only.
#'
#' @family txpool functions
#'
#' @return Object - Information about the pending and queued transactions to be
#'   inserted in the blockchain.
#'
#' @examples
#' \donttest{
#' txpool_content()
#' }
#'
#' @export
txpool_content <- function() {
    get_post("txpool_content")
}

#' Summary of the information about pending and queued transactions.
#'
#' \code{txpool_inspect} returns the list a textual summary of all the
#' transactions currently pending for inclusion in the next block(s), as well as
#' the ones that are being scheduled for future execution only. This is a method
#' specifically tailored to developers to quickly see the transactions in the
#' pool and find any potential issues.
#'
#' @family txpool functions
#'
#' @return Object - Summary of the information about the pending and queued
#'   transactions to be inserted in the blockchain.
#'
#' @examples
#' \donttest{
#' txpool_inspect()
#' }
#'
#' @export
txpool_inspect <- function() {
    get_post("txpool_inspect")
}

#' Number of pending and queued transactions.
#'
#' \code{txpool_status} returns the number of transactions currently pending for
#' inclusion in the next block(s), as well as the ones that are being scheduled
#' for future execution only.
#'
#' @family txpool functions
#'
#' @return Integer - Number of pending and queued transactions.
#'
#' @examples
#' \donttest{
#' txpool_status()
#' }
#'
#' @export
txpool_status <- function() {
    result = get_post("txpool_status")
    result$pending = hex_to_dec(result$pending)
    result$queued = hex_to_dec(result$queued)
    result
}

