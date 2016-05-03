module Chapters.ChapterOne (..) where

import Features.Chapter.Types exposing (Model)


data : Model
data =
  { id =
      1
  , title =
      "Chapter One"
  , desc =
      "Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One Description of Chapter One "
  , date =
      "2016-04-23 21:43:07"
  , md =
      """
### This is Markdown for Chapter One

[Markdown](http://daringfireball.net/projects/markdown/) lets you
write content in a really natural way.

  * You can have lists, like this one
  * Make things **bold** or *italic*
  * Embed snippets of `code`
  * Create [links](/)
  * ...

The [elm-markdown][] package parses all this content, allowing you
to easily generate blocks of `Element` or `Html`.

[elm-markdown]: http://package.elm-lang.org/packages/evancz/elm-markdown/latest


```elm
{---> Main.elm <---------}

module Features.Chapter.State (..) where

import Html exposing (Html)
import Markdown
import Effects exposing (Effects)
import Features.Chapter.Types exposing (..)


type alias Model =
  { id : Int
  , title : String
  , date : String
  , desc : String
  , md : String
  , cache : Maybe Html
  , focused : Bool
  }

-- This is a one line comment

type Action
  = Focus
  | Blur

{- This is a multi-
 line comment -}

initialState : Model -> ( Model, Effects Action )
initialState data =
  ( { id = data.id
    , title = data.title
    , date = data.date
    , desc = data.desc
    , md = data.md
    , cache = Nothing
    , focused = False
    }
  , Effects.none
  )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    Focus ->
      ( { model | focused = True, cache = Just (cachedHtml model) }
      , Effects.none
      )

    Blur ->
      ( { model | focused = False }
      , Effects.none
      )
```

      """
  , cache =
      Nothing
  , focused =
      False
  }
