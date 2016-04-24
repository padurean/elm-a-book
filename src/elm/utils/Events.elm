module Utils.Events (..) where

import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import Json.Decode as Json
import Signal exposing (Address)


onLinkClick : Address a -> a -> Attribute
onLinkClick address action =
  let
    opts =
      { stopPropagation = False
      , preventDefault = True
      }
  in
    onWithOptions "click" opts Json.value (\_ -> Signal.message address action)
