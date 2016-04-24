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
    , span [] [ text (copyrightMessage model) ]
    ]


copyrightMessage : Model -> String
copyrightMessage model =
  "© Inna di Footer, " ++ model


styles :
  { footer : List ( String, String )
  }
styles =
  { footer =
      [ ( "text-align", "center" )
      , ( "color", "#FF0" )
      ]
  }
