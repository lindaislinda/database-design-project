// backend/server.js
const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const { Pool } = require("pg");
const bcrypt = require("bcrypt");

const app = express();
const PORT = 4000;

// added a config folder for the .env config file; this may conflict on your local machine
dotenv.config({ path: "./config.env" });

// Use body-parser middleware to parse form data
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// PostgreSQL configuration
const pool = new Pool({
  user: "usfmlm",
  host: "travel-db.cuhmhpusdq5y.us-east-1.rds.amazonaws.com",
  database: "usf_travel_db",
  password: "travelmlm",
  port: 5432, // default PostgreSQL port
  ssl : {
	  rejectUnauthorized: false,
  }
});
pool.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

// const { OpenAI } = require("openai");

// const openai = new OpenAI({
//   apiKey: process.env.OPENAI_API_KEY,
// });

app.use(cors());

// Handle signup form submission
app.post("/signup", async (req, res) => {
  try {
    const { firstName, lastName, email, password } = req.body;

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Get the current maximum userid
    const maxUserIdResult = await pool.query("SELECT MAX(userid) FROM users");

    // Extract the maximum userid from the result
    const maxUserId = maxUserIdResult.rows[0].max || 0;

    // Increment the userid for the new user
    const newUserId = maxUserId + 1;

    // Insert user data into the "users" table
    const result = await pool.query(
      "INSERT INTO users (userid, username, email, password) VALUES ($1, $2, $3, $4) RETURNING *",
      [newUserId, email, email, hashedPassword]
    );

    console.log("User created:", result.rows[0]);
    // res.status(201).json({ message: "Signup successful" });
    res.redirect("/preferences");
  } catch (error) {
    console.error("Error during signup:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

app.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    // Check if the user exists in the database
    const userResult = await pool.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    if (userResult.rows.length === 0) {
      // User not found
      return res.status(401).json({ message: "Invalid credentials" });
    }

    const user = userResult.rows[0];

    // Compare the provided password with the hashed password in the database
    const passwordMatch = await bcrypt.compare(password, user.password);
    if (passwordMatch) {
      console.log("Password matched!");
    }

    if (!passwordMatch) {
      // Passwords do not match
      return res.status(401).json({ message: "Invalid credentials" });
    }

    // // Set a session variable to indicate that the user is authenticated
    // req.session.isAuthenticated = true;

    res.status(200).json({ message: "Login successful" });
  } catch (error) {
    console.error("Error during login:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

// app.get("/api/:city1/:city2/:count", (req, res) => {
//   const getResponse = async () => {
//     const chatCompletion = await openai.chat.completions.create({
//       model: "gpt-4",
//       messages: [
//         {
//           role: "system",
//           content:
//             "Please strictly list the latitude and longitude coordinates of all cities located between the specified starting and ending locations, excluding the starting and ending cities themselves. Your response should be succinct and well-organized. Your output must not include anything but the format specified",
//         },
//         {
//           role: "user",
//           content: `List the coordinates of ${req.params.count} fairly spaced cities between ${req.params.city1} and ${req.params.city2} and provide their latitude and longitude in the format (lat1, long1),(lat2, lon2) with float values.`,
//         },
//       ],
//     });
//     res.json(chatCompletion.choices[0].message.content);
//   };

//   getResponse();
// });

// app.get(
//   "/api/trip-plan/:city1/:city2/:count/:food/:places/:hobbies/",
//   (req, res) => {
//     const getTripPlan = async () => {
//       const tripCompletion = await openai.chat.completions.create({
//         model: "gpt-4",
//         messages: [
//           {
//             role: "system",
//             content:
//               "Please provide a detailed plan for each day of a road trip.",
//           },
//           {
//             role: "user",
//             content: `The road trip will start from ${req.params.city1} and end at ${req.params.city2}, lasting for ${req.params.count} days. The plan should include a breakfast place, a lunch restaurant, a dinner restaurant, and 1 to 2 places to visit each day. To personalize the plan, please consider the following information: the traveler loves ${req.params.food} food, enjoys visiting ${req.params.places} places, and has hobbies and other interests such as ${req.params.hobbies}. It is requested to output a personalized description of each day of the trip with a narrative.`,
//           },
//         ],
//       });
//       res.json(tripCompletion.choices[0].message.content);
//     };

//     getTripPlan();
//   }
// );

app.get(
  "/api/trip-plan/:city1/:city2/:count/:food/:places/:hobbies/",
  (req, res) => {
    const city1 = req.params.city1;
    const city2 = req.params.city2;
    const count = req.params.count;
    const food = req.params.food;
    const places = req.params.places;
    const hobbies = req.params.hobbies;
    console.log("City 1:", city1);
    console.log("City 2:", city2);
    console.log("Count:", count);
    console.log("Food:", food);
    console.log("Places:", places);
    console.log("Hobbies:", hobbies);

    ///////////////////////////////////////////////////////////////////
    // Choose cities in between based on city 1 and city 2 ////////////
    ///////////////////////////////////////////////////////////////////
    cities = ["Tallahassee","Jacksonville", "St. Augustine", "Orlando", "Cocoa Beach", "Tampa", "St. Petersburg", "Sarasota", "Fort Myers","Naples", "Miami", "Key West"]
  
    cities_chosen = [city1]
    index_city1 = cities.indexOf(city1)
    index_city2 = cities.indexOf(city2)
    
    reverse = false

    if (index_city1 > index_city2) {
      start_index = index_city2
      end_index = index_city1
      reverse = true
    } else {
      start_index = index_city1
      end_index = index_city2
    }

    // Extract the sublist of cities between city1 and city2
    const citiesBetween = cities.slice(start_index + 1, end_index);

    if (reverse) {
      citiesBetween.reverse()
    }
    console.log("Cities Between: ", citiesBetween)

    function getRandomIndices(n, length) {
      const indices = [];
      while (indices.length < n) {
        const randomIndex = Math.floor(Math.random() * length);
        if (n <= length) {
          if (!indices.includes(randomIndex)) {
            indices.push(randomIndex);
          }
        } else {
          indices.push(randomIndex)
        }
      }
      return indices.sort((a, b) => a - b);
    }

    // Get count - 2 random cities in the citiesBetween list
    const randomIndices = getRandomIndices(count - 2, citiesBetween.length);

    for (let i = 0; i < randomIndices.length; i++) {
      cities_chosen.push(citiesBetween[randomIndices[i]])
    }
    cities_chosen.push(city2)

    ///////////////////////////////////////////////////////////////////
    // Do queries to find hotels, places to visit,///////////////////// 
    // and restaurants for each day ///////////////////////////////////
    ///////////////////////////////////////////////////////////////////


    

    // Example: Send a response with the values
    res.json(
      cities_chosen.toString()
    );
    console.log("Cities Chosen: ", cities_chosen);
    
  }
);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
