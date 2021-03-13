import React from "react";
import "./App.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Login from "../pages/Login";
import Dashboard from "../pages/Dashboard";
import Register from "../pages/Register";
import SingleChat from "../pages/SingleChat";
import AllChats from "../pages/AllChats";
import Testing from '../pages/Testing';

function App() {
  return (
    <>
			<Router>
				<Switch>
					<div className="App">
						<Route exact path="/register" component={Register}></Route>
						<Route exact path="/dashboard" component={Dashboard} />
                        <Route exact path="/chats" component={AllChats}/>
                        <Route path="/chat/:chatId" component={SingleChat}/>
						<Route exact path="/login" component={Login} />
						<Route exact path="/test" component={Testing} />
					</div>
				</Switch>
			</Router>
		</>

  );
}

export default App;
