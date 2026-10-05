import { useEffect } from "react"
import { useState } from "react"

function Home() {
    const [count1, setCount1] = useState(0)
    const [count2, setCount2] = useState(0)

    useEffect(() => {
        console.log('Home component loaded')

        return () => {
            console.log('Home component unloaded')
        }
    }, [count1])



    return (
        <div>
            <h1>Home</h1>
            <h2>Counter1 : {count1}</h2>
            <button onClick={() => setCount1(count1 + 1)}>increment</button>
            <button onClick={() => setCount1(count1 - 1)}>decrement</button>

            <hr />

            <h2>Counter2 : {count2}</h2>
            <button onClick={() => setCount2(count2 + 1)}>increment</button>
            <button onClick={() => setCount2(count2 - 1)}>decrement</button>
        </div>
    )
}

export default Home
