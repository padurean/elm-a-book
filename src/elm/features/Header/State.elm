module Features.Header.State (..) where

import Effects exposing (Effects)
import Features.Header.Types exposing (..)


initialState : ( Model, Effects Action )
initialState =
  ( "Unknown Master!"
  , Effects.none
  )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NoOp ->
      ( model
      , Effects.none
      )
