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
        let
          chapters =
            Dict.values model.chapters

          chapterView chapter =
            li
              []
              [ (ChapterView.root (pipeBackAddress chapter.id) chapter)
              ]
        in
          ul
            [ style styles.postList ]
            (List.map chapterView chapters)


styles :
  { postList : List ( String, String )
  }
styles =
  { postList =
      [ ( "list-style-type", "none" )
      , ( "padding", "0" )
      , ( "margin", "0" )
      ]
  }
