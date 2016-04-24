module Features.Chapter.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Signal exposing (Address)
import Features.Chapter.Types exposing (..)
import Common.Utils.Events exposing (onLinkClick)


root : Address Action -> Model -> Html
root address model =
  if model.focused then
    focusedView address model
  else
    blurredView address model


blurredView : Address Action -> Model -> Html
blurredView address model =
  div
    [ style styles.blurred.wrapper ]
    [ a
        [ href ""
        , onLinkClick address Focus
        , style styles.blurred.title
        ]
        [ i
            [ class "fa fa-bookmark-o fa-lg"
            , style styles.blurred.chapterIcon
            ]
            []
        , text model.title
        ]
    , span [ style styles.blurred.date ] [ text model.date ]
    , p [ style styles.blurred.desc ] [ text model.desc ]
    ]


focusedView : Address Action -> Model -> Html
focusedView address model =
  div
    [ style styles.focused.wrapper ]
    [ div
        []
        [ a
            [ href ""
            , onLinkClick address Blur
            ]
            [ i
                [ class "fa fa-list-alt fa-lg"
                , style styles.focused.tocIcon
                ]
                []
            , text "ToC"
            ]
        ]
    , div
        [ style styles.focused.chapterWrapper ]
        [ span [ style styles.focused.title ] [ text model.title ]
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
      { wrapper : List ( String, String )
      , chapterWrapper : List ( String, String )
      , title : List ( String, String )
      , date : List ( String, String )
      , md : List ( String, String )
      , tocIcon : List ( String, String )
      }
  , blurred :
      { wrapper : List ( String, String )
      , title : List ( String, String )
      , date : List ( String, String )
      , desc : List ( String, String )
      , chapterIcon : List ( String, String )
      }
  }
styles =
  { focused =
      { wrapper =
          []
      , chapterWrapper =
          [ ( "margin-top", "2rem" )
          ]
      , title =
          [ ( "display", "block" )
          , ( "font-size", "1.25rem" )
          , ( "color", "#92C86B" )
          ]
      , date =
          [ ( "display", "inline-block" )
          , ( "font-style", "italic" )
          , ( "color", "grey" )
          , ( "margin", ".25rem 0 0 0" )
          ]
      , md =
          [ ( "margin-top", "3rem" ) ]
      , tocIcon =
          [ ( "display", "inline-block" )
          , ( "margin-right", ".5rem" )
          , ( "font-size", "1.25rem" )
          ]
      }
  , blurred =
      { wrapper =
          [ ( "margin-bottom", "3rem" )
          ]
      , title =
          [ ( "display", "block" )
          , ( "font-size", "1.25rem" )
          ]
      , date =
          [ ( "display", "inline-block" )
          , ( "font-style", "italic" )
          , ( "color", "grey" )
          , ( "margin", ".25rem 0 0 0" )
          ]
      , desc =
          [ ( "margin-top", ".5rem" )
          ]
      , chapterIcon =
          [ ( "display", "inline-block" )
          , ( "margin-right", ".5rem" )
          , ( "font-size", "1.5rem" )
          ]
      }
  }
