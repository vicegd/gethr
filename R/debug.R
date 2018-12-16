#' Logging backtrace location.
#'
#' \code{debug_backtraceAt} sets the logging backtrace location. When a backtrace location is set and a log message is emitted at that location, the stack of the goroutine executing the log statement will be printed to stderr.
#'
#' @family debug functions
#'
#' @param path String - Backtrace location.
#'
#' @examples
#' \donttest{
#' debug_backtraceAt("my_server.go:443")
#' }
#'
#' @export
debug_backtraceAt <- function(path) {
  get_post("debug_backtraceAt", list(path))
}

#' Block profiling activation.
#'
#' \code{debug_blockProfile} turns on block profiling for the given duration and writes profile data to disk. It uses a profile rate of 1 for most accurate information.
#'
#' @family debug functions
#'
#' @param file String - File to write the data.
#' @param seconds Integer - Seconds to write the data.
#'
#' @examples
#' \donttest{
#' debug_blockProfile("file.log", 5)
#' }
#'
#' @export
debug_blockProfile <- function(file, seconds) {
  get_post("debug_blockProfile", list(file, seconds))
}

#' CPU profiling activation.
#'
#' \code{debug_cpuProfile} turns on CPU profiling for the given duration and writes profile data to disk.
#'
#' @family debug functions
#'
#' @param file String - File to write the data.
#' @param seconds Integer - Seconds to write the data.
#'
#' @examples
#' \donttest{
#' debug_cpuProfile("file.log", 5)
#' }
#'
#' @export
debug_cpuProfile <- function(file, seconds) {
  get_post("debug_cpuProfile", list(file, seconds))
}

#' State of the block.
#'
#' \code{debug_dumpBlock} retrieves the state that corresponds to the block number and returns a list of accounts (including storage and code).
#'
#' @family debug functions
#'
#' @param number Integer - Number of the block.
#'
#' @return Object - Information of the state (balance, code, hash, nonce, root and storage).
#'
#' @examples
#' \donttest{
#' debug_dumpBlock(15)
#' }
#'
#' @export
debug_dumpBlock <- function(number) {
  get_post("debug_dumpBlock", list(dec_to_hex(number)))
}

#' Garbage collector statistics.
#'
#' \code{debug_gcStats} returns garbage collector statistics.
#'
#' @family debug functions
#'
#' @return Object - Information about the gargabe collector operation.
#'
#' @examples
#' \donttest{
#' debug_gcStats()
#' }
#'
#' @export
debug_gcStats <- function() {
  get_post("debug_gcStats")
}

#' Recursive Length Prefix of the block.
#'
#' \code{debug_getBlockRlp} retrieves and returns the Recursive Length Prefix by number of block.
#'
#' @family debug functions
#'
#' @param number Integer - Number of the block.
#'
#' @return Data - Recursive Length Prefix of the block.
#'
#' @examples
#' \donttest{
#' debug_getBlockRlp(29)
#' }
#'
#' @export
debug_getBlockRlp <- function(number) {
  get_post("debug_getBlockRlp", list(number))
}

#' Go runtime tracing activation.
#'
#' \code{debug_goTrace} turns on Go runtime tracing for the given duration and writes trace data to disk.
#'
#' @family debug functions
#'
#' @param file String - File to write the data.
#' @param seconds Integer - Seconds to write the data.
#'
#' @examples
#' \donttest{
#' debug_goTrace("file.log", 5)
#' }
#'
#' @export
debug_goTrace <- function(file, seconds) {
  get_post("debug_goTrace", list(file, seconds))
}

#' Runtime memory statistics
#'
#' \code{debug_memStats} returns detailed runtime memory statistics.
#'
#' @family debug functions
#'
#' @return Object - Detailed runtime memory statistics.
#'
#' @examples
#' \donttest{
#' debug_memStats()
#' }
#'
#' @export
debug_memStats <- function() {
  get_post("debug_memStats")
}

#' Seed hash of the block
#'
#' \code{debug_seedHash} fetches and retrieves the seed hash of the block by number.
#'
#' @family debug functions
#'
#' @param number Integer - Number of the block.
#'
#' @return Data - Seed hash of the block by number.
#'
#' @examples
#' \donttest{
#' debug_seedHash(29)
#' }
#'
#' @export
debug_seedHash <- function(number) {
  get_post("debug_seedHash", list(number))
}

#' Block profile data collection rate.
#'
#' \code{debug_setBlockProfileRate} sets the rate (in samples/sec) of goroutine block profile data collection.
#'
#' @family debug functions
#'
#' @param rate Integer - Rate of the profiling. A non-zero rate enables block profiling, setting it to zero stops the profile.
#'
#' @examples
#' \donttest{
#' debug_setBlockProfileRate(100)
#' }
#'
#' @export
debug_setBlockProfileRate <- function(rate) {
  get_post("debug_setBlockProfileRate", list(rate))
}

