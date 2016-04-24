module Features.Footer.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (..)

import Signal exposing (Address)
import Features.Footer.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  footer
    [ style styles.footer ]
    [ span [ attribute "id" "footer-year" ] []
    , span
        [ style styles.logo ]
        [ span [ style [ ( "color", "#E03C37" ) ] ] [ text "Elm" ]
        , span [ style [ ( "color", "#D05DB4" ) ] ] [ text " - " ]
        , span [ style [ ( "color", "#D48F59" ) ] ] [ text "A" ]
        , span [ style [ ( "color", "#5D80E0" ) ] ] [ text " - " ]
        , span [ style [ ( "color", "#49BE54" ) ] ] [ text "Book" ]
        ]
    ]


copyrightMessage : Model -> String
copyrightMessage model =
  "© Inna di Footer, " ++ model


styles :
  { footer : List ( String, String )
  , logo : List ( String, String )
  }
styles =
  { footer =
      [ ( "font-size", ".85rem" )
      , ( "color", "grey" )
      ]
  , logo =
      [ ( "display", "inline-block" )
      ]
  }
