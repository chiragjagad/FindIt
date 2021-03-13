import React from "react";
import "./App.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Login from "../pages/Login";
import Dashboard from "../pages/Dashboard";
import Register from "../pages/Register";
import SingleChat from "../pages/SingleChat";
import AllChats from "../pages/AllChats";

function App() {
  return (
    <>
<<<<<<< HEAD
      <Router>
        <Switch>
          <div className="App">
            <Route exact path="/register" component={Register}></Route>
            <Route exact path="/dashboard" component={Dashboard} />
            <Route exact path="/chat" component={AllChats} />
            <Route path="/chat/:chatId" component={SingleChat} />
            <Route exact path="/login" component={Login} />
          </div>
        </Switch>
      </Router>
    </>
=======
			<Router>
				<Switch>
					<div className="App">
						<Route exact path="/register" component={Register}></Route>
						<Route exact path="/dashboard" component={Dashboard} />
                        <Route exact path="/chats" component={AllChats}/>
                        <Route path="/chat/:chatId" component={SingleChat}/>
						<Route exact path="/login" component={Login} />
					</div>
				</Switch>
			</Router>
		</>

>>>>>>> f57c7f989519251e9ddf7a61dc4a966444642cd3
  );
}

export default App;
