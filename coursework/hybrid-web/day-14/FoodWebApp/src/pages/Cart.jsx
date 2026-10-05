import React, { useEffect, useState } from 'react'
import { useSelector } from 'react-redux'
import CartCard from '../components/CartCard'

function Cart() {
    const cartItems = useSelector(foodstore => foodstore.cartReducer.cartItems)
    const [totalQty, setTotalQty] = useState(0)
    const [totalBill, setTotalBill] = useState(0)

    const calculate = () => {
        let qtyTotal = 0
        let billTotal = 0
        cartItems.forEach(cartFood => {
            qtyTotal += cartFood.qty
            billTotal += (cartFood.qty * cartFood.price)
        })
        setTotalQty(qtyTotal)
        setTotalBill(billTotal)
    }

    useEffect(() => {
        calculate()
    }, [cartItems])




    return (
        cartItems.length != 0 ?
            <div className='w-4/5 grid grid-cols-12 mx-auto' >
                <div className='col-span-8 p-3'>
                    <ul className="list bg-base-100 rounded-box shadow-md">
                        {cartItems.map(cartFood => <CartCard cartfood={cartFood} />)}
                    </ul>
                </div>
                <div className='col-span-4 '>
                    <h1 className='m-3 text-xl font-semibold'>Bill Summary</h1>
                    <div className="stats stats-vertical lg:stats-horizontal shadow">
                        <div className="stat">
                            <div className="stat-title">Total Items</div>
                            <div className="stat-value">{cartItems.length}</div>
                        </div>

                        <div className="stat">
                            <div className="stat-title">Total Qty</div>
                            <div className="stat-value">{totalQty}</div>
                        </div>

                        <div className="stat">
                            <div className="stat-title">Total Bill</div>
                            <div className="stat-value">{totalBill}</div>
                        </div>
                    </div>
                    <button className="btn btn-primary p-2 m-2 w-4/5 ">Place Order</button>
                </div>
            </div>
            : <h1 className='p-3 m-3 text-2xl font-semibold' >Your Cart is Empty...</h1>
    )
}

export default Cart
