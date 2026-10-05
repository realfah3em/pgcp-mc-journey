import { configureStore } from '@reduxjs/toolkit';
import { cartReducer } from './slices/cartslice';

const foodstore = configureStore({
    reducer: {
        cartReducer
    }
})

export default foodstore