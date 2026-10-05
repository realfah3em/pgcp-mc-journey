import React from 'react'
import { useEffect } from 'react'

function Profile() {
    useEffect(() => {
        console.log('profile component is loaded')

        return () => {
            console.log('profile component is unloaded')
        }
    }, [])
    return (
        <div>
            <h1>Profile</h1>
        </div>
    )
}

export default Profile
