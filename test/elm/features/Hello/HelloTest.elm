module Features.Hello.HelloTest (..) where

import ElmTest exposing (..)
import Features.Hello.View exposing (root, updateGreetingMessage)


testUpdateGreetingMessage : Assertion
testUpdateGreetingMessage =
  let
    actual =
      updateGreetingMessage 2

    expected =
      "Hello, World ! !"
  in
    assertEqual expected actual


tests : List Test
tests =
  [ test "Features.Hello.View.updateGreetingMessage" testUpdateGreetingMessage
  ]
