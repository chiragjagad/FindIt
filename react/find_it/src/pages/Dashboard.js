import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import React, { useEffect } from "react";
import Cards from "../components/Cards/Cards";
import LostItems from "../components/LostItems";
import FoundItems from "../components/FoundItems";
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
            <Route exact path="/dashboard/founditems" component={FoundItems} />
          </div>
        </div>
      </Switch>
    </Router>
  );
};

export default Dashboard;
