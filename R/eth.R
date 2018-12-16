#' Addresses owned by client.
#'
#' \code{eth_accounts} returns a list of addresses owned by client.
#'
#' @family eth functions
#'
#' @return Array of Address - Addresses owned by the client.
#'
#' @examples
#' \donttest{
#' eth_accounts()
#' }
#' @export
eth_accounts <- function() {
  get_post("eth_accounts")
}


#' Current block number.
#'
#' \code{eth_blockNumber} returns the number of most recent block.
#'
#' @family eth functions
#'
#' @return Integer - Current block number the client is on
#'
#' @examples
#' \donttest{
#' eth_blockNumber()
#' }
#'
#' @export
eth_blockNumber <- function() {
  hex_to_dec(get_post("eth_blockNumber"))
}

#' New message call.
#'
#' \code{eth_call} executes a new message call immediately without creating a transaction on the block chain.
#'
#' @family eth functions
#'
#' @param from Address - Address the call is send from.
#' @param to Address - Address the call is send to.
#' @param gas Integer - Gas provided for the call execution. \code{eth_call} consumes zero gas, but this parameter may be needed by some executions.
#' @param gas_price Integer - Value of the gas for this call.
#' @param value Integer - Value sent with the call
#' @param data Data - Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI \url{https://solidity.readthedocs.io/en/develop/abi-spec.html}.
#' @param number Integer|Tag - Integer block number, or the string "latest", "earliest" or "pending", see the default block parameter \url{https://github.com/ethereum/wiki/wiki/JSON-RPC#the-default-block-parameter}
#'
#' @return Data - Return value of executed call.
#'
#' @examples
#' \donttest{
#' eth_call(to = "0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", data = "0x8f8a0d1900000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000002")
#' }
#'
#' @export
eth_call <- function(from = -1, to, gas = 30000, gas_price = -1, value = -1, data = -1, number = "latest") {
  params <- list(to = to,
                 gas = dec_to_hex(gas)
  )
  if (from != -1) params = append(params, list(from = from))
  if (gas_price != -1) params = append(params, list(gas_price = gas_price))
  if (value != -1) params = append(params, list(value = dec_to_hex(value)))
  if (data != -1) params = append(params, list(data = data))
  get_post("eth_call", list(params, number))
}

#' Coinbase address.
#'
#' \code{eth_coinbase} returns the client coinbase address.
#'
#' @family eth functions
#'
#' @return Address - Current coinbase address.
#'
#' @examples
#' \donttest{
#' eth_coinbase()
#' }
#'
#' @export
eth_coinbase <- function() {
  get_post("eth_coinbase")
}

#' Estimation of the gas.
#'
#' \code{eth_estimateGas} returns an estimate of how much gas is necessary to allow the transaction to complete.
#'
#' The transaction will not be added to the blockchain. Note that the estimate may be significantly more than the amount of gas actually used by the transaction, for a variety of reasons including EVM mechanics and node performance.
#'
#' @family eth functions
#'
#' @param to Address - Address the call is send to.
#' @param data Data - Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI \url{https://solidity.readthedocs.io/en/develop/abi-spec.html}.
#'
#' @return Integer - Amount of gas estimated.
#'
#' @examples
#' \donttest{
#' eth_estimateGas(to = "0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", data = "0x8f8a0d1900000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000002")
#' }
#'
#' @export
eth_estimateGas <- function(to, data) {
  params <- list(to = to,
                 data = data
  )
  hex_to_dec(get_post("eth_estimateGas", list(params)))
}

#' Gas price.
#'
#' \code{eth_gasPrice} returns the current price per gas in wei.
#'
#' @family eth functions
#'
#' @return Integer - Current gas price in wei.
#'
#' @examples
#' \donttest{
#' eth_gasPrice()
#' }
#'
#' @export
eth_gasPrice <- function() {
  hex_to_dec(get_post("eth_gasPrice"))
}

