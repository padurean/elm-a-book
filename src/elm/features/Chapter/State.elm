module Features.Chapter.State (..) where

import Html exposing (Html)
import Markdown
import Effects exposing (Effects)
import Features.Chapter.Types exposing (..)


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


cachedHtml : Model -> Html
cachedHtml model =
  case model.cache of
    Just html ->
      html

    _ ->
      Markdown.toHtml model.md
