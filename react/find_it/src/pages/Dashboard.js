import React, { useEffect } from 'react';
import Cards from "../components/Cards/Cards";
import Sidebar from "../components/Sidebar/Sidebar";
import firebase from 'firebase';
import {useHistory} from 'react-router-dom';
import TopNavbar from "../components/TopNavbar/TopNavbar";
const Dashboard=()=>{
  const history = useHistory();
  useEffect(()=>{
    var user = firebase.auth().currentUser;
    if(!user){
      history.push("/login");
    }
  })
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
export default Dashboard;