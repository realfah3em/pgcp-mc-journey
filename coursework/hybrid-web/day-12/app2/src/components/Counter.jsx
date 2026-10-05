import React, { useState } from 'react'

function Counter() {
    // let arr = useState(0)
    // console.log(arr)

    // let count = arr[0]
    // let setCount = arr[1]

    // console.log(setCount)

    const [count, setCount] = useState(0)

    const handleIncrementClick = () => {
        // count = count + 1
        setCount(count + 1)
        console.log('count - ' + count)
    }
    const handleDecrementClick = () => {
        // count = count - 1
        setCount(count - 1)
        console.log('count - ' + count)
    }

    return (
        <div>
            <h1>Count : {count} </h1>
            <button onClick={handleIncrementClick}>increment</button>
            <button onClick={handleDecrementClick}>decrement</button>
        </div>
    )
}

export default Counter
