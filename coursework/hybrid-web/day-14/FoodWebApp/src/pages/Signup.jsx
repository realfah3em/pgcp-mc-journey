import React, { useState } from 'react'
import { Link, useNavigate } from 'react-router'
import { userSignup } from '../services/userservice'
import { toast } from 'react-toastify'

function Signup() {
    const [name, setName] = useState('')
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [mobile, setMobile] = useState('')

    const navigate = useNavigate()

    const handleSignupClick = async () => {
        // validation needed to be done at the time of signup
        const body = { name, email, password, mobile }
        try {
            const response = await userSignup(body)
            const result = response.data
            if (result.status == 'success') {
                toast.success('Signup Successfull')
                navigate('/')
            }
            else
                toast.error('Signup Failed')
        } catch (error) {
            console.log(error)
        }
    }
    return (
        <div className='w-1/2 mx-auto mt-2 p-3 bg-amber-50 rounded-2xl'>
            <h1 className='m-2 text-2xl font-semibold'>User Signup</h1>
            <div className='mt-3'>
                <label className="floating-label">
                    <span>Name</span>
                    <input type="text" placeholder="full name" className="input input-md" onChange={e => setName(e.target.value)} />
                </label>
            </div>

            <div className='mt-3'>
                <label className="floating-label">
                    <span>Email</span>
                    <input type="email" placeholder="mail@site.com" className="input input-md" onChange={e => setEmail(e.target.value)} />
                </label>
            </div>

            <div className='mt-3'>
                <label className="floating-label">
                    <span>Password</span>
                    <input type="password" placeholder="*******" className="input input-md" onChange={e => setPassword(e.target.value)} />
                </label>
            </div>

            <div className='mt-3'>
                <label className="floating-label">
                    <span>Mobile</span>
                    <input type="tel" placeholder="+91" className="input input-md" onChange={e => setMobile(e.target.value)} />
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
