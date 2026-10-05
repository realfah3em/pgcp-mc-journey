import { useContext } from "react"
import { useState } from "react"
import { CounterContext } from "../App"

// function Counter1({ count, setCount }) {
function Counter1() {
    // const [count, setCount] = useState(0)
    const { count, setCount } = useContext(CounterContext)
    return (
        <div>
            <h1>Counter1 : {count}</h1>
            <button onClick={() => setCount(count + 1)}>increment</button>
        </div>
    )
}

export default Counter1
