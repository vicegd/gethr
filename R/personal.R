#' Signatory address.
#'
#' \code{personal_ecRecover} returns the address associated with the private key
#' that was used to calculate a signature.
#'
#' @family personal functions
#'
#' @param message String - Message that has been signed.
#' @param signature Data - Signature of the message that has been signed.
#'
#' @return Address - Address of the account that has signed a message.
#'
#' @examples
#' \donttest{
#' personal_ecRecover('hello world', '0x1dd3657c91d95f350ab25f17ee7cbcdbccd3f5bc
#' 52976bfd4dd03bd6bc29d2ac23e656bee509ca33b921e0e6b53eb64082be1bb3c69c3a4adccd9
#' 93b1d667f8d1b')
#' }
#'
#' @export
personal_ecRecover <- function(message, signature) {
    get_post("personal_ecRecover", list(text_to_hex(message), signature))
}

#' New account creation giving the private key.
#'
#' \code{personal_importRawKey} imports the given unencrypted private key (hex
#' string) into the key store, encrypting it with the passphrase.
#'
#' @family personal functions
#'
#' @param keydata Data - Message that has been signed.
#' @param password String - Password of the account.
#'
#' @return Address - Address of the new account.
#'
#' @examples
#' \donttest{
#' personal_importRawKey('a5e3d0b2bb3011d00a139e5cdc4ae13144962752d6af7916bf2b
#' d271a240094e', 'password')
#' }
#'
#' @export
personal_importRawKey <- function(keydata, password) {
    get_post("personal_importRawKey", list(keydata, password))
}

#' Addresses owned by client.
#'
#' \code{personal_lockAccount} returns a list of addresses owned by client.
#'
#' @family personal functions
#'
#' @return Array of Address - Addresses owned by the client.
#'
#' @examples
#' \donttest{
#' personal_listAccounts()
#' }
#'
#' @export
personal_listAccounts <- function() {
    get_post("personal_listAccounts")
}

#' Account deletion.
#'
#' \code{personal_lockAccount} removes the private key with the given address
#' from memory. The account can no longer be used to send transactions.
#'
#' @family personal functions
#'
#' @param address Address - Address of account to be deleted.
#'
#' @return Boolean - \code{true} if the account has been deleted.
#'
#' @examples
#' \donttest{
#' personal_lockAccount('0xf1b76d9a65b532dbdc3899dee6e117b52c85a536')
#' }
#'
#' @export
personal_lockAccount <- function(address) {
    get_post("personal_lockAccount", list(address))
}

#' New account creation.
#'
#' \code{personal_newAccount} generates a new private key and stores it in the
#' key store directory. The key file is encrypted with the given passphrase.
#'
#' @family personal functions
#'
#' @param password String - Password of the account.
#'
#' @return Address - Address of the new account.
#'
#' @examples
#' \donttest{
#' personal_newAccount('password')
#' }
#'
#' @export
personal_newAccount <- function(password) {
    get_post("personal_newAccount", list(password))
}

#' New transaction
#'
#' \code{personal_sendTransaction} creates new message call transaction or a
#' contract if the data field contains code.
#'
#' @family eth functions
#'
#' @param from Address - Address the transaction is send from.
#' @param data Data - Compiled code of a contract OR the hash of the invoked
#'   method signature and encoded parameters.
#' @param to Address - Address the transaction is send to.
#' @param gas Integer - Gas provided for the transaction execution. It will
#'   return unused gas.
#' @param gas_price Integer - Value of the gas for this transaction.
#' @param value Integer - Value sent with the transaction.
#' @param nonce  Integer - Value of the nonce. This allows to overwrite your own
#'   pending transactions that use the same nonce.
#' @param password String - Password of the account.
#'
#' @return Data - The transaction hash, or the zero hash if the transaction is
#'   not yet available.
#'
#' @examples
#' \donttest{
#' personal_sendTransaction(from = '0xb117a8bc3ecf2c3f006b89da6826e49b4193977a'
#' , data = '0x8f8a0d190000000000000000000000000000000000000000000000000000000
#' 0000000060000000000000000000000000000000000000000000000000000000000000002',
#' password = 'password')
#' personal_sendTransaction(from = '0xb117a8bc3ecf2c3f006b89da6826e49b4193977a'
#' , to = '0x84159f53c71ef9e8df944225430da49371cbd67b', value = 10, password =
#' 'password')
#' }
#'
#' @export
personal_sendTransaction <- function(from, data = -1, to = -1, gas = 90000, gas_price = -1, value = -1, nonce = -1, password) {
    params <- list(from = from, gas = dec_to_hex(gas))
    if (data != -1) 
        params = append(params, list(data = data))
    if (to != -1) 
        params = append(params, list(to = to))
    if (gas_price != -1) 
        params = append(params, list(gas_price = gas_price))
    if (value != -1) 
        params = append(params, list(value = dec_to_hex(value)))
    if (nonce != -1) 
        params = append(params, list(nonce = nonce))
    get_post("personal_sendTransaction", list(params, password))
}

#' Ethereum specific signature
#'
#' \code{personal_sign} returns an Ethereum specific signature with
#' \code{keccak256}.
#'
#' @family personal functions
#'
#' @param address Address - Address of the user.
#' @param message String - Message to sign.
#' @param password String - Password of the account.
#'
#' @return Data - Signature.
#'
#' @examples
#' \donttest{
#' personal_sign('0xb117a8bc3ecf2c3f006b89da6826e49b4193977a', 'hello world',
#' 'password')
#' }
#'
#' @export
personal_sign <- function(address, message, password) {
    get_post("personal_sign", list(text_to_hex(message), address, password))
}

#' Unlocking the key.
#'
#' \code{personal_unlockAccount} unlocks an account to be used for signing and
#' transactions.
#'
#' @family personal functions
#'
#' @param address Address - Address to unlock.
#' @param password String - Password of the account.
#' @param duration Integer - Seconds the account will be unlocked.
#'
#' @return Boolean - \code{true} if the account has been unlocked.
#'
#' @examples
#' \donttest{
#' personal_unlockAccount('0xb117a8bc3ecf2c3f006b89da6826e49b4193977a',
#' 'password', 60000)
#' }
#'
#' @export
personal_unlockAccount <- function(address, password, duration = 3000) {
    get_post("personal_unlockAccount", list(address, password, duration))
}
