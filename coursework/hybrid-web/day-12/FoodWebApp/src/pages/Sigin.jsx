import React, { useState } from 'react'
import { Link, useNavigate } from 'react-router'

function Sigin() {

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')

    const navigate = useNavigate()
    const handleSigninClick = () => {
        console.log(`email - ${email} , password - ${password}`)

        // signin is successfull navigate to the home page else stay on same page
        //navigate('/home')
    }

    return (
        <div className='w-1/2 mx-auto mt-2 p-3 bg-amber-50 rounded-2xl'>
            <h1 className='m-2 text-2xl font-semibold'>User Signin</h1>
            <div className='mt-3'>
                <label className="floating-label">
                    <span>Email</span>
                    <input type="email" placeholder="mail@site.com" className="input input-md" onChange={(e) => setEmail(e.target.value)} />
                </label>
            </div>

            <div className='mt-3'>
                <label className="floating-label">
                    <span>Password</span>
                    <input type="password" placeholder="*******" className="input input-md" onChange={e => setPassword(e.target.value)} />
                </label>
            </div>

            <div className='mt-3'>
                <label>Don't have an account ? To Register <Link to="/signup" className='text-blue-500'>Click Here</Link></label>
            </div>

            <div className='mt-3'>
                <button className='btn btn-success' onClick={handleSigninClick}>Signin</button>
            </div>
        </div>
    )
}

export default Sigin
