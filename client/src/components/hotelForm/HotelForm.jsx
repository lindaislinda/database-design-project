import React, { useState } from "react";
import axios from "axios";
import './hotelForm.css'

const HotelForm = () => {
  const [city, setCity] = useState("");
  const [hotelName, setHotelName] = useState("");
  const [priceRange, setPriceRange] = useState("");
  const [latitude, setLatitude] = useState("");
  const [longitude, setLongitude] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      // Create a restaurant object with form data
      const hotelData = {
        city,
        hotelName,
        priceRange,
        latitude,
        longitude,
      };

      // Use template literals to construct the URL with parameters
      const url = `http://localhost:4000/add/hotels/${city}/${hotelName}/${priceRange}/${latitude}/${longitude}`;

      // Send a POST request to the server
      const response = await axios.post(url);

      // Handle the response 
      console.log("Hotel added successfully:", response.data);
    } catch (error) {
      // Handle errors 
      console.error("Error adding hotel:", error.message);
    }
  };

  return (
    <>
      <div className="container">
        <div className="container-form">
          <h2>Add a Hotel</h2>
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
              Hotel Name*:
              <input
                type="text"
                value={hotelName}
                onChange={(e) => setHotelName(e.target.value)}
                required
              />
            </label>
            <br />

            <label>
              Price Range*:
              <input
                type="text"
                value={priceRange}
                onChange={(e) => setPriceRange(e.target.value)}
                required
                placeholder="Cheap/Pricey"
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
}

export default HotelForm