module Features.Chapter.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Signal exposing (Address)
import Features.Chapter.Types exposing (..)
import Utils.Events exposing (onLinkClick)


root : Address Action -> Model -> Html
root address model =
  if model.focused then
    focusedView address model
  else
    blurredView address model


blurredView : Address Action -> Model -> Html
blurredView address model =
  div
    []
    [ li
        []
        [ a
            [ href ""
            , onLinkClick address Focus
            , style styles.blurred.title
            ]
            [ text model.title
            ]
        , span [ style styles.blurred.date ] [ text model.date ]
        , p [ style styles.blurred.desc ] [ text model.desc ]
        ]
    ]


focusedView : Address Action -> Model -> Html
focusedView address model =
  div
    []
    [ div
        []
        [ a
            [ href ""
            , onLinkClick address Blur
            ]
            [ text "ToC" ]
        ]
    , div
        []
        [ h3 [ style styles.focused.title ] [ text model.title ]
        , span [ style styles.focused.date ] [ text model.date ]
        , div
            [ style styles.focused.md ]
            [ Maybe.withDefault (chapterNotFound model.title) model.cache
            ]
        ]
    ]


chapterNotFound : String -> Html
chapterNotFound title =
  p
    []
    [ text "Chapter \""
    , span [ style [ ( "color", "orange" ) ] ] [ text title ]
    , text "\" not found :("
    ]


styles :
  { focused :
      { title : List ( String, String )
      , date : List ( String, String )
      , md : List ( String, String )
      }
  , blurred :
      { title : List ( String, String )
      , date : List ( String, String )
      , desc : List ( String, String )
      }
  }
styles =
  { focused =
      { title =
          [ ( "font-weight", "bold" )
          ]
      , date =
          [ ( "font-style", "italic" )
          , ( "color", "grey" )
          ]
      , md =
          [ ( "color", "#666" )
          ]
      }
  , blurred =
      { title =
          [ ( "font-weight", "bold" )
          , ( "display", "block" )
          , ( "font-size", "1.25rem" )
          ]
      , date =
          [ ( "font-style", "italic" )
          , ( "color", "grey" )
          ]
      , desc =
          [ ( "color", "#666" )
          ]
      }
  }
