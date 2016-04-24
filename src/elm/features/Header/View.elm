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
    [ span
        [ style styles.logo ]
        [ span [ style [ ( "color", "#E03C37" ) ] ] [ text "Elm" ]
        , span [ style [ ( "color", "#D05DB4" ) ] ] [ text " - " ]
        , span [ style [ ( "color", "#D48F59" ) ] ] [ text "A" ]
        , span [ style [ ( "color", "#5D80E0" ) ] ] [ text " - " ]
        , span [ style [ ( "color", "#49BE54" ) ] ] [ text "Book" ]
        ]
    ]


styles :
  { header : List ( String, String )
  , logo : List ( String, String )
  }
styles =
  { header =
      []
  , logo =
      [ ( "font-size", "1.5rem" )
      , ( "display", "inline-block" )
      ]
  }
