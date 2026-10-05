import { FOOD_IMAGE_URL } from "../utils/config"

function FoodCard({ food }) {
    const image = FOOD_IMAGE_URL + food.image
    console.log(image)
    return (
        <div className="card bg-base-100 w-75 shadow-sm m-2">
            <figure>
                <img
                    src={image}
                    alt="Shoes" />
            </figure>
            <div className="card-body">
                <h2 className="card-title">{food.name}</h2>
                <p className='h-20'>{food.description}</p>
                <p className='text-lg'>₹ : {food.price}</p>
                <div className="card-actions justify-end">
                    <button className="btn btn-primary">Add to Cart</button>
                </div>
            </div>
        </div>
    )
}

export default FoodCard
