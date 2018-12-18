#' Decimal to hexadecimal conversion.
#'
#' \code{dec_to_hex} returns the value in hexadecimal.
#'
#' @family utils functions
#'
#' @param number Integer - Value in decimal.
#'
#' @return Data - Value in hexadecimal.
#'
#' @examples
#' dec_to_hex(50)
#'
#' @export
dec_to_hex <- function(number) {
    sprintf("0x%x", number)
}

#' ID of the network.
#'
#' \code{get_network_id} returns the ID of the network that is being used.
#'
#' @family utils functions
#'
#' @return String - Network ID.
#'
#' @examples
#' get_network_id()
#'
#' @export
get_network_id <- function() {
  gethr_env$id
}

#' RPC call helper method.
#'
#' \code{get_post} returns the response of the RPC call in the Geth node.
#'
#' @family utils functions
#'
#' @param method String - Method to call in the Geth node.
#' @param params Array of Strings - Params that are passed to the method.
#'
#' @return Object - Response from the Geth node.
#'
#' @examples
#' \donttest{
#' get_post('eth_accounts')
#' get_post('debug_verbosity', list(3))
#' get_post('debug_goTrace', list('file.log', 5))
#' }
#'
#' @export
get_post <- function(method, params = list()) {
    body = list(jsonrpc = "2.0", method = method, params = params, id = gethr_env$id)
    body_json = jsonlite::toJSON(body, auto_unbox = TRUE, pretty = TRUE)
    # print(body_json)
    response = httr::POST(url = gethr_env$rpc_address, httr::content_type_json(), body = body_json)
    response_parsed = httr::content(response, "parsed")
    if (!is.null(response_parsed$result))
        return(response_parsed$result) else {
        return(response_parsed)
    }
}

#' RPC address of the node.
#'
#' \code{get_rpc_address} returns the RPC address that is being used to connect
#' to the Geth node.
#'
#' @family utils functions
#'
#' @return String - RPC Address.
#'
#' @examples
#' get_rpc_address()
#'
#' @export
get_rpc_address <- function() {
    gethr_env$rpc_address
}

#' Hexadecimal to decimal conversion.
#'
#' \code{hex_to_dec} returns the value in decimal.
#'
#' @family utils functions
#'
#' @param hex Data - Value in hexadecimal.
#'
#' @return Integer - Value in decimal.
#'
#' @examples
#' hex_to_dec('0x28')
#' hex_to_dec('0xd9190')
#'
#' @export
hex_to_dec <- function(hex) {
    result = tryCatch({
        value = as.double(sprintf("%.2f", as.double(hex)))
        if (.Machine$integer.max > value) {
            if (as.integer(value) == value) {
                return(as.integer(value))
            } else {
                return(value)
            }
        } else {
            return(value)
        }
    }, error = function(error_condition) {
        result = hex
    })
    return(result)
}

#' Hexadecimal to string conversion.
#'
#' \code{hex_to_text} returns the plain text.
#'
#' @family utils functions
#'
#' @param msg Data - Value in hexadecimal.
#'
#' @return String - Value in plain text.
#'
#' @examples
#' hex_to_text('0x68656c6c6f20776f726c64')
#'
#' @export
hex_to_text <- function(msg) {
    msg = substr(msg, 3, nchar(msg))
    if (msg != "") {
        hex <- sapply(seq(1, nchar(as.character(msg)), by = 2), function(x) {
            substr(msg, x, x + 1)
        })
        hex <- subset(hex, !hex == "00")
        msg <- gsub("[^[:print:]]+", "", rawToChar(as.raw(strtoi(hex, 16L))))
    }
    msg
}

#' Whole numbers identification.
#'
#' \code{is.wholenumber} returns whether a value is a whole number.
#'
#' @family utils functions
#'
#' @param x Data - Element to check whether it is a whole number.
#' @param tol Double - Range to determine if the number is a whole number.
#'
#' @return Boolean - \code{true} if the input is a whole number, \code{false}
#'   otherwise.
#'
#' @examples
#' is.wholenumber(20)
#' is.wholenumber(20.3)
#' is.wholenumber('no')
#'
#' @export
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) {
    if (is.numeric(x)) {
        abs(x - round(x)) < tol
    } else {
        FALSE
    }
}

