import React from 'react'

function Events() {
    const handleSubmit = (e) => {
        e.preventDefault()
        console.log('submit called')
        console.log(e)
    }

    const handleChange = (e) => {
        console.log('change')
        console.log(e)
    }

    return (
        <div>
            <button onClick={(e) => {
                console.log('Button clicked')
                console.log(e)
                console.log(event)
            }}>Button1</button>

            <form onSubmit={handleSubmit} >
                <input type="text" placeholder='name' onChange={handleChange} />
                <input type="submit" value="save" />
            </form>
        </div>
    )
}

export default Events