#' Balance of an account.
#'
#' \code{eth_getBalance} returns the balance of the account of given address.
#'
#' @family eth functions
#'
#' @param address Address - Address to check the balance.
#' @param number Integer|Tag - Block number, or the string "latest", "earliest" or "pending".
#'
#' @return Integer - Current balance in wei.
#'
#' @examples
#' \donttest{
#' eth_getBalance()
#' eth_getBalance("0xb117a8bc3ecf2c3f006b89da6826e49b4193977a")
#' eth_getBalance("0xb117a8bc3ecf2c3f006b89da6826e49b4193977a", "earliest")
#' eth_getBalance("0xb117a8bc3ecf2c3f006b89da6826e49b4193977a", 5)
#' }
#'
#' @export
eth_getBalance <- function(address = NULL, number = "latest") {
  if (is.null(address)) address = eth_coinbase()
  if (is.wholenumber(number)) number = dec_to_hex(number)
  hex_to_dec(get_post("eth_getBalance", list(address, number)))
}

#' Block information based on its hash.
#'
#' \code{eth_getBlockByHash} returns information about a block by hash.
#'
#' @family eth functions
#'
#' @param hash Hash - Hash of the block.
#' @param full Boolean - If \code{true} it returns the full transaction objects, if \code{false} only the hashes of the transactions.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A block object, or \code{null} when no block was found.
#'
#' @examples
#' \donttest{
#' eth_getBlockByHash("0xb69e76f3997f318f4385f31885576aa43cb40ad4ed8938718e150320ff48f528")
#' eth_getBlockByHash("0xb69e76f3997f318f4385f31885576aa43cb40ad4ed8938718e150320ff48f528", FALSE, FALSE)
#' }
#'
#' @export
eth_getBlockByHash <- function(hash, full = TRUE, hex = TRUE) {
  block = get_post("eth_getBlockByHash", list(hash, full))
  if (!is.null(block)) {
    if (hex == FALSE) {
      block = process_block(block)
    }
    if ((full == TRUE) && (length(block$transactions) > 0)) {
      for(i in 1:length(block$transactions)) {
        trans = eth_getTransactionByHash(block$transactions[[i]]$hash, hex)
        block$transactions[[i]] <- trans
      }
    }
  }
  return(block)
}

#' Block information based on its number.
#'
#' \code{eth_getBlockByNumber} returns information about a block by block number.
#'
#' @family eth functions
#'
#' @param number Integer|Tag - Block number, or the string "latest", "earliest" or "pending".
#' @param full Boolean - If \code{true} it returns the full transaction objects, if \code{false} only the hashes of the transactions.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A block object, or \code{null} when no block was found.
#'
#' @examples
#' \donttest{
#' eth_getBlockByNumber(42364)
#' eth_getBlockByNumber(42364, FALSE, FALSE)
#' }
#'
#' @export
eth_getBlockByNumber <- function(number = "latest", full = TRUE, hex = TRUE) {
  if (is.wholenumber(number)) number = dec_to_hex(number)
  block = get_post("eth_getBlockByNumber", list(number, full))
  if (!is.null(block)) {
    if (hex == FALSE) {
      block = process_block(block)
    }
    if ((full == TRUE) && (length(block$transactions) > 0)) {
      for(i in 1:length(block$transactions)) {
        trans = eth_getTransactionByHash(block$transactions[[i]]$hash, hex)
        block$transactions[[i]] <- trans
      }
    }
  }
  return(block)
}

#' Transactions in a block given a hash.
#'
#' \code{eth_getBlockTransactionCountByHash} returns the number of transactions in a block from a block matching the given block hash.
#'
#' @family eth functions
#'
#' @param hash Hash - Hash of the block.
#'
#' @return Integer - Number of transactions in the block.
#'
#' @examples
#' \donttest{
#' eth_getBlockTransactionCountByHash("0x6e4670b7fda89b5960e684d4c809f7e7e9d9c0ee70b43849405efe78aa3c0d24")
#' }
#'
#' @export
eth_getBlockTransactionCountByHash <- function(hash) {
  hex_to_dec(get_post("eth_getBlockTransactionCountByHash", list(hash)))
}

