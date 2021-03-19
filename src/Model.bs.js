// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

var initialState = {
  count: 0
};

function reducer(state, action) {
  switch (action) {
    case /* Increment */0 :
        return {
                count: state.count + 1 | 0
              };
    case /* Decrement */1 :
        return {
                count: state.count - 1 | 0
              };
    case /* Reset */2 :
        return initialState;
    
  }
}

function Make(Config) {
  var t = React.createContext(Config.defaultValue);
  var make = t.Provider;
  var Provider = {
    make: make
  };
  var use = function (param) {
    return React.useContext(t);
  };
  return {
          t: t,
          Provider: Provider,
          use: use
        };
}

var CtxFunctor = {
  Make: Make
};

var t = React.createContext(initialState);

var make = t.Provider;

var Provider = {
  make: make
};

function use(param) {
  return React.useContext(t);
}

var State = {
  t: t,
  Provider: Provider,
  use: use
};

function defaultValue(param) {
  
}

var t$1 = React.createContext(defaultValue);

var make$1 = t$1.Provider;

var Provider$1 = {
  make: make$1
};

function use$1(param) {
  return React.useContext(t$1);
}

var Dispatch = {
  t: t$1,
  Provider: Provider$1,
  use: use$1
};

function Model(Props) {
  var children = Props.children;
  var match = React.useReducer(reducer, initialState);
  return React.createElement(make$1, {
              value: match[1],
              children: React.createElement(make, {
                    value: match[0],
                    children: children
                  })
            });
}

var make$2 = Model;

export {
  initialState ,
  reducer ,
  CtxFunctor ,
  State ,
  Dispatch ,
  make$2 as make,
  
}
/* t Not a pure module */