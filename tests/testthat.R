#?testthat::skip_on_cran for details
if (requireNamespace("testthat", quietly = TRUE)) {
  testthat::test_check("gethr")
}