#' Transactions in a block given a number.
#'
#' \code{eth_getBlockTransactionCountByNumber} returns the number of transactions in a block from a block matching the given block number.
#'
#' @family eth functions
#'
#' @param number Integer - Number of the block.
#'
#' @return Integer - Number of transactions in the block.
#'
#' @examples
#' \donttest{
#' eth_getBlockTransactionCountByNumber(38038)
#' }
#'
#' @export
eth_getBlockTransactionCountByNumber <- function(number) {
  hex_to_dec(get_post("eth_getBlockTransactionCountByNumber", list(dec_to_hex(number))))
}

#' Code at an address.
#'
#' \code{eth_getCode} returns code at a given address.
#'
#' @family eth functions
#'
#' @param address Address - Address to get the code.
#' @param number Integer|Tag - Block number, or the string "latest", "earliest" or "pending".
#'
#' @return Data - Code from the given address.
#'
#' @examples
#' \donttest{
#' eth_getCode("0xcaf9a0356ddfa779fdbb55c45b22d35673550f30")
#' eth_getCode("0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", "earliest")
#' eth_getCode("0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", 25)
#' }
#'
#' @export
eth_getCode <- function(address, number = "latest") {
  if (is.wholenumber(number)) number = dec_to_hex(number)
  get_post("eth_getCode", list(address, number))
}

#' Filter information since last poll.
#'
#' \code{eth_getFilterChanges} returns an array of logs which occurred since last poll.
#'
#' @family eth functions
#'
#' @param id Integer - Filter Id.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Array of Object - Logs for a given filter since last poll.
#'
#' @examples
#' \donttest{
#' eth_getFilterChanges("0x75c1c2893a789a4cfb8e146464ea622b")
#' }
#'
#' @export
eth_getFilterChanges <- function(id, hex = TRUE) {
  logs = get_post("eth_getFilterChanges", list(id))

  if ((hex == FALSE) && (length(logs) > 0)) {
    for(i in 1:length(logs)) {
      logs[[i]] <- process_log(logs[[i]]);
    }
  }

  return(logs)
}

#' Filter information.
#'
#' \code{eth_getFilterLogs} returns an array of all logs matching filter with given id.
#'
#' @family eth functions
#'
#' @param id Integer - Filter Id.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Array of Object - Logs for a given filter.
#'
#' @examples
#' \donttest{
#' eth_getFilterLogs("0x75c1c2893a789a4cfb8e146464ea622b")
#' }
#'
#' @export
eth_getFilterLogs <- function(id, hex = TRUE) {
  logs = get_post("eth_getFilterLogs", list(id))

  if ((hex == FALSE) && (length(logs) > 0)) {
    for(i in 1:length(logs)) {
      logs[[i]] <- process_log(logs[[i]]);
    }
  }
  return(logs)
}

#' New filter and its logs.
#'
#' \code{eth_getLogs} returns an array of all logs matching a given filter object.
#'
#' @family eth functions
#'
#' @param from_block Integer|Tag - Block number, or the string "earliest", "latest" or "pending".
#' @param to_block Integer|Tag - Block number, or the string "earliest", "latest" or "pending".
#' @param address Address - Contract address or a list of addresses from which logs should originate.
#' @param topics Array of Data - Topics are order-dependent. Each topic can also be an array of DATA with "or" options.
#' @param block_hash Hash Single block to return logs. If \code{blockHash} is present in the filter criteria, then neither \code{fromBlock} nor \code{toBlock} are allowed.
#'
#' @return Hash - A filter Id.
#'
#' @examples
#' \donttest{
#' eth_getLogs(0, 100, "0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", list("0x977f31fe2eae427d123315e068c90016b9f8c44b9c8d0818a740f06d2dc10f95", "0x0000000000000000000000000000000000000000000000000000000000000003"))
#' eth_getLogs(address = "0x8655bd257db96eb2aca7154f845d6b1d67689219")
#' }
#'
#' @export
eth_getLogs <- function(from_block = "earliest", to_block = "latest", address, topics = -1, block_hash = -1) {
  if (is.wholenumber(from_block)) from_block = dec_to_hex(from_block)
  if (is.wholenumber(to_block)) to_block = dec_to_hex(to_block)
  options <- list(
    fromBlock = from_block,
    toBlock = to_block,
    address = address
  )
  if (topics[1] != -1) options = append(options, list(topics = topics))
  if (block_hash != -1) {
    options = append(options, list(blockhash = block_hash))
    options$fromBlock <- NULL
    options$toBlock <- NULL
  }
  get_post("eth_getLogs", list(options))
}

