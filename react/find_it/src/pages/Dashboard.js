import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Cards from "../components/Cards/Cards";
import LostItems from "../components/LostItems";
import Sidebar from "../components/Sidebar/Sidebar";
import TopNavbar from "../components/TopNavbar/TopNavbar";
import "./Dashboard.css";

const Dashboard = () => {
  return (
    <Router>
      <Switch>
        <div className="Dashboard">
          <Sidebar />
          <div>
            <Route></Route>
            <TopNavbar />
            <Route exact path="/dashboard" component={Cards} />
            <Route exact path="/dashboard/lostitems" component={LostItems} />
          </div>
        </div>
      </Switch>
    </Router>
  );
};
export default Dashboard;
