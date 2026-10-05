import { createRoot } from 'react-dom/client'
import './index.css'

// function that returns JSX is called as component in react
// Component functions must be designed with the function name starting in capital 
function PersonDetails() {
  const person = {
    name: 'Anil',
    age: 30,
    mobile: '9876543210',
    city: 'pune'
  }

  return <div>
    <h1>Person Details</h1>
    <p>Name : {person.name}</p>
    <p>Age : {person.age}</p>
    <p>Mobile : {person.mobile}</p>
    <p>City : {person.city}</p>
  </div>
}


function EmployeeDetails() {
  const employee = {
    id: 1,
    name: 'mukesh',
    salary: 10000
  }
  const divEmployee = <div>
    <h1>Employee Details</h1>
    <p>Empid : {employee.id}</p>
    <p>Name : {employee.name}</p>
    <p>Salary : {employee.salary}</p>
  </div>

  return divEmployee
}

createRoot(document.getElementById('root')).render([PersonDetails(), EmployeeDetails()])
