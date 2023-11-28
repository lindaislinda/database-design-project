import { BrowserRouter, Route, Routes } from "react-router-dom";
import Homepage from "./pages/Homepage";
import Login from "./pages/Login";
import Preferences from "./pages/Preferences";
import Result from "./pages/Result";
import Signup from "./pages/Signup";
import Contribute from "./pages/Contribute";
import PlaceForm from "./components/placeForm/PlaceForm";
import RestaurantForm from "./components/restaurantForm/RestaurantForm";
import HotelForm from "./components/hotelForm/HotelForm";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route exact path="/" Component={Homepage} />
        <Route exact path="/login" Component={Login} />
        <Route exact path="/Preferences" Component={Preferences} />
        <Route exact path="/result" Component={Result} />
        <Route exact path="/signup" Component={Signup} />
        <Route exact path="/contribute" Component={Contribute} />
        <Route exact path="/addhotel" Component={HotelForm} />
        <Route exact path="/addrestaurant" Component={RestaurantForm} />
        <Route exact path="/addplace" Component={PlaceForm} />

      </Routes>
    </BrowserRouter>
  );
}

export default App;