#' Value from storage position.
#'
#' \code{eth_getProof} returns the account and storage values of the specified account including the Merkle-proof.
#'
#' @family eth functions
#'
#' @param address Address - Address of the account or contract.
#' @param keys Array of Data - Storage-keys which should be proofed and included.
#' @param number Integer|Tag - Block number, or the string "latest", "earliest" or "pending".
#'
#' @return Data - Value at this storage position.
#'
#' @examples
#' \donttest{
#' eth_getProof("0x8655bd257db96eb2aca7154f845d6b1d67689219", list("0x0000000000000000000000000000000000000000000000000000000000000000"))
#' }
#'
#' @export
eth_getProof <- function(address, keys, number = "latest") {
  if (is.wholenumber(number)) number = dec_to_hex(number)
  get_post("eth_getProof", list(address, keys, number))
}

#' Value from storage position.
#'
#' \code{eth_getStorageAt} returns the value from a storage position at a given address.
#'
#' @family eth functions
#'
#' @param address Address - Address of the storage.
#' @param position Integer - Position in the storage.
#' @param number Integer|Tag - Block number, or the string "latest", "earliest" or "pending".
#'
#' @return Data - Value at this storage position.
#'
#' @examples
#' \donttest{
#' eth_getStorageAt("0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", "0x0")
#' eth_getStorageAt("0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", "0x0", "latest")
#' eth_getStorageAt("0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", "0x0", 10)
#' }
#'
#' @export
eth_getStorageAt <- function(address, position, number = "latest") {
  if (is.wholenumber(number)) number = dec_to_hex(number)
  get_post("eth_getStorageAt", list(address, position, number))
}

#' Transaction information given a transaction hash.
#'
#' \code{eth_getTransactionByHash} returns the information about a transaction requested by transaction hash.
#'
#' @family eth functions
#'
#' @param hash Hash - Hash of the transaction.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A transaction object, or \cite{null} when no transaction was found.
#'
#' @examples
#' \donttest{
#' eth_getTransactionByHash("0xb61a9ca11109646bfd056f8be9e1e183a1b1bea3c281e73cc4f17d332fa69a05")
#' eth_getTransactionByHash("0xcb33fb7850764aefd3cedd3dcae186cbd8bda74ca2822e4c59115b1c6b5c48bf", FALSE)
#' }
#'
#' @export
eth_getTransactionByHash <- function(hash, hex = TRUE) {
  trans = get_post("eth_getTransactionByHash", list(hash))
  if ((!is.null(trans$hash)) && (hex == FALSE)) {
    trans = process_transaction(trans)
  }
  return(trans)
}

#' Transaction information given a block hash and an index position.
#'
#' \code{eth_getTransactionByBlockHashAndIndex} returns information about a transaction by block hash and transaction index position.
#'
#' @family eth functions
#'
#' @param block_hash Hash - Hash of a block.
#' @param trans_index Integer - Transaction index position.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A transaction object, or \cite{null} when no transaction was found.
#'
#' @examples
#' \donttest{
#' eth_getTransactionByBlockHashAndIndex("0xb69e76f3997f318f4385f31885576aa43cb40ad4ed8938718e150320ff48f528", 0)
#' eth_getTransactionByBlockHashAndIndex("0x9f965e1d082ffe457247befe92089d8fc2e63015c12f373bd0d61d3ab76c6d05", 10, FALSE)
#' }
#'
#' @export
eth_getTransactionByBlockHashAndIndex <- function(block_hash, trans_index, hex = TRUE) {
  trans = get_post("eth_getTransactionByBlockHashAndIndex", list(block_hash, dec_to_hex(trans_index)))
  if ((!is.null(trans$hash)) && (hex == FALSE)) {
    trans = process_transaction(trans)
  }
  return(trans)
}

