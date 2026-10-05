import { createRoot } from 'react-dom/client'
import './index.css'

const div = <>
  <h1>Person Details</h1>
  <p>Name : Anil</p>
  <p>Age : 30</p>
  <p>Mobile : 9876543210</p>
</>

createRoot(document.getElementById('root')).render(div)
