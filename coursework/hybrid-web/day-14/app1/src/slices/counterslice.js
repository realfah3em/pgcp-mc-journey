import { createSlice } from "@reduxjs/toolkit";

const counterSlice = createSlice({
    name: 'counter',
    initialState: {
        count: 0
    },
    reducers: {
        incrementAction: (state) => {
            state.count++
        },
        decrementAction: (state, { payload }) => {
            //console.log(payload)
            state.count -= payload
        }
    }
})

export const counterReducer = counterSlice.reducer
export const { incrementAction, decrementAction } = counterSlice.actions