import React from 'react'
import { useContext } from 'react'
import { CounterContext } from '../App'

// function Counter3({ count }) {
function Counter3() {
    const { count } = useContext(CounterContext)
    return (
        <div>
            <h1>Counter 3 : {count}</h1>
        </div>
    )
}

export default Counter3