#' Transaction information given a block number and an index position.
#'
#' \code{eth_getTransactionByBlockHashAndIndex} returns information about a transaction by block number and transaction index position.
#'
#' @family eth functions
#'
#' @param block_number Integer|Tag - Block number, or the string "earliest", "latest" or "pending".
#' @param trans_index Integer - Transaction index position.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A transaction object, or \cite{null} when no transaction was found.
#'
#' @examples
#' \donttest{
#' eth_getTransactionByBlockNumberAndIndex(42364, 0)
#' eth_getTransactionByBlockNumberAndIndex(42364, 1, FALSE)
#' eth_getTransactionByBlockNumberAndIndex(500000, 10, FALSE)
#' eth_getTransactionByBlockNumberAndIndex(42365, 2)
#' }
#'
#' @export
eth_getTransactionByBlockNumberAndIndex <- function(block_number, trans_index, hex = TRUE) {
  if (is.wholenumber(block_number)) block_number = dec_to_hex(block_number)
  trans = get_post("eth_getTransactionByBlockNumberAndIndex", list(block_number, dec_to_hex(trans_index)))
  if ((!is.null(trans$hash)) && (hex == FALSE)) {
    trans = process_transaction(trans)
  }
  return(trans)
}

#' Transactions an address has sent.
#'
#' \code{eth_getTransactionCount} returns the number of transactions sent from an address.
#'
#' @family eth functions
#'
#' @param address Address - Address of the storage.
#' @param number Integer|Tag - Block number, or the string "latest", "earliest" or "pending".
#'
#' @return Integer - Number of transactions send from this address.
#'
#' @examples
#' \donttest{
#' eth_getTransactionCount()
#' eth_getTransactionCount("0xb117a8bc3ecf2c3f006b89da6826e49b4193977a")
#' eth_getTransactionCount("0xb117a8bc3ecf2c3f006b89da6826e49b4193977a", "pending")
#' eth_getTransactionCount("0xb117a8bc3ecf2c3f006b89da6826e49b4193977a", 10)
#' }
#'
#' @export
eth_getTransactionCount <- function(address = NULL, number = "latest") {
  if (is.null(address)) address = eth_coinbase()
  if (is.wholenumber(number)) number = dec_to_hex(number)
  hex_to_dec(get_post("eth_getTransactionCount", list(address, number)))
}

#' Transaction receipt.
#'
#' \code{eth_getTransactionReceipt} returns the receipt of a transaction by transaction hash..
#'
#' @family eth functions
#'
#' @param hash Hash - Hash of a transaction.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A transaction receipt, or \cite{null} when no receipt was found.
#'
#' @examples
#' \donttest{
#' eth_getTransactionReceipt("0xb61a9ca11109646bfd056f8be9e1e183a1b1bea3c281e73cc4f17d332fa69a05")
#' eth_getTransactionReceipt("0xb61a9ca11109646bfd056f8be9e1e183a1b1bea3c281e73cc4f17d332fa69a05", FALSE)
#' }
#'
#' @export
eth_getTransactionReceipt <- function(hash, hex = TRUE) {
  receipt = get_post("eth_getTransactionReceipt", list(hash))
  if ((!is.null(receipt$transactionHash)) && (hex == FALSE)) {
    receipt = process_receipt(receipt)
  }
  return(receipt)
}

#' Uncle information given a block hash and an index position.
#'
#' \code{eth_getUncleByBlockHashAndIndex} returns information about a uncle of a block by hash and uncle index position.
#'
#' @family eth functions
#'
#' @param block_hash Hash - Hash of a block.
#' @param uncle_index Integer - Uncle index position.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A block object, or \cite{null} when no block was found.
#'
#' @examples
#' \donttest{
#' eth_getUncleByBlockHashAndIndex("0xb69e76f3997f318f4385f31885576aa43cb40ad4ed8938718e150320ff48f528", 1)
#' }
#'
#' @export
eth_getUncleByBlockHashAndIndex <- function(block_hash, uncle_index, hex = TRUE) {
  block = get_post("eth_getUncleByBlockHashAndIndex", list(block_hash, dec_to_hex(uncle_index)))
  if ((!is.null(block)) && (hex == FALSE)) {
    block = process_block(block)
  }
  return(block)
}