#' Current head of the chain configuration.
#'
#' \code{debug_setHead} sets the current head of the local chain by block number. Note, this is a destructive action and may severely damage your chain. Use with extreme caution.
#'
#' @family debug functions
#'
#' @param number Integer - Number of the block.
#'
#' @examples
#' \donttest{
#' debug_setHead(29)
#' }
#'
#' @export
debug_setHead <- function(number) {
  get_post("debug_setHead", list(number))
}

#' Printer representation of the stacks.
#'
#' \code{debug_stacks} returns a printed representation of the stacks of all goroutines.
#'
#' @family debug functions
#'
#' @return String - Representation of the stacks of all goroutines. Note that the web3 wrapper for this method takes care of the printing and does not return the string.
#'
#' @examples
#' \donttest{
#' debug_stacks()
#' }
#'
#' @export
debug_stacks <- function() {
  get_post("debug_stacks")
}

#' CPU profiling permanent activation.
#'
#' \code{debug_startCPUProfile} turns on CPU profiling indefinitely, writing to the given file.
#'
#' @family debug functions
#'
#' @param file String - File to write the data.
#'
#' @examples
#' \donttest{
#' debug_startCPUProfile("file.log")
#' }
#'
#' @export
debug_startCPUProfile <- function(file) {
  get_post("debug_startCPUProfile", list(file))
}

#' Go runtime trace permanent activation.
#'
#' \code{debug_startGoTrace} starts writing a Go runtime trace to the given file.
#'
#' @family debug functions
#'
#' @param file String - File to write the data.
#'
#' @examples
#' \donttest{
#' debug_startGoTrace("file.log")
#' }
#'
#' @export
debug_startGoTrace <- function(file) {
  get_post("debug_startGoTrace", list(file))
}

#' CPU profiling stop.
#'
#' \code{debug_stopCPUProfile} turns off CPU profiling.
#'
#' @family debug functions
#'
#' @examples
#' \donttest{
#' debug_stopCPUProfile()
#' }
#'
#' @export
debug_stopCPUProfile <- function() {
  get_post("debug_stopCPUProfile")
}

#' Go trace stop.
#'
#' \code{debug_stopGoTrace} turns off Go trace.
#'
#' @family debug functions
#'
#' @examples
#' \donttest{
#' debug_stopGoTrace()
#' }
#'
#' @export
debug_stopGoTrace <- function() {
  get_post("debug_stopGoTrace")
}

#' Full trace of a block.
#'
#' \code{debug_traceBlock} returns a full stack trace of all invoked opcodes of all transaction that were included included in this block.
#'
#' @family debug functions
#'
#' @param block Data - Recursive Length Prefix of the block.
#'
#' @return Object - Full stack trace of the block.
#'
#' @examples
#' \donttest{
#' debug_traceBlock("0xf90217f90212a0a8ebc73b3bf1b5f81f62512d3ebfe349c95d91a3a2171f8f6881b31e2f523000a01dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d4934794b117a8bc3ecf2c3f006b89da6826e49b4193977aa024b20bd98ef519ccde0135d29161a2ffec97cd7a3596679ccb7ff7ab5deaf73ea056e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421a056e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421b9010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000830207001d8349f81980845bfc1f189bda83010811846765746888676f312e31312e318777696e646f7773a0979e83b4cbcc9b0bcec5e5e468fa64dc214724da7dc8a306af11227d70ba9a6788155c0c88c5d3d7d7c0c0")
#' }
#'
#' @export
debug_traceBlock <- function(block) {
  get_post("debug_traceBlock", list(block))
}

#' Full trace of a block by hash.
#'
#' \code{debug_traceBlockByHash} returns a full stack trace of all invoked opcodes of all transaction that were included included in this block.
#'
#' @family debug functions
#'
#' @param hash Data - Block hash.
#'
#' @return Object - Full stack trace of the block.
#'
#' @examples
#' \donttest{
#' debug_traceBlockByHash("0xc41e977760873fbab207d0921bc124edce6ce4044d2718b2bba1ebec45656ffa")
#' }
#'
#' @export
debug_traceBlockByHash <- function(hash) {
  get_post("debug_traceBlockByHash", list(hash))
}

#' Full trace of a block by number.
#'
#' \code{debug_traceBlockByNumber} returns a full stack trace of all invoked opcodes of all transaction that were included included in this block.
#'
#' @family debug functions
#'
#' @param number Integer - Block number.
#'
#' @return Object - Full stack trace of the block.
#'
#' @examples
#' \donttest{
#' debug_traceBlockByNumber(43337)
#' }
#'
#' @export
debug_traceBlockByNumber <- function(number) {
  get_post("debug_traceBlockByNumber", list(dec_to_hex(number)))
}

