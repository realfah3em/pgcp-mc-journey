import React, { useEffect, useState } from 'react'
import FoodCard from '../components/FoodCard'
import { foodMenu } from '../services/foodservice'
import { toast } from 'react-toastify';

function FoodMenu() {

    const [foodItems, setFoodItems] = useState([])

    useEffect(() => {
        getFoodMenu()
    }, [])

    const getFoodMenu = async () => {
        try {
            const response = await foodMenu();
            const result = response.data
            if (result.status == 'success') {
                setFoodItems(result.data)
            }
            else
                toast.error('Fetching Menu Failed..')
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <div className='w-10/12 mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3'>
            {
                foodItems.map(f => <FoodCard food={f} />)
            }

        </div>
    )
}

export default FoodMenu
