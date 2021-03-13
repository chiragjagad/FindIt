import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import React, { useEffect } from "react";
import Cards from "../components/Cards/Cards";
import LostItems from "../components/LostItems";
import Sidebar from "../components/Sidebar/Sidebar";
import firebase from "firebase";
import { useHistory } from "react-router-dom";
import TopNavbar from "../components/TopNavbar/TopNavbar";
import "./Dashboard.css";
const Dashboard = () => {
  const history = useHistory();
  useEffect(() => {
    var user = firebase.auth().currentUser;
    if (!user) {
      history.push("/login");
    }
  });
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
