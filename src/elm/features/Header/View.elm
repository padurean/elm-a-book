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
        [ i
            [ class "fa fa-book fa-lg"
            , style styles.logoType
            ]
            []
        , span [ style [ ( "color", "#E03C37" ) ] ] [ text "Elm" ]
        , span [ style [ ( "color", "#D05DB4" ) ] ] [ text "-" ]
        , span [ style [ ( "color", "#D48F59" ) ] ] [ text "A" ]
        , span [ style [ ( "color", "#5D80E0" ) ] ] [ text "-" ]
        , span [ style [ ( "color", "#49BE54" ) ] ] [ text "Book" ]
        ]
    ]


styles :
  { header : List ( String, String )
  , logo : List ( String, String )
  , logoType : List ( String, String )
  }
styles =
  { header =
      []
  , logo =
      [ ( "font-size", "1.5rem" )
      , ( "font-family", "\"Hack\", \"monoscpace\"" )
      , ( "display", "inline-block" )
      ]
  , logoType =
      [ ("font-size", "2rem")
      , ("color", "#5D80E0")
      , ("display", "inline-block")
      , ("margin-right", ".75rem")
      ]
  }
