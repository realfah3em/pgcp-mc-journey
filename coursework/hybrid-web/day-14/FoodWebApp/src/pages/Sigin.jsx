import React, { useContext, useState } from 'react'
import { Link, useNavigate } from 'react-router'
import { userSignIn } from '../services/userservice'
import { toast } from 'react-toastify'
import { UserLoginContext } from '../App'

function Sigin() {
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const { setLoginStatus } = useContext(UserLoginContext)

    const navigate = useNavigate()

    const handleSigninClick = async () => {
        try {
            const response = await userSignIn(email, password)
            const result = response.data
            if (result.status == 'success') {
                toast.success('Signin Successful')
                console.log(result.data)
                window.sessionStorage.setItem('token', result.data.token)
                // window.localStorage.setItem('token', result.data.token)
                // window.localStorage.removeItem('token')
                setLoginStatus(true)
                navigate('/home/menu')
            } else
                toast.error(result.error)
        } catch (error) {
            console.log(error)
        }
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
