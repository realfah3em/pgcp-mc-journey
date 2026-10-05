import { Route, Routes } from "react-router"
import Sigin from "./pages/Sigin"
import Signup from "./pages/Signup"
import Home from "./pages/Home"
import FoodMenu from "./pages/FoodMenu"
import Cart from "./pages/Cart"
import Profile from "./pages/Profile"
import { ToastContainer } from 'react-toastify'

function App() {
    return <>
        <Routes>
            <Route path="/" element={<Sigin />} />
            <Route path="/signup" element={<Signup />} />
            <Route path="/home" element={<Home />}>
                <Route path="menu" element={<FoodMenu />} />
                <Route path="cart" element={<Cart />} />
                <Route path="profile" element={<Profile />} />
            </Route>
        </Routes>
        <ToastContainer />
    </>
}

export default App
