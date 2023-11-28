import React, { useState } from "react";
import axios from "axios";
import Nav from "../nav/Nav";
import "./restaurantForm.css";

const RestaurantForm = () => {
  const [city, setCity] = useState("");
  const [restaurantName, setRestaurantName] = useState("");
  const [cuisineType, setCuisineType] = useState("");
  const [mealType, setMealType] = useState([]);
  const [latitude, setLatitude] = useState("");
  const [longitude, setLongitude] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      // Create a restaurant object with form data
      const restaurantData = {
        city,
        restaurantName,
        cuisineType,
        mealType,
        latitude,
        longitude,
      };

      // Use template literals to construct the URL with parameters
      const url = `http://localhost:4000/add/restaurants/${city}/${restaurantName}/${cuisineType}/${mealType}/${latitude}/${longitude}`;

      // Send a POST request to the server
      const response = await axios.post(url);

      // Handle the response
      console.log("Restaurant added successfully:", response.data);
    } catch (error) {
      // Handle errors
      console.error("Error adding restaurant:", error.message);
    }
  };

  return (
    <>
      <Nav />
      <div className="container">
        <div className="container-form">
          <h2>Add a Restaurant</h2>
        </div>
      </div>
      <div className="container">
        <div className="container-form">
          <form onSubmit={handleSubmit}>
            <label>
              City*:
              <input
                type="text"
                value={city}
                onChange={(e) => setCity(e.target.value)}
                required
              />
            </label>
            <br />
            <label>
              Restaurant Name*:
              <input
                type="text"
                value={restaurantName}
                onChange={(e) => setRestaurantName(e.target.value)}
                required
              />
            </label>
            <br />

            <label>
              Cuisine Type*:
              <input
                type="text"
                value={cuisineType}
                onChange={(e) => setCuisineType(e.target.value)}
                required
              />
            </label>
            <br />

            <label>
              Meal Type*:
              <input
                type="text"
                value={mealType}
                onChange={(e) => setMealType(e.target.value)}
                required
              />
            </label>
            <br />

            <label>
              Latitude:
              <input
                type="text"
                value={latitude}
                onChange={(e) => setLatitude(e.target.value)}
              />
            </label>
            <br />

            <label>
              Longitude:
              <input
                type="text"
                value={longitude}
                onChange={(e) => setLongitude(e.target.value)}
              />
            </label>
            <br />

            <button className="btn" type="submit">
              Submit
            </button>
          </form>
        </div>
      </div>
    </>
  );
};

export default RestaurantForm;
