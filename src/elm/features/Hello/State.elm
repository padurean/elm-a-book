module Features.Hello.State (..) where

import Effects exposing (Effects)
import Features.Hello.Types exposing (..)


initialState : ( Model, Effects Action )
initialState =
  ( { counter = 0 }
  , Effects.none
  )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NoOp ->
      ( model
      , Effects.none
      )

    Increment ->
      let
        nextCounter =
          model.counter + 1

        updatedModel =
          { model | counter = nextCounter }
      in
        ( updatedModel
        , Effects.none
        )
