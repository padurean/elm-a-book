module Features.Chapter.Types (..) where

import Html exposing (Html)


type alias Model =
  { id : Int
  , title : String
  , date : String
  , desc : String
  , md : String
  , cache : Maybe Html
  , focused : Bool
  }


type Action
  = Focus
  | Blur
