import { Navigate, Route, Routes } from "react-router"
import Sigin from "./pages/Sigin"
import Signup from "./pages/Signup"
import Home from "./pages/Home"
import FoodMenu from "./pages/FoodMenu"
import Cart from "./pages/Cart"
import Profile from "./pages/Profile"
import { ToastContainer } from 'react-toastify'
import { createContext, useState } from "react"

export const UserLoginContext = createContext()

function App() {
    const [loginStatus, setLoginStatus] = useState(false)
    return <>
        <UserLoginContext.Provider value={{ loginStatus, setLoginStatus }}>
            <Routes>
                <Route path="/*" element={<Sigin />} />
                <Route path="/signup" element={<Signup />} />
                <Route path="/home" element={loginStatus ? <Home /> : <Navigate to='/' />}>
                    <Route path="menu" element={<FoodMenu />} />
                    <Route path="cart" element={<Cart />} />
                    <Route path="profile" element={<Profile />} />
                </Route>
            </Routes>
        </UserLoginContext.Provider>
        <ToastContainer />
    </>
}

export default App
