import React from "react";
import "./App.css";
import Cards from "./Cards/Cards";
import Sidebar from "../components/Sidebar/Sidebar";
import TopNavbar from "../components/TopNavbar/TopNavbar";

function App() {
  return (
    <div className="App">
      <Sidebar />
      <div>
        <TopNavbar />
        <Cards />
      </div>
    </div>
  );
}

export default App;