#' Uncle information given a block number and an index position.
#'
#' \code{eth_getUncleByBlockHashAndIndex} returns information about a uncle of a block by number and uncle index position.
#'
#' @family eth functions
#'
#' @param block_number Integer|Tag - Block number, or the string "earliest", "latest" or "pending".
#' @param uncle_index Integer - Uncle index position.
#' @param hex Boolean - \code{true} to get the response in hexadecimal, \code{false} to get a readable response.
#'
#' @return Object - A block object, or \cite{null} when no block was found.
#'
#' @examples
#' \donttest{
#' eth_getUncleByBlockNumberAndIndex(42364, 345)
#' }
#'
#' @export
eth_getUncleByBlockNumberAndIndex <- function(block_number, uncle_index, hex = TRUE) {
  if (is.wholenumber(block_number)) block_number = dec_to_hex(block_number)
  block = get_post("eth_getUncleByBlockNumberAndIndex", list(block_number, dec_to_hex(uncle_index)))
  if ((!is.null(block)) && (hex == FALSE)) {
    block = process_block(block)
  }
  return(block)
}

#' Uncles in a block given a hash.
#'
#' \code{eth_getUncleCountByBlockHash} returns the number of uncles in a block from a block matching the given block hash.
#'
#' @family eth functions
#'
#' @param hash Hash - Hash of the block.
#'
#' @return Integer - Number of uncles in the block.
#'
#' @examples
#' \donttest{
#' eth_getUncleCountByBlockHash("0x6e4670b7fda89b5960e684d4c809f7e7e9d9c0ee70b43849405efe78aa3c0d24")
#' }
#'
#' @export
eth_getUncleCountByBlockHash <- function(hash) {
  hex_to_dec(get_post("eth_getUncleCountByBlockHash", list(hash)))
}

#' Work performed by the current block
#'
#' \code{eth_getWork} returns the hash of the current block, the seedHash, and the boundary condition to be met the target.
#'
#' @family eth functions
#'
#' @return Object - Information about the block header pow-hash, the seed hash used for the DAG and the boundary condition / target.
#'
#' @examples
#' \donttest{
#' eth_getWork()
#' }
#'
#' @export
eth_getWork <- function() {
  get_post("eth_getWork")
}

#' Uncles in a block given a number.
#'
#' \code{eth_getUncleCountByBlockNumber} returns the number of uncles in a block from a block matching the given block number.
#'
#' @family eth functions
#'
#' @param number Integer - Number of the block.
#'
#' @return Integer - Number of uncles in the block.
#'
#' @examples
#' \donttest{
#' eth_getUncleCountByBlockNumber(38038)
#' }
#'
#' @export
eth_getUncleCountByBlockNumber <- function(number) {
  hex_to_dec(get_post("eth_getUncleCountByBlockNumber", list(dec_to_hex(number))))
}

#' Hashes per second that are mined.
#'
#' \code{eth_hashrate} returns the number of hashes per second that the node is mining with.
#'
#' @family eth functions
#'
#' @return Integer - Number of hashes per second.
#'
#' @examples
#' \donttest{
#' eth_hashrate()
#' }
#'
#' @export
eth_hashrate  <- function() {
  hex_to_dec(get_post("eth_hashrate"))
}

#' Whether client is mining or not.
#'
#' \code{eth_mining} returns \code{true} if client is actively mining new blocks.
#'
#' @family eth functions
#'
#' @return Boolean - \code{true} if the client is mining, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' eth_mining()
#' }
#'
#' @export
eth_mining <- function() {
  get_post("eth_mining")
}

