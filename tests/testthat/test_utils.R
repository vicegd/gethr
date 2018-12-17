context("utils functions")

if (requireNamespace("testthat", quietly = TRUE)) {
testthat::test_that("hexadecimal values can be converted to decimal", {
  testthat::expect_equal(hex_to_dec("0x0"), 0)
})

testthat::test_that("hexadecimal can be converted to string", {
  testthat::expect_equal(hex_to_text("0x68656c6c6f"), "hello")
})

testthat::test_that("decimal values can be converted to hexadecimal", {
  testthat::expect_equal(dec_to_hex(0), "0x0")
})

testthat::test_that("string can be converted to hexadecimal", {
  testthat::expect_equal(text_to_hex("hello"), "0x68656c6c6f")
  testthat::expect_false(text_to_hex("hello") == "0x68656c6c2f")
})

testthat::test_that("whole numbers are identified", {
  testthat::expect_equal(is.wholenumber(2), TRUE)
  testthat::expect_equal(is.wholenumber(10^14), TRUE)
  testthat::expect_equal(is.wholenumber(2.99), FALSE)
  testthat::expect_equal(is.wholenumber("hello"), FALSE)
  testthat::expect_equal(is.wholenumber(TRUE), FALSE)
})
}
