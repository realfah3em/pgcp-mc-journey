import React from 'react'
import { useState } from 'react'
import Counter3 from './Counter3'
import { useContext } from 'react'
import { CounterContext } from '../App'

// function Counter2({ count, setCount }) {
function Counter2() {
    // const [count, setCount] = useState(0)
    const { count, setCount } = useContext(CounterContext)
    return (
        <div>
            <h1>Counter2 : {count} </h1>
            <button onClick={() => setCount(count - 1)}>decrement</button>
            <hr />
            <h2>Nested Component</h2>
            {/* <Counter3 count={count} /> */}
            <Counter3 />
        </div>
    )
}

export default Counter2
