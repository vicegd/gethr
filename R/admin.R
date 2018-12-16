#' New node based on the enode
#'
#' \code{admin_addPeer} requests adding a new remote node to the list of tracked static nodes.
#'
#' @family admin functions
#'
#' @param enode String - URL of the remote peer to start tracking.
#'
#' @return Boolean - \code{true} the peer was accepted for tracking or \code{false} if some error occurred.
#'
#' @examples
#' \donttest{
#' admin_addPeer("enode://c1a07558238c0b31657450dd34a558752d63150ce334f3e99b9187262b612f48a713a083cd1601bfe3bba761a908264320885633fa81d6d6ca0ef7a6e84a2bcd@[127.0.0.1]:30301")
#' }
#'
#' @export
admin_addPeer <- function(enode) {
  get_post("admin_addPeer", list(enode))
}

#' Path being used by the node.
#'
#' \code{admin_datadir} returns the absolute path the running Geth node.
#'
#' @family admin functions
#'
#' @return String - Absolute path being used by the node.
#'
#' @examples
#' \donttest{
#' admin_datadir()
#' }
#'
#' @export
admin_datadir <- function() {
  get_post("admin_datadir")
}

#' Node basic information
#'
#' \code{admin_nodeInfo} returns all the information known about the running Geth node at the networking granularity.
#'
#' These include general information about the node itself as a participant of the P2P overlay protocol, as well as specialized information added by each of the running application protocols (e.g. eth, les, shh, bzz).
#'
#' @family admin functions
#'
#' @return Object - Properties with information about the node (enode, version, port, ip, id, etc.).
#'
#' @examples
#' \donttest{
#' admin_nodeInfo()
#' }
#'
#' @export
admin_nodeInfo <- function() {
  get_post("admin_nodeInfo")
}

#' Peers basic information
#'
#' \code{admin_peers} returns all the information known about the connected remote nodes at the networking granularity.
#'
#' These include general information about the nodes themselves as participants of the P2P overlay protocol, as well as specialized information added by each of the running application protocols (e.g. eth, les, shh, bzz).
#'
#' @family admin functions
#'
#' @return Object - Properties with information about the peers.
#'
#' @examples
#' \donttest{
#' admin_peers()
#' }
#'
#' @export
admin_peers <- function() {
  get_post("admin_peers")
}

#' Solidity compiler path
#'
#' \code{admin_setSolc} sets the Solidity compiler path to be used by the node when invoking the eth_compileSolidity RPC method.
#'
#' @family admin functions
#'
#' @param path String - Solidity compiler path defaults to /usr/bin/solc if not set, so you only need to change it for using a non-standard compiler location.
#'
#' @examples
#' \donttest{
#' admin_setSolc("/usr/bin/solidityc")
#' }
#'
#' @export
admin_setSolc <- function(path) {
  get_post("admin_setSolc", list(path))
}

#' HTTP based JSON RPC API initialization.
#'
#' \code{admin_startRPC} starts an HTTP based JSON RPC API webserver to handle client requests.
#'
#' @family admin functions
#'
#' @param host String - Network interface to open the listener socket on.
#' @param port Integer - Network port to open the listener socket on.
#' @param cors String - Cross-origin resource sharing header to use.
#' @param apis String - API modules to offer over this interface.
#'
#' @return Boolean - \code{true} the execution was successful.
#'
#' @examples
#' \donttest{
#' admin_startRPC()
#' admin_startRPC("193.23.92.1", 8999, "*", "eth,net,web3,personal,shh,miner,txpool,admin,debug")
#' }
#'
#' @export
admin_startRPC <- function(host = "127.0.0.1", port = 8545, cors = "", apis = "eth,net,web3") {
  get_post("admin_startRPC", list(host, port, cors, apis))
}

#' WebSocket based JSON RPC API initialization.
#'
#' \code{admin_startWS} starts a WebSocket based JSON RPC API webserver to handle client requests.
#'
#' @family admin functions
#'
#' @param host String - Network interface to open the listener socket on.
#' @param port Integer - Network port to open the listener socket on.
#' @param cors String - Cross-origin resource sharing header to use.
#' @param apis String - API modules to offer over this interface.
#'
#' @return Boolean - \code{true} the execution was successful.
#'
#' @examples
#' \donttest{
#' admin_startWS()
#' admin_startWS("193.23.92.1", 8999, "*", "eth,net,web3,personal,shh,miner,txpool,admin,debug")
#' }
#'
#' @export
admin_startWS <- function(host = "127.0.0.1", port = 8546, cors = "", apis = "eth,net,web3") {
  get_post("admin_startWS", list(host, port, cors, apis))
}

#' HTTP based JSON RPC API stop.
#'
#' \code{admin_stopRPC} stops the HTTP based JSON RPC API webserver.
#'
#' @family admin functions
#'
#' @return Boolean - \code{true} the execution was successful.
#'
#' @examples
#' \donttest{
#' admin_stopRPC()
#' }
#'
#' @export
admin_stopRPC <- function() {
  get_post("admin_stopRPC")
}

#' WebSocket based JSON RPC API stop.
#'
#' \code{admin_stopWS} stops the WebSocket based JSON RPC API webserver.
#'
#' @family admin functions
#'
#' @return Boolean - \code{true} the execution was successful.
#'
#' @examples
#' \donttest{
#' admin_stopWS()
#' }
#'
#' @export
admin_stopWS <- function() {
  get_post("admin_stopWS")
}
