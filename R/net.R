#' Whether client is listening or not.
#'
#' \code{net_listening} returns \code{true} if client is actively listening for
#' network connections.
#'
#' @family net functions
#'
#' @return Boolean - \code{true} when listening, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' net_listening()
#' }
#'
#' @export
net_listening <- function() {
    get_post("net_listening")
}

#' Number of peers connected.
#'
#' \code{net_peerCount} returns the number of peers currently connected to the
#' client.
#'
#' @family net functions
#'
#' @return Integer - Number of connected peers.
#'
#' @examples
#' \donttest{
#' net_peerCount()
#' }
#'
#' @export
net_peerCount <- function() {
    hex_to_dec(get_post("net_peerCount"))
}

#' Current network id.
#'
#' \code{net_version} returns the current network id.
#'
#' @family net functions
#'
#' @return String - Current network id.
#'
#' @examples
#' \donttest{
#' net_version()
#' }
#'
#' @export
net_version <- function() {
    get_post("net_version")
}
