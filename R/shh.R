#' Key pair storage.
#'
#' \code{shh_addPrivatekey} stores the key pair, and returns its ID.
#'
#' @family shh functions
#'
#' @param key String - Key as HEX bytes.
#'
#' @return String - Key pair ID on sucess.
#'
#' @examples
#' \donttest{
#' shh_addPrivatekey('0x6d795f707269766174655f6b6579')
#' }
#'
#' @export
shh_addPrivatekey <- function(key) {
    get_post("shh_newKeyPair", list(key))
}

#' Symmetric key storage.
#'
#' \code{shh_addSymKey} stores the symmetric key, and returns its ID.
#'
#' @family shh functions
#'
#' @param key String - Key as HEX bytes.
#'
#' @return String - Symmetric key ID on sucess.
#'
#' @examples
#' \donttest{
#' shh_addSymKey('0xf6dcf21ed6a17bd78d8c4c63195ab997b3b65ea683705501eae82d32667adc92')
#' }
#'
#' @export
shh_addSymKey <- function(key) {
    get_post("shh_addSymKey", list(key))
}

#' Key pair deletion.
#'
#' \code{shh_addPrivatekey} deletes the specifies key pair if it exists.
#'
#' @family shh functions
#'
#' @param id String - ID of the key pair.
#'
#' @return Boolean - \code{true} on success.
#'
#' @examples
#' \donttest{
#' shh_deleteKeyPair('7ade0794bf59b9a4508a3c5d7d3408f910fc575fb2f31845da7611cae6664448')
#' }
#'
#' @export
shh_deleteKeyPair <- function(id) {
    get_post("shh_deleteKeyPair", list(id))
}

#' Symmetric key deletion.
#'
#' \code{shh_deleteSymKey} deletes the specifies symmetric key if it exists.
#'
#' @family shh functions
#'
#' @param id String - ID of the symmetric key.
#'
#' @return Boolean - \code{true} on success.
#'
#' @examples
#' \donttest{
#' shh_deleteSymKey('8d7b2dff569d14308a8e74ca1475dd93ba8dd42a9a74e97638796d5d6c8751ac')
#' }
#'
#' @export
shh_deleteSymKey <- function(id) {
    get_post("shh_deleteSymKey", list(id))
}

#' Symmetric key generation and storage.
#'
#' \code{shh_generateSymKeyFromPassword} stores the symmetric key, and returns
#' its ID.
#'
#' @family shh functions
#'
#' @param password String - Password used to generate the symmetric key.
#'
#' @return String - Symmetric key ID on sucess.
#'
#' @examples
#' \donttest{
#' shh_generateSymKeyFromPassword('my_password')
#' }
#'
#' @export
shh_generateSymKeyFromPassword <- function(password) {
    get_post("shh_generateSymKeyFromPassword", list(password))
}

#' Private key given a key pair ID.
#'
#' \code{shh_getPrivateKey} returns the private key given an ID.
#'
#' @family shh functions
#'
#' @param id String - ID of the key pair.
#'
#' @return String - Private key that corresponds to a key pair ID.
#'
#' @examples
#' \donttest{
#' shh_getPrivateKey('7ade0794bf59b9a4508a3c5d7d3408f910fc575fb2f31845da7611cae6664448')
#' }
#'
#' @export
shh_getPrivateKey <- function(id) {
    get_post("shh_getPrivateKey", list(id))
}

#' Public key given a key pair ID.
#'
#' \code{shh_getPublicKey} returns the public key given an ID.
#'
#' @family shh functions
#'
#' @param id String - ID of the key pair.
#'
#' @return String - Public key that corresponds to a key pair ID.
#'
#' @examples
#' \donttest{
#' shh_getPublicKey('7ade0794bf59b9a4508a3c5d7d3408f910fc575fb2f31845da7611cae6664448')
#' }
#'
#' @export
shh_getPublicKey <- function(id) {
    get_post("shh_getPublicKey", list(id))
}

#' Symmetric key given a symmetric key ID.
#'
#' \code{shh_getSymKey} returns the symmetric key given an ID.
#'
#' @family shh functions
#'
#' @param id String - ID of the symmetric key.
#'
#' @return String - Symmetric key that corresponds to a symmetric key ID.
#'
#' @examples
#' \donttest{
#' shh_getSymKey('8d7b2dff569d14308a8e74ca1475dd93ba8dd42a9a74e97638796d5d6c8751ac')
#' }
#'
#' @export
shh_getSymKey <- function(id) {
    get_post("shh_getSymKey", list(id))
}

