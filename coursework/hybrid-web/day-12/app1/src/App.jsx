import React from 'react'
import PersonDetails from './components/PersonDetails'
import EmployeeDetails from './components/EmployeeDetails'
import ProductDetails from './components/ProductDetails'

function App() {

  const person_arr = [
    { name: 'anil', age: 30, mobile: '9876543210', city: 'pune' },
    { name: 'mukesh', age: 30, mobile: '9876543210', city: 'pune' },
    { name: 'ramesh', age: 30, mobile: '9876543210', city: 'pune' },
    { name: 'suresh', age: 30, mobile: '9876543210', city: 'pune' }
  ]
  const product_arr = [
    { pid: 1, name: 'pen', price: 10 },
    { pid: 2, name: 'pencil', price: 5 },
    { pid: 3, name: 'book', price: 50 },
    { pid: 4, name: 'crayons', price: 30 }
  ]

  return (
    <>
      {/* <EmployeeDetails /> */}
      {/* <PersonDetails /> */}
      {/* <PersonDetails name={person_arr[0].name} age={person_arr[0].age} mobile={person_arr[0].mobile} city={person_arr[0].city} /> */}
      {/* <PersonDetails name={person_arr[1].name} age={person_arr[1].age} mobile={person_arr[1].mobile} city={person_arr[1].city} /> */}
      <h1>Person Details</h1>
      {person_arr.map(p => <PersonDetails name={p.name} age={p.age} mobile={p.mobile} city={p.city} />)}

      <h1>Product Details</h1>
      {product_arr.map(p => <ProductDetails pid={p.pid} name={p.name} price={p.price} />)}
    </>
  )
}

export default App
