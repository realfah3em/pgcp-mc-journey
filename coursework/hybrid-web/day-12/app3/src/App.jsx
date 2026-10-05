import React from 'react'
import Signin from './pages/Signin'
import Home from './pages/Home'
import Menu from './pages/Menu'
import Cart from './pages/Cart'
import { Route, Routes } from 'react-router'

function App() {
  return (
    <div>
      <Routes>
        <Route path='/' element={<Signin />} />
        <Route path='/home' element={<Home />} >
          <Route path='cart' element={<Cart />} />
          <Route path='menu' element={<Menu />} />
        </Route>
      </Routes>

    </div>
  )
}

export default App
