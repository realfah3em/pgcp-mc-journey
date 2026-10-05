import React from 'react'
import { Routes, Link } from 'react-router';
import { Route } from 'react-router';
import Home from './componnets/Home';
import Profile from './componnets/Profile';
import Counter1 from './componnets/Counter1';
import Counter2 from './componnets/Counter2';
import { useState } from 'react';
import { createContext } from 'react';

export const CounterContext = createContext()
function App() {
  const [count, setCount] = useState(0)
  return (
    <div>
      {/* <nav>
        <Link to='/home'>Home | </Link>
        <Link to='/profile'>Profile</Link>
      </nav>
      <Routes>
        <Route path='/home' element={<Home />} />
        <Route path='/profile' element={<Profile />} />
      </Routes> */}

      {/* <Counter1 count={count} setCount={setCount} />
      <hr />
      <Counter2 count={count} setCount={setCount} /> */}

      <CounterContext.Provider value={{ count, setCount }}>
        <Counter1 />
        <Counter2 />
      </CounterContext.Provider>

    </div>
  )
}

export default App
