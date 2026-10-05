import { createSlice } from "@reduxjs/toolkit";

const cartSlice = createSlice({
    name: 'cart',
    initialState: {
        cartItems: []
    },
    reducers: {
        addToCartAction: (state, { payload }) => {
            const index = state.cartItems.findIndex(f => f.fid == payload.fid)
            if (index == -1) {
                // add to cart
                payload.qty = 1
                state.cartItems.push(payload)
            } else {
                // increase the qty
                state.cartItems[index].qty += 1
            }
        },
        incrementQtyAction: (state, { payload }) => {
            const index = state.cartItems.findIndex(cartFood => cartFood.fid == payload.fid)
            state.cartItems[index].qty += 1
        },
        decrementQtyAction: (state, { payload }) => {
            const index = state.cartItems.findIndex(cartFood => cartFood.fid == payload.fid)
            if (state.cartItems[index].qty == 1)
                state.cartItems.splice(index, 1)
            else
                state.cartItems[index].qty -= 1
        },
        clearCartAction: () => { }
    }
})

export const cartReducer = cartSlice.reducer
export const { addToCartAction, incrementQtyAction, decrementQtyAction, clearCartAction } = cartSlice.actions

