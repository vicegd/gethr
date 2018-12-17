gethr_env <- new.env()
gethr_env$rpc_address <- "http://localhost:8545"
gethr_env$id <- 1
gethr_env$ether <- factor(c("wei", "kwei", "mwei", "gwei", "szabo", "finney", "ether", "kether", "mether", "gether", 
    "tether"))
