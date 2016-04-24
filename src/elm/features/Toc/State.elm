module Features.Toc.State (..) where

import Dict exposing (Dict)
import Effects exposing (Effects)
import Features.Chapter.Types as Chapter
import Features.Chapter.State as ChapterState
import Features.Toc.Types exposing (..)
import Chapters.Chapters as Chapters


initialState : ( Model, Effects Action )
initialState =
  let
    chaptersAndFx =
      Chapters.initialState
  in
    ( { chapters =
          Dict.fromList <| List.map (\( chapter, fx ) -> ( chapter.id, chapter )) chaptersAndFx
      , focused =
          Nothing
      }
    , Effects.batch
        (List.map (\( chapter, fx ) -> Effects.map (DispatchToChapter chapter.id) fx) chaptersAndFx)
    )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NoOp ->
      ( model
      , Effects.none
      )

    DispatchToChapter chapterId chapterAction ->
      let
        chapterMaybe =
          Dict.get chapterId model.chapters

        chapter =
          Maybe.withDefault (chapterNotFound chapterId) chapterMaybe

        ( updatedChapter, fx ) =
          ChapterState.update chapterAction chapter

        focused =
          if updatedChapter.focused then
            (Just chapterId)
          else
            Nothing
      in
        ( { model
            | chapters = Dict.insert chapterId updatedChapter model.chapters
            , focused = focused
          }
        , Effects.map (DispatchToChapter chapterId) fx
        )


chapterNotFound : Int -> Chapter.Model
chapterNotFound chapterId =
  { id =
      chapterId
  , title =
      "404 Chapter not found."
  , desc =
      "The Book is sorry :("
  , date =
      "A Black Sunday morning"
  , md =
      """
# No Content
      """
  , cache =
      Nothing
  , focused =
      False
  }
