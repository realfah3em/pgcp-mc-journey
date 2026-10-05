import React from 'react'
import { Link, useNavigate } from 'react-router'

function Signup() {
    const navigate = useNavigate()

    const handleSignupClick = () => {
        console.log('signup click')
        // on successful signup
        // navigate to login else stay on the same page
        navigate('/')
    }
    return (
        <div className='w-1/2 mx-auto mt-2 p-3 bg-amber-50 rounded-2xl'>
            <h1 className='m-2 text-2xl font-semibold'>User Signup</h1>
            <div className='mt-3'>
                <label className="floating-label">
                    <span>Name</span>
                    <input type="text" placeholder="full name" className="input input-md" />
                </label>
            </div>

            <div className='mt-3'>
                <label className="floating-label">
                    <span>Email</span>
                    <input type="email" placeholder="mail@site.com" className="input input-md" />
                </label>
            </div>

            <div className='mt-3'>
                <label className="floating-label">
                    <span>Password</span>
                    <input type="password" placeholder="*******" className="input input-md" />
                </label>
            </div>

            <div className='mt-3'>
                <label className="floating-label">
                    <span>Mobile</span>
                    <input type="tel" placeholder="+91" className="input input-md" />
                </label>
            </div>


            <div className='mt-3'>
                <label>Already have an account ? To Signin <Link to="/" className='text-blue-500'>Click Here</Link></label>
            </div>

            <div className='mt-3'>
                <button className='btn btn-warning' onClick={handleSignupClick}>Signup</button>
            </div>
        </div>
    )
}

export default Signup
