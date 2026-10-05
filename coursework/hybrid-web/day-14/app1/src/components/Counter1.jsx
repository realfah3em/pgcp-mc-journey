import React from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { decrementAction, incrementAction } from '../slices/counterslice'

function Counter1() {
    const count = useSelector(store => store.counterReducer.count)
    const dispatch = useDispatch()
    return (
        <div>
            <h1>Count : {count}</h1>
            <button onClick={() => dispatch(incrementAction())}>increment</button>
            <button onClick={() => dispatch(decrementAction(2))}>decrement</button>
        </div>
    )
}

export default Counter1
