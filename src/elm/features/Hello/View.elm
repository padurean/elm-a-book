module Features.Hello.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String
import Signal exposing (Address)
import Features.Hello.Types exposing (..)


-- TODO OGG: remove (inline the code - just make sure you adapt also the test,
--           which is testing just this)


updateGreetingMessage : Int -> String
updateGreetingMessage counter =
  "Hello, World" ++ (" !" |> String.repeat counter)


root : Address Action -> Model -> Html
root address model =
  div
    [ style styles.wrapper ]
    [ div [] [ span [] [ text (updateGreetingMessage model.counter) ] ]
    , button [ class "", onClick address Increment ] [ text "FTW!" ]
    ]


styles :
  { wrapper : List ( String, String )
  }
styles =
  { wrapper =
      [ ( "text-align", "center" )
      ]
  }
