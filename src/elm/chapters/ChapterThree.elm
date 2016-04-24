module Chapters.ChapterThree (..) where

import Features.Chapter.Types exposing (Model)


data : Model
data =
  { id =
      3
  , title =
      "Chapter Three"
  , desc =
      "Description of Chapter Three"
  , date =
      "2016-04-24 11:17:25"
  , md =
      """
# This is Markdown for Chapter Three

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
