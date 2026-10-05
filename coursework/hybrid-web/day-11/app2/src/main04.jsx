import { createRoot } from 'react-dom/client'
import './index.css'

function ProductDetails() {
  const products = [
    { pid: 1, name: 'Pen', price: 10 },
    { pid: 2, name: 'Pencil', price: 5 },
    { pid: 3, name: 'Book', price: 50 },
    { pid: 4, name: 'Crayons', price: 20 }
  ]

  return <div>
    <div>
      <p>pid : {products[0].pid}</p>
      <p>name : {products[0].name}</p>
      <p>price : {products[0].price}</p>
    </div>
    <hr />
    <div>
      <p>pid : {products[1].pid}</p>
      <p>name : {products[1].name}</p>
      <p>price : {products[1].price}</p>
    </div>
    <hr />
    <div>
      <p>pid : {products[2].pid}</p>
      <p>name : {products[2].name}</p>
      <p>price : {products[2].price}</p>
    </div>
    <hr />
    <div>
      <p>pid : {products[3].pid}</p>
      <p>name : {products[3].name}</p>
      <p>price : {products[3].price}</p>
    </div>
    <hr />
  </div>
}

createRoot(document.getElementById('root')).render(<ProductDetails />)
