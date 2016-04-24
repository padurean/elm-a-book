module Chapters.Chapters (..) where

import Effects exposing (Effects)
import Features.Chapter.State as ChapterState
import Features.Chapter.Types exposing (..)
import Chapters.ChapterOne as Chapter1
import Chapters.ChapterTwo as Chapter2
import Chapters.ChapterThree as Chapter3


initialState : List ( Model, Effects Action )
initialState =
  [ ChapterState.initialState Chapter1.data
  , ChapterState.initialState Chapter2.data
  , ChapterState.initialState Chapter3.data
  ]
