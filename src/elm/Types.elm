module Types (..) where

import Features.Toc.Types as Toc
import Features.Hello.Types as Hello
import Features.Footer.Types as Footer
import Features.Header.Types as Header


type alias Model =
  { header : Header.Model
  , hello : Hello.Model
  , toc : Toc.Model
  , footer : Footer.Model
  }


type Action
  = TocAction Toc.Action
  | HelloAction Hello.Action
  | FooterAction Footer.Action
  | HeaderAction Header.Action
