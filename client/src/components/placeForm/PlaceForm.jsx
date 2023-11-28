import React, { useState } from "react";
import axios from "axios";
import './placeForm.css'

const PlaceForm = () => {
  const [city, setCity] = useState("");
  const [placeName, setPlaceName] = useState("");
  const [tag, setTag] = useState("");
  const [latitude, setLatitude] = useState("");
  const [longitude, setLongitude] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    console.log("Submit button clicked!");

    try {
      // Create a restaurant object with form data
      const placeData = {
        city,
        placeName,
        tag,
        latitude,
        longitude,
      };

      // Use template literals to construct the URL with parameters
      const url = `http://localhost:4000/add/places/${city}/${placeName}/${tag}/${latitude}/${longitude}`;

      // Send a POST request to the server
      const response = await axios.post(url);

      // Handle the response 
      console.log("Place added successfully:", response.data);
    } catch (error) {
      // Handle errors 
      console.error("Error adding place:", error.message);
    }
  };

  return (
    <>
      <div className="container">
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
              Place Name*:
              <input
                type="text"
                value={placeName}
                onChange={(e) => setPlaceName(e.target.value)}
                required
              />
            </label>
            <br />

            <label>
              Place Type*:
              <input
                type="text"
                value={tag}
                onChange={(e) => setTag(e.target.value)}
                required
                placeholder="Museum/theatre/beach"
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

export default PlaceForm