#' New block filter.
#'
#' \code{eth_newBlockFilter} creates a filter in the node, to notify when a new block arrives.
#'
#' @family eth functions
#'
#' @return Hash - A filter Id.
#'
#' @examples
#' \donttest{
#' eth_newBlockFilter()
#' }
#'
#' @export
eth_newBlockFilter <- function() {
  get_post("eth_newBlockFilter", list())
}

#' New filter.
#'
#' \code{eth_newFilter} creates a filter object, based on filter options, to notify when the state changes (logs).
#'
#' @family eth functions
#'
#' @param from_block Integer|Tag - Block number, or the string "earliest", "latest" or "pending".
#' @param to_block Integer|Tag - Block number, or the string "earliest", "latest" or "pending".
#' @param address Address - Contract address or a list of addresses from which logs should originate.
#' @param topics Array of Data - Topics are order-dependent. Each topic can also be an array of DATA with "or" options.
#'
#' @return Hash - A filter Id.
#'
#' @examples
#' \donttest{
#' eth_newFilter(0, 100, "0xcaf9a0356ddfa779fdbb55c45b22d35673550f30", list("0x977f31fe2eae427d123315e068c90016b9f8c44b9c8d0818a740f06d2dc10f95", "0x0000000000000000000000000000000000000000000000000000000000000003"))
#' eth_newFilter(address = "0x8655bd257db96eb2aca7154f845d6b1d67689219")
#' }
#'
#' @export
eth_newFilter <- function(from_block = "earliest", to_block = "latest", address, topics = -1) {
  if (is.wholenumber(from_block)) from_block = dec_to_hex(from_block)
  if (is.wholenumber(to_block)) to_block = dec_to_hex(to_block)
  options <- list(
    fromBlock = from_block,
    toBlock = to_block,
    address = address
  )
  if (topics[1] != -1) options = append(options, list(topics = topics))
  get_post("eth_newFilter", list(options))
}

#' New pending transaction filter.
#'
#' \code{eth_newPendingTransactionFilter} creates a filter in the node, to notify when new pending transactions arrive.
#'
#' @family eth functions
#'
#' @return Hash - A filter Id.
#'
#' @examples
#' \donttest{
#' eth_newPendingTransactionFilter()
#' }
#'
#' @export
eth_newPendingTransactionFilter <- function() {
  get_post("eth_newPendingTransactionFilter")
}

#' Ethereum protocol version.
#'
#' \code{eth_protocolVersion} returns the current Ethereum protocol version.
#'
#' @family eth functions
#'
#' @return Integer - Current Ethereum protocol version.
#'
#' @examples
#' \donttest{
#' eth_protocolVersion()
#' }
#'
#' @export
eth_protocolVersion <- function() {
  hex_to_dec(get_post("eth_protocolVersion"))
}

#' New raw transaction
#'
#' \code{eth_sendRawTransaction} creates new message call transaction or a contract creation for signed transactions.
#'
#' @family eth functions
#'
#' @param data Data - Signed transaction data.
#'
#' @return Data - The transaction hash, or the zero hash if the transaction is not yet available.
#'
#' @examples
#' \donttest{
#' eth_sendRawTransaction("0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072145675")
#' }
#'
#' @export
eth_sendRawTransaction <- function(data) {
  get_post("eth_sendRawTransaction", list(data))
}

