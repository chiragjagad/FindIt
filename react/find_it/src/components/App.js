import React from "react";
import "./App.css";
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Dashboard from '../pages/Dashboard';

function App() {
  return (
    <div className="App">
      <Dashboard/>
    </div>

  );
}

export default App;
