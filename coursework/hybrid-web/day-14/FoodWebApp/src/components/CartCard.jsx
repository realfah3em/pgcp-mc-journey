import React from 'react'
import { FOOD_IMAGE_URL } from '../utils/config'
import { useDispatch } from 'react-redux'
import { decrementQtyAction, incrementQtyAction } from '../slices/cartslice'

function CartCard({ cartfood }) {
    const dispatch = useDispatch()
    return (
        <li className="list-row">
            <div><img className="size-10 rounded-box" alt="Tailwind CSS list item" src={FOOD_IMAGE_URL + cartfood.image} /></div>
            <div>
                <div>{cartfood.name}</div>
                <div className="text-xs uppercase font-semibold opacity-60">₹: {cartfood.price * cartfood.qty}</div>
            </div>
            <button className="btn btn-square btn-ghost text-xl" onClick={() => dispatch(incrementQtyAction(cartfood))}>+</button>
            <p className='text-lg my-auto'>{cartfood.qty}</p>
            <button className="btn btn-square btn-ghost text-xl" onClick={() => { dispatch(decrementQtyAction(cartfood)) }}>-</button>
        </li>
    )
}

export default CartCard