#' Key pair existence confirmation.
#'
#' \code{shh_hasKeyPair} checks if the whisper node has a key pair given an ID.
#'
#' @family shh functions
#'
#' @param id String - ID of the key pair.
#'
#' @return Boolean - \code{true} if the key pair exists, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' shh_hasKeyPair('7ade0794bf59b9a4508a3c5d7d3408f910fc575fb2f31845da7611cae6664448')
#' }
#'
#' @export
shh_hasKeyPair <- function(id) {
    get_post("shh_hasKeyPair", list(id))
}

#' Symmetric key existence confirmation.
#'
#' \code{shh_hasSymKey} checks if the whisper node has a symmetric key given an
#' ID.
#'
#' @family shh functions
#'
#' @param id String - ID of the symmetric key.
#'
#' @return Boolean - \code{true} if the symmetric key exists, otherwise
#'   \code{false}.
#'
#' @examples
#' \donttest{
#' shh_hasSymKey('4c5e37602b120904c592181e75917949c07b0d2f3111d41bb554b604e532c197')
#' }
#'
#' @export
shh_hasSymKey <- function(id) {
    get_post("shh_hasSymKey", list(id))
}

#' Information about the whisper.
#'
#' \code{shh_info} returns diagnostic information about the whisper node.
#'
#' @family shh functions
#'
#' @return Object - Diagnostic information about current minimum PoW
#'   requirement, message size limit in bytes, memory size of the messages and
#'   number of current messages.
#'
#' @examples
#' \donttest{
#' shh_info()
#' }
#'
#' @export
shh_info <- function() {
    get_post("shh_info")
}

#' Indication of trusted peers.
#'
#' \code{shh_markTrustedPeer} marks specific peer trusted, which will allow it
#' to send historic (expired) messages.
#'
#' @family shh functions
#'
#' @param enode String - Enode of the trusted peer.
#'
#' @return Boolean - \code{true} on success.
#'
#' @examples
#' \donttest{
#' shh_markTrustedPeer('enode://c1a07558238c0b31657450dd34a558752d63150ce334f3
#' e99b9187262b612f48a713a083cd1601bfe3bba761a908264320885633fa81d6d6ca0ef7a6e
#' 84a2bcd@@127.0.0.1:30301')
#' }
#'
#' @export
shh_markTrustedPeer <- function(enode) {
    get_post("shh_markTrustedPeer", list(enode))
}

#' Key pair creation and storage.
#'
#' \code{shh_newKeyPair} generates a new public and private key pair for message
#' decryption and encryption.
#'
#' @family shh functions
#'
#' @return String - Key pair ID on sucess.
#'
#' @examples
#' \donttest{
#' shh_newKeyPair()
#' }
#'
#' @export
shh_newKeyPair <- function() {
    get_post("shh_newKeyPair")
}

#' New filter in the node.
#'
#' \code{shh_newMessageFilter} create a new filter within the node. This filter
#' can be used to poll for new messages that match the set of criteria.
#'
#' @family shh functions
#'
#' @param symKeyID String - ID of the symmetric key for message decryption.
#' @param privateKeyID String - ID of the key pair for message decryption.
#' @param sig String - Public key of the signature.
#' @param minPow Integer - Minimal PoW requirement for incomming messages.
#' @param topics Array of Data - Possible topics (or partial topics).
#' @param allowP2P Boolean - Indicates if this filter allows processing of
#'   direct peer-to-peer messages (which are not to be forwarded any further,
#'   because they might be expired).
#'
#' @return String - Filter identifier.
#'
#' @examples
#' \donttest{
#' shh_newMessageFilter(symKeyID = '8e975ab6e0427396d3afb748678a09b036ebe389
#' c1c5a6d39560adabdfdb08ca')
#' shh_newMessageFilter(privateKeyID = '3794e3b08a2962b066e19869283974dc6b39
#' 6cfc87cdcd69a2d269f5f1bab3cb', minPow = 0.3, allowP2P = TRUE)
#' }
#'
#' @export
shh_newMessageFilter <- function(symKeyID = NULL, privateKeyID = NULL, sig = NULL, minPow = NULL, topics = NULL,
    allowP2P = NULL) {
    params <- list()
    if (!is.null(symKeyID))
        params = append(params, list(symKeyID = symKeyID))
    if (!is.null(privateKeyID))
        params = append(params, list(privateKeyID = privateKeyID))
    if (!is.null(sig))
        params = append(params, list(sig = sig))
    if (!is.null(minPow))
        params = append(params, list(minPow))
    if (!is.null(topics))
        params = append(params, list(topics = topics))
    if (!is.null(allowP2P))
        params = append(params, list(allowP2P = allowP2P))
    get_post("shh_newMessageFilter", list(params))
}

