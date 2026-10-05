
// export default function PersonDetails(props) {
// console.log(props)

// export default function PersonDetails(person) {
// console.log(person)

export default function PersonDetails({ name, age, city, mobile }) {
    return <div>
        <p>name : {name}</p>
        <p>age : {age}</p>
        <p>mobile : {mobile}</p>
        <p>city : {city}</p>
        <hr />
    </div>
}