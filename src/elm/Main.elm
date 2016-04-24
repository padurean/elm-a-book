module Main (..) where

import Html exposing (..)
import Effects exposing (Effects, Never)
import StartApp
import Types exposing (..)
import State
import View
import Task exposing (Task, succeed)


app : StartApp.App Model
app =
  StartApp.start
    { init = State.initialState
    , update = State.update
    , view = View.root
    , inputs = []
    }


main : Signal Html
main =
  app.html


port tasks : Signal (Task Never ())
port tasks =
  app.tasks
