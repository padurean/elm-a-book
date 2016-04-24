module Features.Toc.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (..)

import Dict exposing (Dict)
import Signal exposing (Address)
import Features.Toc.Types exposing (..)
import Features.Toc.State as State
import Features.Chapter.View as ChapterView


root : Address Action -> Model -> Html
root address model =
  let
    pipeBackAddress chapterId =
      Signal.forwardTo address (DispatchToChapter chapterId)
  in
    case model.focused of
      Just chapterId ->
        let
          chapterMaybe =
            Dict.get chapterId model.chapters

          chapter =
            Maybe.withDefault (State.chapterNotFound chapterId) chapterMaybe
        in
          ChapterView.root (pipeBackAddress chapter.id) chapter

      Nothing ->
        ul
          [ style styles.postList ]
          (List.map (\chapter -> ChapterView.root (pipeBackAddress chapter.id) chapter) (Dict.values model.chapters))


styles :
  { postList : List ( String, String )
  , post :
      { title : List ( String, String )
      , date : List ( String, String )
      , desc : List ( String, String )
      }
  }
styles =
  { postList =
      [ ( "text-align", "left" )
      , ( "color", "#990" )
      ]
  , post =
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
