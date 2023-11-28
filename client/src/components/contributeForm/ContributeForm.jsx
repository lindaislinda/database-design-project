import React, { useState } from "react";
import axios from "axios";
import "./contributeForm.css";
import { TextField, Button, Box, Typography } from "@mui/material";

const ContributeForm = () => {
  const [city, setCity] = useState("");
  const [restaurantName, setRestaurantName] = useState("");
  const [cuisineType, setCuisineType] = useState("");
  const [mealType, setMealType] = useState([]);
  const [latitude, setLatitude] = useState("");
  const [longitude, setLongitude] = useState("");

  const handleMealTypeClick = (selectedType) => {
    // Toggle the selected meal type
    setMealType((prevMealType) => {
      if (prevMealType.includes(selectedType)) {
        return prevMealType.filter((type) => type !== selectedType);
      } else {
        return [...prevMealType, selectedType];
      }
    });
  };

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
      const url = `http://localhost:4000/add/restaurants/${city}/${restaurantName}/${cuisineType}/${mealType.join(
        ","
      )}/${latitude}/${longitude}`;

      // Send a POST request to the server
      const response = await axios.post(url, restaurantData);

      // Handle the response (you can add more logic here)
      console.log("Restaurant added successfully:", response.data);
    } catch (error) {
      // Handle errors (you can add more error handling logic here)
      console.error("Error adding restaurant:", error.message);
    }
  };

  return (
    <>
      <div className="container">
        <div className="container-form">
          <h2>Add a Restaurant</h2>
        </div>
        <div className="container-form">
          <h2>Add a Hotel</h2>
        </div>
        <div className="container-form">
          <h2>Add a Place to Visit</h2>
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

export default ContributeForm;