#' New transaction
#'
#' \code{eth_sendTransaction} creates new message call transaction or a contract creation, if the data field contains code.
#'
#' @family eth functions
#'
#' @param from Address - Address the transaction is send from.
#' @param data Data - Compiled code of a contract OR the hash of the invoked method signature and encoded parameters.
#' @param to Address - Address the transaction is send to.
#' @param gas Integer - Gas provided for the transaction execution. It will return unused gas.
#' @param gas_price Integer - Value of the gas for this transaction.
#' @param value Integer - Value sent with the transaction.
#' @param nonce  Integer - Value of the nonce. This allows to overwrite your own pending transactions that use the same nonce.
#'
#' @return Data - The transaction hash, or the zero hash if the transaction is not yet available.
#'
#' @examples
#' \donttest{
#' eth_sendTransaction(from = "0xb117a8bc3ecf2c3f006b89da6826e49b4193977a", data = "0x8f8a0d1900000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000002")
#' eth_sendTransaction(from = "0xb117a8bc3ecf2c3f006b89da6826e49b4193977a", to = "0x84159f53c71ef9e8df944225430da49371cbd67b", value = 10)
#' }
#'
#' @export
eth_sendTransaction <- function(from, data = -1, to = -1, gas = 90000, gas_price = -1, value = -1, nonce = -1) {
  params <- list(from = from,
                 gas = dec_to_hex(gas)
  )
  if (data != -1) params = append(params, list(data = data))
  if (to != -1) params = append(params, list(to = to))
  if (gas_price != -1) params = append(params, list(gas_price = gas_price))
  if (value != -1) params = append(params, list(value = dec_to_hex(value)))
  if (nonce != -1) params = append(params, list(nonce = nonce))
  get_post("eth_sendTransaction", list(params))
}

#' Ethereum specific signature
#'
#' \code{eth_sign} returns an Ethereum specific signature with \code{keccak256}.
#'
#' By adding a prefix to the message makes the calculated signature recognisable as an Ethereum specific signature. This prevents misuse where a malicious DApp can sign arbitrary data (e.g. transaction) and use the signature to impersonate the victim. Note the address to sign with must be unlocked.
#'
#' @family eth functions
#'
#' @param address Address - Address of the user.
#' @param message String - Message to sign.
#'
#' @return Data - Signature.
#'
#' @examples
#' \donttest{
#' eth_sign("0xb117a8bc3ecf2c3f006b89da6826e49b4193977a", "hello world")
#' }
#'
#' @export
eth_sign <- function(address, message) {
  get_post("eth_sign", list(address, text_to_hex(message)))
}

#' Mining hashrate submission.
#'
#' \code{eth_submitHashrate} is used for submitting mining hashrate.
#'
#' @family eth functions
#'
#' @param hashrate Integer -  Hashrate to be submitted.
#' @param id Data - A random hexadecimal ID identifying the client.
#'
#' @return Boolean - returns \code{true} if the provided solution is valid, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' eth_submitHashrate(5200050, "0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef")
#' }
#'
#' @export
eth_submitHashrate <- function(hashrate, id) {
  get_post("eth_submitHashrate", list(dec_to_hex(hashrate), id))
}

#' Proof-of-work submission
#'
#' \code{eth_submitWork} is used for submitting a proof-of-work solution.
#'
#' @family eth functions
#'
#' @param nonce Data -  Nonce found.
#' @param pow_hash Data - Header's pow-hash.
#' @param mix_digest Data - Mix digest.
#'
#' @return Boolean - returns \code{true} if the provided solution is valid, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' eth_submitWork("0x0000000000000001", "0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef", "0xD1FE5700000000000000000000000000D1FE5700000000000000000000000000")
#' }
#'
#' @export
eth_submitWork <- function(nonce, pow_hash, mix_digest) {
  get_post("eth_submitWork", list(nonce, pow_hash, mix_digest))
}

#' Sync status.
#'
#' \code{eth_syncing} returns an object with data about the sync status or \code{false}.
#'
#' @family eth functions
#'
#' @return Object|Boolean - An object with sync status data or \code{false}, when not syncing.
#'
#' @examples
#' \donttest{
#' eth_syncing()
#' }
#'
#' @export
eth_syncing <- function() {
  get_post("eth_syncing")
}

#' Filter removal.
#'
#' \code{eth_uninstallFilter} uninstalls a filter with given id. Should always be called when watch is no longer needed.
#'
#' @family eth functions
#'
#' @param id Integer - Filter Id.
#'
#' @return Boolean - \code{true} if the filter can be unistalled, otherwise \code{false}.
#'
#' @examples
#' \donttest{
#' eth_uninstallFilter("0x5f74d97db50bb631ed0efe8b3b3697c8")
#' }
#'
#' @export
eth_uninstallFilter <- function(id) {
  get_post("eth_uninstallFilter", list(id))
}
