module Chapters.ChapterOne (..) where

import Features.Chapter.Types exposing (Model)


data : Model
data =
  { id =
      1
  , title =
      "Chapter One"
  , desc =
      "Description of Chapter One"
  , date =
      "2016-04-23 21:43:07"
  , md =
      """
# This is Markdown for Chapter One

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

      """
  , cache =
      Nothing
  , focused =
      False
  }
