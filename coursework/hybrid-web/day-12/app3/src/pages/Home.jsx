import React from 'react'
import NavBar from '../components/NavBar'
import { Outlet } from 'react-router'

function Home() {
    return (
        <div>
            <NavBar />
            <h1 className='text-2xl font-bold'>Home Page</h1>
            <Outlet />
        </div>
    )
}

export default Home
