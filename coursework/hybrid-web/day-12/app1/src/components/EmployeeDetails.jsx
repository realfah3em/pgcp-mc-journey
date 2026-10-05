function EmployeeDetails() {
    const employee = { id: 1, name: 'mukesh', salary: 10000 }
    return (
        <div>
            <p>empid : {employee.id}</p>
            <p>name : {employee.name}</p>
            <p>salary : {employee.salary}</p>
        </div>
    )
}

export default EmployeeDetails