#' Values of the blocks in plain text or decimal instead of hexadecimal.
#'
#' \code{process_block} returns the values of the block in plain text or decimal
#' if possible. The values are obtained from the Geth node.
#'
#' @family utils functions
#'
#' @param block Objects - Information of the block in hexadecimal.
#'
#' @return Object - Information of the block with values in plain text or
#'   decimal if possible.
process_block <- function(block) {
    block$difficulty <- hex_to_dec(block$difficulty)
    block$gasLimit <- hex_to_dec(block$gasLimit)
    block$gasUsed <- hex_to_dec(block$gasUsed)
    block$logsBloom <- hex_to_text(block$logsBloom)
    block$number <- hex_to_dec(block$number)
    block$size <- hex_to_dec(block$size)
    block$timestamp <- hex_to_dec(block$timestamp)
    block$dateTime <- as.POSIXct(block$timestamp, origin = "1970-01-01")
    print(block$totalDifficulty)
    block$totalDifficulty <- hex_to_dec(block$totalDifficulty)
    return(block)
}

#' Values of the logs in decimal instead of hexadecimal.
#'
#' \code{process_block} returns the values of the log in decimal if possible.
#' The values are obtained from the Geth node.
#'
#' @family utils functions
#'
#' @param log Objects - Information of the log in hexadecimal.
#'
#' @return Object - Information of the log with values in decimal if possible.
process_log <- function(log) {
    log$logIndex <- hex_to_dec(log$logIndex)
    log$blockNumber <- hex_to_dec(log$blockNumber)
    log$transactionIndex <- hex_to_dec(log$transactionIndex)
    return(log)
}

#' Values of the receipts in plain text or decimal instead of hexadecimal.
#'
#' \code{process_block} returns the values of the receipts in plain text or
#' decimal if possible. The values are obtained from the Geth node.
#'
#' @family utils functions
#'
#' @param receipt Objects - Information of the receipt in hexadecimal.
#'
#' @return Object - Information of the receipt with values in plain text or
#'   decimal if possible.
process_receipt <- function(receipt) {
    receipt$blockNumber <- hex_to_dec(receipt$blockNumber)
    receipt$cumulativeGasUsed <- hex_to_dec(receipt$cumulativeGasUsed)
    receipt$gasUsed <- hex_to_dec(receipt$gasUsed)
    receipt$logsBloom <- hex_to_text(receipt$logsBloom)
    receipt$status <- hex_to_dec(receipt$status)
    receipt$transactionIndex <- hex_to_dec(receipt$transactionIndex)
    return(receipt)
}

#' Values of the transactions in plain text or decimal instead of hexadecimal.
#'
#' \code{process_block} returns the values of the transactions in plain text or
#' decimal if possible. The values are obtained from the Geth node.
#'
#' @family utils functions
#'
#' @param trans Objects - Information of the transaction in hexadecimal.
#'
#' @return Object - Information of the transaction with values in plain text or
#'   decimal if possible.
process_transaction <- function(trans) {
    trans$blockNumber <- hex_to_dec(trans$blockNumber)
    trans$gas <- hex_to_dec(trans$gas)
    trans$gasPrice <- hex_to_dec(trans$gasPrice)
    trans$input <- hex_to_text(trans$input)
    trans$nonce <- hex_to_dec(trans$nonce)
    trans$transactionIndex <- hex_to_dec(trans$transactionIndex)
    trans$value <- hex_to_dec(trans$value)
    trans$v <- hex_to_dec(trans$v)
    return(trans)
}

#' ID of the network update.
#'
#' \code{set_network_id} sets the ID of the network that is being used.
#'
#' @family utils functions
#'
#' @param id String|Integer - ID of the network.
#'
#' @examples
#' set_network_id(7000)
#' set_network_id("my_network_id")
#'
#' @export
set_network_id <- function(id) {
  gethr_env$id <- id
}

#' Query of the RPC address of the node.
#'
#' \code{set_rpc_address} sets the RPC address that is being used to connect to
#' the Geth node.
#'
#' @family utils functions
#'
#' @param url String - URL of the Geth node.
#' @param port Integer - Port of the Geth node.
#'
#' @examples
#' set_rpc_address('http://153.35.91.1', 8600)
#' set_rpc_address('http://localhost', 8545)
#'
#' @export
set_rpc_address <- function(url, port) {
  url <- paste(url, port, sep = ":")
  gethr_env$rpc_address <- url
}

#' String to hexadecimal conversion.
#'
#' \code{text_to_hex} returns the hexadecimal.
#'
#' @family utils functions
#'
#' @param text String - Value in plain text.
#'
#' @return Data - Value in hexadecimal.
#'
#' @examples
#' text_to_hex('hello world')
#'
#' @export
text_to_hex <- function(text) {
    raw = charToRaw(text)
    as_chars = as.character(raw)
    as_char = paste(as_chars, collapse = "")
    paste("0x", as_char, sep = "")
}
