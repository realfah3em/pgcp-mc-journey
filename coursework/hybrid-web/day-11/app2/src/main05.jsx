import { createRoot } from 'react-dom/client'
import './index.css'

function ProductDetails() {
  const products = [
    { pid: 1, name: 'Pen', price: 10 },
    { pid: 2, name: 'Pencil', price: 5 },
    { pid: 3, name: 'Book', price: 50 },
    { pid: 4, name: 'Crayons', price: 20 },
    { pid: 5, name: 'Eraser', price: 8 }
  ]
  // const productdiv: = 
  const arr = products.map((p) => {
    return <div>
      <p>Pid : {p.pid}</p>
      <p>Name : {p.name}</p>
      <p>Price : {p.price}</p>
      <hr />
    </div>
  })
  return arr
}

createRoot(document.getElementById('root')).render(<ProductDetails />)
