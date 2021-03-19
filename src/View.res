module TheHeader = {
  @react.component
  let make = () => {
    <> <h1 className="text-4xl font-bold text-gray-200"> {React.string("New App")} </h1> </>
  }
}

@react.component
let make = () => {
  let state = Model.State.use()
  let dispatch = Model.Dispatch.use()

  <div className="flex flex-col items-center justify-center h-screen w-48 mx-auto">
    <TheHeader />
    <div className="grid grid-cols-3 gap-4 mt-4 w-full">
      <button
        className="p-4 py-1 rounded bg-red-500 text-red-900 hover:bg-red-400"
        onClick={_ => dispatch(Model.Decrement)}>
        {React.string("-")}
      </button>
      <div className="flex justify-center items-center"> {React.int(state.count)} </div>
      <button
        className="p-4 py-1 rounded bg-green-500 text-green-900 hover:bg-green-400"
        onClick={_ => dispatch(Model.Increment)}>
        {React.string("+")}
      </button>
    </div>
    <button
      className="p-4 py-1 uppercase font-bold mt-2 w-full rounded bg-gray-500 text-gray-900 hover:bg-gray-400"
      onClick={_ => dispatch(Model.Reset)}>
      {React.string("Reset")}
    </button>
  </div>
}
