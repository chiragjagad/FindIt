import React from "react";
import logo from "./img/findit-logo.png";
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

const Sidebar = () => {
  return (
    <>
      <ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        <Link to="/dashboard">
          <a class="sidebar-brand d-flex align-items-center justify-content-center">
            <div class="sidebar-brand-icon rotate-n-15">
              <img src={logo} style={{ height: "50px", width: "50px" }} />
            </div>
            <div class="sidebar-brand-text mx-3">Findit</div>
          </a>
        </Link>

        <hr class="sidebar-divider my-0"></hr>

        <li class="nav-item active">
          <Link to="/dashboard">
            <a class="nav-link" href="index.html">
              <i class="fas fa-fw fa-tachometer-alt"></i>
              <span>Dashboard</span>
            </a>
          </Link>
        </li>

        <hr class="sidebar-divider" />

        <div class="sidebar-heading">Features</div>

        <li class="nav-item">
          <Link to="/dashboard/lostitems">
            <a class="nav-link">
              <i class="fas fa-fw fa-folder"></i>
              <span>Lost Items</span>
            </a>
          </Link>
        </li>

        <li class="nav-item">
          <Link to="/dashboard/founditems">
            <a class="nav-link">
              <i class="fas fa-fw fa-chart-area"></i>
              <span>Found Items</span>
            </a>
          </Link>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="tables.html">
            <i class="fas fa-fw fa-comment-dots"></i>
            <span>ChatBox</span>
          </a>
        </li>

        <hr class="sidebar-divider d-none d-md-block" />
      </ul>
    </>
  );
};

export default Sidebar;
