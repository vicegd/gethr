#' Conversion to Wei.
#'
#' \code{ether.toWei} returns the value of the cryptocurrency in Wei.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Wei.
#'
#' @examples
#' ether.toWei(50, 'ether')
#'
#' @export
ether.toWei <- function(amount, type) {
    switch(type, wei = amount, kwei = amount * 10^3, mwei = amount * 10^6, gwei = amount * 10^9, szabo = amount * 10^12, finney = amount * 10^15, 
        ether = amount * 10^18, kether = amount * 10^21, mether = amount * 10^24, gether = amount * 10^27, tether = amount * 10^30, NULL)
}

#' Conversion to Kwei.
#'
#' \code{ether.toKwei} returns the value of the cryptocurrency in Kwei.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Kwei.
#'
#' @examples
#' ether.toKwei(50, 'ether')
#'
#' @export
ether.toKwei <- function(amount, type) {
    switch(type, wei = amount/10^3, kwei = amount, mwei = amount * 10^3, gwei = amount * 10^6, szabo = amount * 10^9, finney = amount * 10^12, ether = amount * 
        10^15, kether = amount * 10^18, mether = amount * 10^21, gether = amount * 10^24, tether = amount * 10^27, NULL)
}

#' Conversion to Mwei.
#'
#' \code{ether.toMei} returns the value of the cryptocurrency in Mwei.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Mwei.
#'
#' @examples
#' ether.toMwei(50, 'ether')
#'
#' @export
ether.toMwei <- function(amount, type) {
    switch(type, wei = amount/10^6, kwei = amount/10^3, mwei = amount, gwei = amount * 10^3, szabo = amount * 10^6, finney = amount * 10^9, ether = amount * 
        10^12, kether = amount * 10^15, mether = amount * 10^18, gether = amount * 10^21, tether = amount * 10^24, NULL)
}

#' Conversion to Gwei.
#'
#' \code{ether.toGwei} returns the value of the cryptocurrency in Gwei.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Gwei.
#'
#' @examples
#' ether.toGwei(50, 'ether')
#'
#' @export
ether.toGwei <- function(amount, type) {
    switch(type, wei = amount/10^9, kwei = amount/10^6, mwei = amount/10^3, gwei = amount, szabo = amount * 10^3, finney = amount * 10^6, ether = amount * 
        10^9, kether = amount * 10^12, mether = amount * 10^15, gether = amount * 10^18, tether = amount * 10^21, NULL)
}

#' Conversion to Szabo.
#'
#' \code{ether.toSzabo} returns the value of the cryptocurrency in Szabo.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Szabo.
#'
#' @examples
#' ether.toSzabo(50, 'ether')
#'
#' @export
ether.toSzabo <- function(amount, type) {
    switch(type, wei = amount/10^12, kwei = amount/10^9, mwei = amount/10^6, gwei = amount/10^3, szabo = amount, finney = amount * 10^3, ether = amount * 
        10^6, kether = amount * 10^9, mether = amount * 10^12, gether = amount * 10^15, tether = amount * 10^18, NULL)
}

#' Conversion to Finney.
#'
#' \code{ether.toFinney} returns the value of the cryptocurrency in Finney.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Finney.
#'
#' @examples
#' ether.toFinney(50, 'ether')
#'
#' @export
ether.toFinney <- function(amount, type) {
    switch(type, wei = amount/10^15, kwei = amount/10^12, mwei = amount/10^9, gwei = amount/10^6, szabo = amount/10^3, finney = amount, ether = amount * 
        10^3, kether = amount * 10^6, mether = amount * 10^9, gether = amount * 10^12, tether = amount * 10^15, NULL)
}

#' Conversion to Ether.
#'
#' \code{ether.toEther} returns the value of the cryptocurrency in Ether.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Ether.
#'
#' @examples
#' ether.toEther(50, 'wei')
#'
#' @export
ether.toEther <- function(amount, type) {
    switch(type, wei = amount/10^18, kwei = amount/10^15, mwei = amount/10^12, gwei = amount/10^9, szabo = amount/10^6, finney = amount/10^3, ether = amount, 
        kether = amount * 10^3, mether = amount * 10^6, gether = amount * 10^9, tether = amount * 10^12, NULL)
}

#' Conversion to Kether.
#'
#' \code{ether.toKether} returns the value of the cryptocurrency in Kether.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Kether.
#'
#' @examples
#' ether.toKether(50, 'ether')
#'
#' @export
ether.toKether <- function(amount, type) {
    switch(type, wei = amount/10^21, kwei = amount/10^18, mwei = amount/10^15, gwei = amount/10^12, szabo = amount/10^9, finney = amount/10^6, ether = amount/10^3, 
        kether = amount, mether = amount * 10^3, gether = amount * 10^6, tether = amount * 10^9, NULL)
}

#' Conversion to Mether.
#'
#' \code{ether.toMether} returns the value of the cryptocurrency in Mether.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Mether.
#'
#' @examples
#' ether.toMether(50, 'ether')
#'
#' @export
ether.toMether <- function(amount, type) {
    switch(type, wei = amount/10^24, kwei = amount/10^21, mwei = amount/10^18, gwei = amount/10^15, szabo = amount/10^12, finney = amount/10^9, ether = amount/10^6, 
        kether = amount/10^3, mether = amount, gether = amount * 10^3, tether = amount * 10^6, NULL)
}

#' Conversion to Gether.
#'
#' \code{ether.toGether} returns the value of the cryptocurrency in Gether.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Gether.
#'
#' @examples
#' ether.toGether(50, 'ether')
#'
#' @export
ether.toGether <- function(amount, type) {
    switch(type, wei = amount/10^27, kwei = amount/10^24, mwei = amount/10^21, gwei = amount/10^18, szabo = amount/10^15, finney = amount/10^12, 
        ether = amount/10^9, kether = amount/10^6, mether = amount/10^3, gether = amount, tether = amount * 10^3, NULL)
}

#' Conversion to Tether.
#'
#' \code{ether.toTether} returns the value of the cryptocurrency in Tether.
#'
#' @family ether functions
#'
#' @param amount Integer - Amount of the cryptocurrency to convert from.
#' @param type String - Unit of the cryptocurrency to convert from: wei, kwei,
#'   mwei, gwei, szabo, finney, ether, kether, mether, gether or tether.
#'
#' @return Integer - Value in Tether.
#'
#' @examples
#' ether.toTether(50, 'ether')
#'
#' @export
ether.toTether <- function(amount, type) {
    switch(type, wei = amount/10^30, kwei = amount/10^27, mwei = amount/10^24, gwei = amount/10^21, szabo = amount/10^18, finney = amount/10^15, 
        ether = amount/10^12, kether = amount/10^9, mether = amount/10^6, gether = amount/10^3, tether = amount, NULL)
}
