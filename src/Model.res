type state = {count: int}

let initialState = {
  count: 0,
}

type action =
  | Increment
  | Decrement
  | Reset

let reducer = (state: state, action: action) => {
  switch action {
  | Increment => {
      count: state.count + 1,
    }
  | Decrement => {
      count: state.count - 1,
    }
  | Reset => initialState
  }
}

module CtxFunctor = {
  module type Config = {
    type context
    let defaultValue: context
  }

  module Make = (Config: Config) => {
    let t = React.createContext(Config.defaultValue)

    module Provider = {
      let make = React.Context.provider(t)

      @obj
      external makeProps: (
        ~value: Config.context,
        ~children: React.element,
        ~key: string=?,
        unit,
      ) => {"value": Config.context, "children": React.element} = ""
    }

    let use = () => React.useContext(t)
  }
}

module State = {
  include CtxFunctor.Make({
    type context = state
    let defaultValue = initialState
  })
}

module Dispatch = {
  include CtxFunctor.Make({
    type context = action => unit
    let defaultValue = _ => ()
  })
}

@react.component
let make = (~children) => {
  let (state, dispatch) = React.useReducer(reducer, initialState)
  <Dispatch.Provider value={dispatch}>
    <State.Provider value={state}> {children} </State.Provider>
  </Dispatch.Provider>
}
