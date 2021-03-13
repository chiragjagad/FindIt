import React from "react";
import "./App.css";
import Sidebar from "../components/Sidebar/Sidebar";
import Cards from "./Cards/Cards";
function App() {
  return (
    <div className="App">
      <Sidebar />
      <Cards />
    </div>
  );
}

export default App;
