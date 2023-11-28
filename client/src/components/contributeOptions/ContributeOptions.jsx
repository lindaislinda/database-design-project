import React from "react";
import "./contributeOptions.css";

function ContributeOptions() {
  return (
    <div>
      <div className="container-form">
        <h2>Contribute to our Database</h2>
      </div>

      <div className="container">
        <a href="/addhotel" className="btn">
          Add a Hotel
        </a>
        <a href="/addrestaurant" className="btn">
          Add a Restaurant
        </a>
        <a href="/addplace" className="btn">
          Add a Place to Visit
        </a>
      </div>
    </div>
  );
}

export default ContributeOptions;
