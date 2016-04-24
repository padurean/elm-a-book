module Main (..) where

import Task
import Console
import ElmTest exposing (..)
import Features.Hello.HelloTest as HelloTest


tests : Test
tests =
  suite
    "Main Test Suite"
    HelloTest.tests



-- Examples:
-- [
-- test "Addition" (assertEqual (3 + 7) 10)
-- , test "String.left" (assertEqual "a" (String.left 1 "abcdefg"))
-- replace True with False to make it fail
-- , test "This test should NOT fail" (assert True)
-- ]


port runner : Signal (Task.Task x ())
port runner =
  Console.run (consoleRunner tests)
