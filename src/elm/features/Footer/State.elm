module Features.Footer.State (..) where

import Effects exposing (Effects)
import Features.Footer.Types exposing (..)


initialState : ( Model, Effects Action )
initialState =
  ( "Unknown Boss!"
  , Effects.none
  )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NoOp ->
      ( model
      , Effects.none
      )
