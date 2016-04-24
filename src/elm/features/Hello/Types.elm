module Features.Hello.Types (..) where


type alias Model =
  { counter : Int
  }


type Action
  = NoOp
  | Increment
