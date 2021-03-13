import React from 'react';
import Cards from "../components/Cards/Cards";
import Sidebar from "../components/Sidebar/Sidebar";
import TopNavbar from "../components/TopNavbar/TopNavbar";
const Dashboard=()=>{
    
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