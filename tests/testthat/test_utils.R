library(testthat)
library(gethr)
context("utils functions")

test_that("hexadecimal values can be converted to decimal", {
  expect_equal(hex_to_dec("0x0"), 0)
})

test_that("hexadecimal can be converted to string", {
  expect_equal(hex_to_text("0x68656c6c6f"), "hello")
})

test_that("decimal values can be converted to hexadecimal", {
  expect_equal(dec_to_hex(0), "0x0")
})

test_that("string can be converted to hexadecimal", {
  expect_equal(text_to_hex("hello"), "0x68656c6c6f")
  expect_false(text_to_hex("hello") == "0x68656c6c2f")
})

test_that("whole numbers are identified", {
  expect_equal(is.wholenumber(2), TRUE)
  expect_equal(is.wholenumber(10^14), TRUE)
  expect_equal(is.wholenumber(2.99), FALSE)
  expect_equal(is.wholenumber("hello"), FALSE)
  expect_equal(is.wholenumber(TRUE), FALSE)
})
