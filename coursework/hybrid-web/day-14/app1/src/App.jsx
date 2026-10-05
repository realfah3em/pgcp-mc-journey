import React, { useState } from 'react'
import Counter1 from './components/Counter1'
import Counter2 from './components/Counter2'

function App() {
  const [count, setCount] = useState(0)
  return (
    <div>
      <Counter1 />
      <Counter2 />
    </div>
  )
}

export default App
