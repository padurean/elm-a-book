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
    , text "\x00a0\x00a0\x00a0\x00a0\x00a0"
    , span
      [ style [("color", "grey")]
      ]
      [ a
          [ href "https://github.com/padurean/elm-a-book"
          , style [("color", "#8F8F8F"), ("white-space", "nowrap") ]
          ]
          [ i
              [ class "fa fa-code-fork fa-lg"
              , style [("color", "#00aba5"), ("font-size", "1.15rem")]
              ]
              []
          , span
            [ style [("border-bottom", "dotted 1px #777"), ("font-size", ".75rem")]
            ]
            [ text " Fork me on GitHub"
            ]
          ]
      ]
    ]


styles :
  { footer : List ( String, String )
  , logo : List ( String, String )
  , logoType : List ( String, String )
  }
styles =
  { footer =
      [ ( "font-size", ".85rem" )
      , ( "color", "grey" )
      ]
  , logo =
      [ ( "display", "inline-block" )
      , ( "font-family", "\"Hack\", \"monoscpace\"" )
      , ("margin-bottom", "1rem")
      ]
  , logoType =
      [ ("font-size", "1.15rem")
      , ("color", "#5D80E0")
      , ("display", "inline-block")
      , ("margin-right", ".35rem")
      ]
  }
