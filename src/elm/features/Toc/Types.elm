module Features.Toc.Types (..) where

-- import Html exposing (..)

import Dict exposing (Dict)
import Features.Chapter.Types as Chapter


type alias Model =
  { chapters : Dict Int Chapter.Model
  , focused : Maybe Int
  }


type Action
  = NoOp
  | DispatchToChapter Int Chapter.Action
