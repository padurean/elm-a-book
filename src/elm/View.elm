module View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (..)

import Signal exposing (Address)
import Features.Toc.Types as Toc
import Features.Toc.View as TocView
import Features.Header.View as HeaderView
import Features.Header.Types as Header
import Features.Hello.View as HelloView
import Features.Hello.Types as Hello
import Features.Footer.View as FooterView
import Features.Footer.Types as Footer
import Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  let
    headerPipeBackAddress headerAction =
      Signal.forwardTo address HeaderAction

    helloPipeBackAddress helloAction =
      Signal.forwardTo address HelloAction

    tocPipeBackAddress tocAction =
      Signal.forwardTo address TocAction

    footerPipeBackAddress footerAction =
      Signal.forwardTo address FooterAction
  in
    body
      []
      [ HeaderView.root (headerPipeBackAddress Header.NoOp) model.header
      , div
          [ id "main" ]
          [ HelloView.root (helloPipeBackAddress Hello.NoOp) model.hello
          , TocView.root (tocPipeBackAddress Toc.NoOp) model.toc
          ]
      , FooterView.root (footerPipeBackAddress Footer.NoOp) model.footer
      ]
