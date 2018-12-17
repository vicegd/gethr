#' Current client version.
#'
#' \code{web3_clientVersion} returns the current client version.
#'
#' @family web3 functions
#'
#' @return String - Current client version.
#'
#' @examples
#' \donttest{
#' web3_clientVersion()
#' }
#'
#' @export
web3_clientVersion <- function() {
    get_post("web3_clientVersion")
}

#' Keccak-256 value of the data.
#'
#' \code{web3_sha3} returns Keccak-256 (not the standardized SHA3-256) of the
#' given data.
#'
#' @family web3 functions
#'
#' @param data String - Data to convert into a SHA3 hash.
#'
#' @return Data - SHA3 result of the given string.
#'
#' @examples
#' \donttest{
#' web3_sha3('hello')
#' }
#'
#' @export
web3_sha3 <- function(data) {
    get_post("web3_sha3", list(text_to_hex(data)))
}