#' Symmetric key creation and storage.
#'
#' \code{shh_newSymKey} generates a random symmetric key and stores it under an
#' ID, which is then returned. Can be used encrypting and decrypting messages
#' where the key is known to both parties.
#'
#' @family shh functions
#'
#' @return String - Symmetric key ID on sucess.
#'
#' @examples
#' \donttest{
#' shh_newSymKey()
#' }
#'
#' @export
shh_newSymKey <- function() {
    get_post("shh_newSymKey")
}


#' New whisper message.
#'
#' \code{shh_post} creates a whisper message and injects it into the network for
#' distribution.
#'
#' @family shh functions
#'
#' @param symKeyID String - ID of the symmetric key for message encryption.
#' @param pubKey  String - Public key for message encryption.
#' @param sig String - ID of the signing key.
#' @param ttl Integer - Time-to-live in seconds.
#' @param topic String - Message topic (mandatory when key is symmetric).
#' @param payload String - Payload to be encrypted.
#' @param padding String - Optional padding (byte array of arbitrary length).
#' @param powTime Integer - Maximal time in seconds to be spent on proof of
#'   work.
#' @param powTarget Integer - Minimal PoW target required for this message.
#' @param targetPeer String - Optional peer ID (for peer-to-peer message only).
#'
#' @return Boolean - \code{true} if the message was send, otherwise
#'   \code{false}.
#'
#' @examples
#' \donttest{
#' shh_post(symKeyID = '7bc23b46b61e8223ef49241bd23b94921fb1e2dd8fd7bcb58df41
#' 59e1f4d3759', ttl = 7, topic = '0x07678231', payload = '0x68656c6c6f',
#' powTime = 2, powTarget = 3)
#' shh_post(pubKey = '0x0425670405b102c0ce487cefae7aa2bfd7b474b76bc8433499bec
#' 777bb15d6d8a6b95e3001d16de259bf3170ec4cff38f00321eedc8a808a2f2e67bec6b254a
#' 1b1', ttl = 7, payload = '0x68656c6c6f', powTime = 2, powTarget = 3)
#' }
#'
#' @export
shh_post <- function(symKeyID = NULL, pubKey = NULL, sig = NULL, ttl, topic = NULL, payload, padding = NULL,
    powTime, powTarget, targetPeer = NULL) {
    params <- list(ttl = ttl, payload = payload, powTime = powTime, powTarget = powTarget)
    if (!is.null(symKeyID))
        params = append(params, list(symKeyID = symKeyID))
    if (!is.null(pubKey))
        params = append(params, list(pubKey = pubKey))
    if (!is.null(sig))
        params = append(params, list(sig = sig))
    if (!is.null(topic))
        params = append(params, list(topic = topic))
    if (!is.null(padding))
        params = append(params, list(padding = padding))
    if (!is.null(targetPeer))
        params = append(params, list(targetPeer = targetPeer))
    get_post("shh_post", list(params))
}

#' Maximal message size allowed by this node.
#'
#' \code{shh_setMaxMessageSize} sets the maximal message size allowed by this
#' node. Incoming and outgoing messages with a larger size will be rejected.
#' Whisper message size can never exceed the limit imposed by the underlying P2P
#' protocol (10 Mb).
#'
#' @family shh functions
#'
#' @param size Integer - Message size in bytes
#'
#' @return Boolean -  \code{true} on success.
#'
#' @examples
#' \donttest{
#' shh_setMaxMessageSize(1048576)
#' }
#'
#' @export
shh_setMaxMessageSize <- function(size) {
    get_post("shh_setMaxMessageSize", list(size))
}

#' Minimal Pow.
#'
#' \code{shh_setMinPoW} sets the minimal PoW required by this node.
#'
#' @family shh functions
#'
#' @param pow Integer - The new PoW requirement.
#'
#' @return Boolean -  \code{true} on success.
#'
#' @examples
#' \donttest{
#' shh_setMinPoW(0.2)
#' }
#'
#' @export
shh_setMinPoW <- function(pow) {
    get_post("shh_setMinPoW", list(pow))
}

#' Current whisper protocol.
#'
#' \code{shh_version} returns the current whisper protocol version.
#'
#' @family shh functions
#'
#' @return String - Current whisper protocol version.
#'
#' @examples
#' \donttest{
#' shh_version()
#' }
#'
#' @export
shh_version <- function() {
    get_post("shh_version")
}
