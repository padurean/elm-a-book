module Features.Header.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (..)

import Signal exposing (Address)
import Features.Header.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  header
    [ style styles.header ]
    [ span [] [ text (headerMessage model) ]
    ]


headerMessage : Model -> String
headerMessage model =
  "Inna di Header, " ++ model


styles :
  { header : List ( String, String )
  }
styles =
  { header =
      [ ( "text-align", "center" )
      , ( "color", "lightblue" )
      ]
  }