#' Full trace of a block using a file as input.
#'
#' \code{debug_traceBlockFromFile} return a full stack trace of all invoked opcodes of all transaction that were included included in this block.
#'
#' @family debug functions
#'
#' @param file String - File containing the Recursive Length Prefix of the block.
#'
#' @return Object - Full stack trace of the block.
#'
#' @examples
#' \donttest{
#' debug_traceBlockFromFile("rlp.log")
#' }
#'
#' @export
debug_traceBlockFromFile <- function(file) {
  get_post("debug_traceBlockFromFile", list(file))
}

#' Transaction tracing.
#'
#' \code{debug_traceTransaction} attempts to run the transaction in the exact same manner as it was executed on the network. It will replay any transaction that may have been executed prior to this one before it will finally attempt to execute the transaction that corresponds to the given hash.
#'
#' @family debug functions
#'
#' @param hash Data - Hash of the transaction.
#' @param disableStorage Boolean - Setting this to \code{true} will disable storage capture (default = \code{false}).
#' @param disableMemory Boolean - Setting this to \code{true} will disable memory capture (default = \code{false})
#' @param disableStack Boolean - Setting this to \code{true} will disable stack capture (default = \code{false})
#' @param tracer String - Setting this will enable JavaScript-based transaction tracing. If set, the previous arguments will be ignored.
#' @param timeout String -  Overrides the default timeout of 5 seconds for JavaScript-based tracing calls.
#'
#' @return Object - Full trace of the transaction.
#'
#' @examples
#' \donttest{
#' debug_traceTransaction("0xe45f738135240ce9cedc58b21148ef424704e5c86798990a5a36cb1ca4c5c3f4")
#' debug_traceTransaction("0xe45f738135240ce9cedc58b21148ef424704e5c86798990a5a36cb1ca4c5c3f4", disableStorage = TRUE, disableStack = TRUE)
#' }
#'
#' @export
debug_traceTransaction <- function(hash, disableStorage = NULL, disableMemory = NULL, disableStack = NULL, tracer = NULL, timeout = NULL) {
  params <- list()
  if (!is.null(disableStorage)) params = append(params, list(disableStorage = disableStorage))
  if (!is.null(disableMemory)) params = append(params, list(disableMemory = disableMemory))
  if (!is.null(disableStack)) params = append(params, list(disableStack = disableStack))
  if (!is.null(tracer)) params = append(params, list(tracer = tracer))
  if (!is.null(timeout)) params = append(params, list(timeout = timeout))
  if (length(params) == 0) {
    get_post("debug_traceTransaction", list(hash))
  }
  else {
    get_post("debug_traceTransaction", list(hash, params))
  }
}

#' Logging verbosity.
#'
#' \code{debug_verbosity} sets the logging verbosity ceiling. Log messages with level up to and including the given level will be printed.
#'
#' @family debug functions
#'
#' @param level Integer - File containing the Recursive Length Prefix of the block.
#'
#' @examples
#' \donttest{
#' debug_verbosity(5)
#' }
#'
#' @export
debug_verbosity <- function(level) {
  get_post("debug_verbosity", list(level))
}

#' Logging verbosity by pattern.
#'
#' \code{debug_vmodule} sets the logging verbosity pattern.
#'
#' @family debug functions
#'
#' @param pattern String - Pattern used to indicate the verbosity.
#'
#' @examples
#' \donttest{
#' debug_vmodule("eth/*=4")
#' debug_vmodule("p2p=5")
#' }
#'
#' @export
debug_vmodule <- function(pattern) {
  get_post("debug_vmodule", list(pattern))
}

#' Goroutine blocking profile to file.
#'
#' \code{debug_writeBlockProfile} writes a goroutine blocking profile to the given file.
#'
#' @family debug functions
#'
#' @param file String - File to write the data.
#'
#' @examples
#' \donttest{
#' debug_writeBlockProfile("file.log")
#' }
#'
#' @export
debug_writeBlockProfile <- function(file) {
  get_post("debug_writeBlockProfile", list(file))
}

#' Allocation profile to file.
#'
#' \code{debug_writeMemProfile} writes an allocation profile to the given file.
#'
#' @family debug functions
#'
#' @param file String - File to write the data.
#'
#' @examples
#' \donttest{
#' debug_writeMemProfile("file.log")
#' }
#'
#' @export
debug_writeMemProfile <- function(file) {
  get_post("debug_writeMemProfile", list(file))
}
