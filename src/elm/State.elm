module State (..) where

import Effects exposing (Effects)
import Features.Header.State as HeaderState
import Features.Hello.State as HelloState
import Features.Toc.State as TocState
import Features.Footer.State as FooterState
import Types exposing (..)


initialState : ( Model, Effects Action )
initialState =
  let
    ( header, headerFx ) =
      HeaderState.initialState

    ( hello, helloFx ) =
      HelloState.initialState

    ( toc, tocFx ) =
      TocState.initialState

    ( footer, footerFx ) =
      FooterState.initialState
  in
    ( { header = header
      , hello = hello
      , toc = toc
      , footer = footer
      }
    , Effects.batch
        [ Effects.map HeaderAction headerFx
        , Effects.map HelloAction helloFx
        , Effects.map TocAction tocFx
        , Effects.map FooterAction footerFx
        ]
    )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    TocAction tocAction ->
      let
        ( updatedToc, fx ) =
          TocState.update tocAction model.toc
      in
        ( { model
            | toc = updatedToc
          }
        , Effects.map TocAction fx
        )

    HeaderAction headerAction ->
      let
        ( updatedHeader, fx ) =
          HeaderState.update headerAction model.header
      in
        ( { model
            | header = updatedHeader
          }
        , Effects.map HeaderAction fx
        )

    FooterAction footerAction ->
      let
        ( updatedFooter, fx ) =
          FooterState.update footerAction model.footer
      in
        ( { model
            | footer = updatedFooter
          }
        , Effects.map FooterAction fx
        )

    HelloAction helloAction ->
      let
        ( updatedHello, fx ) =
          HelloState.update helloAction model.hello
      in
        ( { model
            | hello = updatedHello
          }
        , Effects.map HelloAction fx
        )
