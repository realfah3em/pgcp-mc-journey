import { useEffect, useState } from 'react'
import { userProfile, userUpdate } from '../services/userservice'
import { toast } from 'react-toastify'

function Profile() {
    const [name, setName] = useState('name')
    const [email, setEmail] = useState('email')
    const [mobile, setMobile] = useState('+91')

    const getProfile = async () => {
        try {
            const token = window.sessionStorage.getItem('token')
            const response = await userProfile(token)
            const result = response.data
            if (result.status == 'success') {
                setName(result.data.name)
                setEmail(result.data.email)
                setMobile(result.data.mobile)
            } else
                toast.error('Profile Fetching Failed')

        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => {
        getProfile()
    }, [])

    const handleUpdateClick = async () => {
        try {
            const token = window.sessionStorage.getItem('token')
            const response = await userUpdate(token, mobile)
            const result = response.data
            console.log(mobile)
            console.log(result)
            if (result.status == 'success')
                toast.success('mobile updated successfully ')
            else
                toast.error('mobile update failed ')

        } catch (error) {
            console.log(error)
        }
    }

    return (
        <div className='w-3/4 mx-auto p-2'>
            <h1 className='text-2xl font-semibold mb-4'>User Profile</h1>
            <div className='flex gap-3'>
                <input type="text" value={name} className="input" readOnly />
                <input type="text" value={email} className="input" readOnly />
            </div>
            <div className='mt-3'>
                <input type="tel" value={mobile} className="input" onChange={e => setMobile(e.target.value)} />
            </div>
            <button className='btn btn-success mt-4' onClick={handleUpdateClick}>update</button>
        </div>
    )
}

export default Profile
