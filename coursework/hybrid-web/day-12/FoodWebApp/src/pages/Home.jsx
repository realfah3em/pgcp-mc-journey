import React from 'react'
import { Outlet } from 'react-router'
import NavBar from '../components/NavBar'

function Home() {
    return (
        <div>
            <NavBar />
            <h1 className='text-2xl font-semibold'>Home</h1>
            <Outlet />
        </div>
    )
}

export default Home
