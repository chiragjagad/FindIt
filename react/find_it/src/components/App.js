import React from "react";
import "./App.css";
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Login from '../pages/Login';
import Dashboard from '../pages/Dashboard';
import Register from '../pages/Register';
// import Chat from '../pages/Chat'

function App() {
  return (
    <>
			<Router>
				<Switch>
					<div className="App">
						<Route exact path="/register" component={Register}></Route>
						<Route exact path="/dashboard" component={Dashboard} />
						{/* <Route exact path="/talk" component={Chat} /> */}
						<Route exact path="/login" component={Login} />
					</div>
				</Switch>
			</Router>
		</>

  );
}

export default App;
